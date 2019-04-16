package footwearwebportal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

public class DataConnect {
	private static DataConnect instance;
	private static Connection dbconn;
	private static Crypto crypto;

	public static DataConnect getInstance() {
		if (instance == null) {
			instance = new DataConnect();
			try {
				crypto = Crypto.getInstance();
			} catch (Exception e) {
				e.printStackTrace();
			}
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
				try {dbconn = DriverManager.getConnection(dbPath, "root", "password");}
				catch(Exception e){ e.printStackTrace();}
				System.out.println("Connected to database");
			} catch (Exception s) {
				System.out.println(Arrays.toString(s.getStackTrace()));
			}
		} catch (Exception err) {
			System.out.println(Arrays.toString(err.getStackTrace()));
		}
	}

	void closeConnection() throws SQLException {
		dbconn.close();
	}

	public boolean userlookup(String user, String pass) throws Exception {
		PreparedStatement lookup = dbconn
				.prepareStatement("SELECT password from footwearportal.user WHERE username = ?");
		lookup.setString(1, user);

		ResultSet rs = lookup.executeQuery();

		rs.next();
		String securePassword = rs.getString(1);
		return securePassword.equals(crypto.encrypt(pass));
	}

	String userCreate(UserInfo user) throws SQLException {
		String sql = "insert into footwearportal.user(username, password, `group`, firstName, lastName, email) values (?, ?, ?, ?, ?, ?)";
		PreparedStatement lookup = dbconn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		lookup.setString(1, user.getUsername());

		String securePassword = null;
		try {
			securePassword = crypto.encrypt(user.getPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}

		lookup.setString(2, securePassword);
		lookup.setString(3, user.getGroup());
		lookup.setString(4, user.getFirstName());
		lookup.setString(5, user.getLastName());
		lookup.setString(6, user.getEmail());

		lookup.executeUpdate();

		ResultSet rs = lookup.getGeneratedKeys();
		rs.next();
		return Integer.toString(rs.getInt(1)); // return newly created user id
	}

	ArrayList<CompanyData> allCompanyProfiles() throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.company");
		ResultSet rs = lookup.executeQuery();
		ArrayList<CompanyData> companyResult = new ArrayList<>();

		while(rs.next()){
			String id = rs.getString(1);
			String name = rs.getString(2);
			String city = rs.getString(3);
			String state = rs.getString(4);
			String email = rs.getString(5);
			String comments = rs.getString(6);

			companyResult.add(new CompanyData(id, name, city, state, email, comments));
		}

		return companyResult;
	}

	public String profileCreate(CompanyData company) throws SQLException {
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

	public CompanyData getCompany(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.company where companyID = ?");
		lookup.setString(1, companyID);
		String id = "";
		String name = "";
		String city = "";
		String state = "";
		String email = "";
		String comments = "";
		ResultSet rs = lookup.executeQuery();

		while(rs.next()){
			id = rs.getString(1);
			name = rs.getString(2);
			city = rs.getString(3);
			state = rs.getString(4);
			email = rs.getString(5);
			comments = rs.getString(6);
		}

		return new CompanyData(id, name, city, state, email, comments);
	}

	public boolean deleteProfile(String companyID) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("delete from footwearportal.company where companyID = ?");
		lookup.setString(1, companyID);

		lookup.executeUpdate();
		return true;
	}

	public boolean updateProfile(CompanyData company) throws SQLException {
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
}