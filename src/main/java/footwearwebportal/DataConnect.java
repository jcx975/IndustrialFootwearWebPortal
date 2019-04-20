package footwearwebportal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

public class DataConnect {
	private static DataConnect instance;
	private static Connection dbconn;

	// instantiate DataConnect object if doesn't exist and return it
	public static DataConnect getInstance() {
		if (instance == null) {
			instance = new DataConnect();
		}
		return instance;
	}

	// Establish connection to MySQL server
	void newConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();

			try {
				// change URL to your database server as needed
				String dbPath = "jdbc:mysql://localhost:3306";
				try {
					dbconn = DriverManager.getConnection(dbPath, "root", "password");
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println("Connected to database");
			} catch (Exception s) {
				System.out.println(Arrays.toString(s.getStackTrace()));
			}
		} catch (Exception err) {
			System.out.println(Arrays.toString(err.getStackTrace()));
		}
	}

	// close database connection
	void closeConnection() throws SQLException {
		dbconn.close();
	}

	// takes username and password and returns true if combination exists in database
	String userLogin(String user, String pass) throws Exception {
		PreparedStatement lookup = dbconn
				.prepareStatement("SELECT password, UID from footwearportal.user WHERE username = ?");
		lookup.setString(1, user);

		ResultSet rs = lookup.executeQuery();
		int id = -1;

		rs.next();
		String securePassword = rs.getString(1);
		System.out.println("Lookup user: " + lookup.toString());
		if(securePassword.equals(Crypto.hashSHA256(pass))) {
			 id = rs.getInt(2);
		}

		// passwords in db are encrypted so encrypt new password then compare hashess
		return Integer.toString(id);
	}

	// creates new user with all parameters except ID (id is autoincremented)
	// returns the newly created user's auto gen ID
	String userCreate(User user) throws SQLException {
		String sql = "insert into footwearportal.user(username, password, `group`, firstName, lastName, email) values (?, ?, ?, ?, ?, ?)";
		PreparedStatement lookup = dbconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		lookup.setString(1, user.getUsername());

		String securePassword = null;
		try {
			securePassword = Crypto.hashSHA256(user.getPassword()); // hash password with SHA256
		} catch (Exception e) {
			e.printStackTrace();
		}

		assert securePassword != null;
		lookup.setString(2, securePassword);
		lookup.setString(3, user.getGroup());
		lookup.setString(4, user.getFirstName());
		lookup.setString(5, user.getLastName());
		lookup.setString(6, user.getEmail());

		lookup.executeUpdate();

		ResultSet rs = lookup.getGeneratedKeys();
		rs.next();
		System.out.println("New user: " + lookup.toString());
		return Integer.toString(rs.getInt(1)); // return newly created user id
	}

	@SuppressWarnings("Duplicates")
	public User getUserInfo(String UID) throws SQLException{
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.user where UID = ?");
		lookup.setString(1, UID);

		String username = "";
		String password = "";
		String group = "";
		String firstName = "";
		String lastName = "";
		String email = "";
		ResultSet rs = lookup.executeQuery();

		while (rs.next()) {
			UID = rs.getString(1);
			username = rs.getString(2);
			password = rs.getString(3);
			group = rs.getString(4);
			firstName = rs.getString(5);
			lastName = rs.getString(6);
			email = rs.getString(7);
		}

		System.out.println("Get user profile: " + lookup.toString());

		return new User(UID, username, password, group, firstName, lastName, email);
	}

	// return arraylist<companydata> containing all company profiles in database
	ArrayList<Company> allCompanyProfiles() throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.company");
		ResultSet rs = lookup.executeQuery();
		ArrayList<Company> companyResult = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString(1);
			String name = rs.getString(2);
			String city = rs.getString(3);
			String state = rs.getString(4);
			String email = rs.getString(5);
			String comments = rs.getString(6);

			companyResult.add(new Company(id, name, city, state, email, comments));
		}
		System.out.println("Get all company profiles");
		return companyResult;
	}

	// creates new user with all parameters except ID (id is autoincremented)
	// returns the newly created user's auto gen ID
	public String profileCreate(Company company) throws SQLException {
		String sql = "insert into footwearportal.company(companyName, city, state, email, comments) values (?, ?, ?, ?, ?)";
		PreparedStatement lookup = dbconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		lookup.setString(1, company.getCompanyName());
		lookup.setString(2, company.getCity());
		lookup.setString(3, company.getState());
		lookup.setString(4, company.getEmail());
		lookup.setString(5, company.getComments());

		lookup.executeUpdate();
		System.out.println("New company profile: " + lookup.toString());
		ResultSet rs = lookup.getGeneratedKeys();
		rs.next();
		return Integer.toString(rs.getInt(1)); // returns newly created profile id
	}

	// finds companydata from database that matches the ID
	@SuppressWarnings("Duplicates")
	public Company getCompany(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.company where companyID = ?");
		lookup.setString(1, companyID);
		String id = "";
		String name = "";
		String city = "";
		String state = "";
		String email = "";
		String comments = "";
		ResultSet rs = lookup.executeQuery();

		while (rs.next()) {
			id = rs.getString(1);
			name = rs.getString(2);
			city = rs.getString(3);
			state = rs.getString(4);
			email = rs.getString(5);
			comments = rs.getString(6);
		}

		System.out.println("Get company profile: " + lookup.toString());
		return new Company(id, name, city, state, email, comments);
	}

	public boolean deleteProfile(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("delete from footwearportal.company where companyID = ?");
		lookup.setString(1, companyID);

		lookup.executeUpdate();
		System.out.println("Delete company profile: " + lookup.toString());
		return true;
	}

	public boolean updateProfile(Company company) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("update footwearportal.company " +
				"SET companyName = ?, city = ?, state = ?, email = ?, comments = ? " +
				"WHERE companyID = ?");
		lookup.setString(1, company.getCompanyName());
		lookup.setString(2, company.getCity());
		lookup.setString(3, company.getState());
		lookup.setString(4, company.getEmail());
		lookup.setString(5, company.getComments());
		lookup.setString(6, company.getCompanyID());

		lookup.executeUpdate();
		System.out.println("Update company profile: " + lookup.toString());
		return true;
	}

	//Create account for supervisor
	public String supervisorCreate(Supervisor supervisor) throws SQLException {
		String UID = userCreate(supervisor.getUser());
		PreparedStatement lookup = dbconn.prepareStatement("insert into footwearportal.supervisor values (?, ?)");
		lookup.setString(1, UID);
		lookup.setString(2, supervisor.getCompanyID());

		lookup.executeUpdate();
		System.out.println("New supervisor: " + lookup.toString());
		return UID;
	}

	//Get list of supervisor accounts under company
	ArrayList<Supervisor> supervisorProfiles(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.supervisor where companyID = ?");
		lookup.setString(1, companyID);
		ResultSet rs = lookup.executeQuery();
		ArrayList<Supervisor> supervisorResult = new ArrayList<>();

		while (rs.next()) {
			String id = rs.getString(1);

			User user = getUserInfo(id);

			supervisorResult.add(new Supervisor(user, companyID));
		}

		System.out.println("Get all supervisors from: " + lookup.toString());
		return supervisorResult;
	}

	public boolean deleteSupervisor(String UID, String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("delete from footwearportal.supervisor where UID = ? and companyID = ?");
		lookup.setString(1, UID);
		lookup.setString(2, companyID);

		lookup.executeUpdate();
		System.out.println("Delete supervisor: " + lookup.toString());
		return deleteUser(UID);
	}

	//Update user account basic (no password/username/group)
	public boolean updateUserBasic(String firstName, String lastName, String email, String UID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("update footwearportal.user " +
				"SET firstName = ?, lastName = ?, email = ? " +
				"WHERE UID = ?");
		lookup.setString(1, firstName);
		lookup.setString(2, lastName);
		lookup.setString(3, email);
		lookup.setString(4, UID);

		lookup.executeUpdate();
		System.out.println("Update user basic: " + lookup.toString());
		return true;
	}

	//Update user password
	public boolean updateUserPassword(User user) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("update footwearportal.user " +
				"SET password = ? " +
				"WHERE UID = ?");

		lookup.setString(1, Crypto.hashSHA256(user.getPassword()));
		lookup.setString(2, user.getUID());

		lookup.executeUpdate();
		System.out.println("Update user password: " + lookup.toString());
		return true;
	}

	boolean deleteUser(String id) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("delete from footwearportal.user where UID = ?");
		lookup.setString(1, id);

		lookup.executeUpdate();
		System.out.println("Delete user: " + lookup.toString());
		return true;
	}

	//Create program
	public String programCreate(Program program) throws SQLException {
		String sql = "insert into footwearportal.program(companyID, programName, programDesc, discount) values (?, ?, ?, ?)";
		PreparedStatement lookup = dbconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		lookup.setString(1, program.getCompanyID());
		lookup.setString(2, program.getProgramName());
		lookup.setString(3, program.getProgramDesc());
		lookup.setString(4, program.getDiscount());
	

		lookup.executeUpdate();
		System.out.println("New program: " + lookup.toString());
		ResultSet rs = lookup.getGeneratedKeys();
		rs.next();
		return Integer.toString(rs.getInt(1)); // returns newly created progam id
	}
	
	//Change program
	public boolean updateProgram(Program program) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("update footwearportal.program " +
				"SET programName = ?, programDesc = ?, discount = ? " +
				"WHERE programID = ?");
		lookup.setString(1, program.getProgramName());
		lookup.setString(2, program.getProgramDesc());
		lookup.setString(3, program.getDiscount());
		lookup.setString(4, program.getProgramID());

		lookup.executeUpdate();
		System.out.println("Update program: " + lookup.toString());
		return true;
	}

	//Get list of programs under company
	ArrayList<Program> programList(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.program where companyID = ?");
		lookup.setString(1, companyID);
		ResultSet rs = lookup.executeQuery();
		ArrayList<Program> programResult = new ArrayList<>();

		while (rs.next()) {
			String programID = rs.getString(1);
			String programName = rs.getString(3);
			String programDesc = rs.getString(4);
			String discount = rs.getString(5);

			programResult.add(new Program(programID, companyID, programName, programDesc, discount));
		}

		System.out.println("Get all programs from: " + lookup.toString());
		return programResult;
	}

	//Get program details
	public Program getProgram(String programID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.program where programID = ?");
		lookup.setString(1, programID);
		String id = "";
		String name = "";
		String desc = "";
		String discount = "";
		String progID = "";

		ResultSet rs = lookup.executeQuery();

		while (rs.next()) {
			progID = rs.getString(1);
			id = rs.getString(2);
			name = rs.getString(3);
			desc = rs.getString(4);
			discount = rs.getString(5);
		}

		System.out.println("Get program: " + lookup.toString());
		return new Program(progID, id, name, desc, discount);
	}


	//Delete program
	public boolean deleteProgram(String id) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("delete from footwearportal.program where programID = ?");
		lookup.setString(1, id);

		lookup.executeUpdate();
		System.out.println("Delete program: " + lookup.toString());
		return true;
	}
}