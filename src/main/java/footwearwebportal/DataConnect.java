package footwearwebportal;/*
 */

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;

public class DataConnect {
	private static DataConnect instance = new DataConnect();
	private static Connection dbconn;
	private PreparedStatement sql;

	public static DataConnect getInstance() {
		if (instance == null) {
			instance = new DataConnect();
		}
		return instance;
	}

	// Establish connection to MySQL server
	Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			try {
				// change URL to your database server as needed
				String dbPath = "jdbc:mysql://localhost:3306";
				dbconn = DriverManager.getConnection(dbPath, "root", "password");
				System.out.println("Connected to database");
				return dbconn;
			} catch (Exception s) {
				System.out.println(Arrays.toString(s.getStackTrace()));
			}
		} catch (Exception err) {
			System.out.println(Arrays.toString(err.getStackTrace()));
		}
		return null;
	}

	public ResultSet selectStatement(String query) {
		try {

			dbconn = instance.newConnection();
			assert dbconn != null;
			sql = dbconn.prepareStatement(query);
			ResultSet results;
			results = sql.executeQuery();
			System.out.println("query=" + query);

			// WARNING!
			// Need to process ResultSet before closing connection
			dbconn.close();
			return results;
		} catch (Exception err) {
			System.out.println(err.getMessage());
			return null;
		}
	}

	public boolean dbentry(String query) {
		try {
			System.out.println("query=" + query);
			instance.newConnection();

			sql = dbconn.prepareStatement(query);
			sql.executeUpdate(query);

			dbconn.close();
			return true;
		} catch (Exception err) {
			err.getStackTrace();
			return false;
		}
	}

	boolean closeConnection() throws SQLException {
		dbconn.close();
		return true;
	}

	public boolean entry(String id, String name, String city, String state) {

		try {
			instance.dbentry("INSERT INTO company ( `companyID`, `companyName`,`city`,`state``) " +
								"VALUES ("+id+",'"+name+"',"+city+",'"+state+");");	
								System.out.println("TESTING WORKING");
			return true;
		}
		catch ( Exception err ) {
			err.getStackTrace();
			err.printStackTrace();
			return false;
		}
	}

	public boolean userlookup(String user, String pass) throws SQLException {
		boolean result = false;
		PreparedStatement lookup = dbconn
				.prepareStatement("SELECT count(*) from footwearportal.user WHERE username = ? and password = ?");
		lookup.setString(1, user);
		lookup.setString(2, pass);

		ResultSet rs = lookup.executeQuery();

		rs.next();
		if (!rs.getString(1).equals("0")) { // not equal to zero = username/password exists
			result = true;
		}

		return result;
	}

	boolean userCreate(String user, String pass, String group, String firstName, String lastName, String email) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("insert into footwearportal.user(username, password, `group`, firstName, lastName, email) values(?, ?, ?, ?, ?, ?)");
		lookup.setString(1, user);
		lookup.setString(2, pass);
		lookup.setString(3, group);
		lookup.setString(4, firstName);
		lookup.setString(5, lastName);
		lookup.setString(6, email);

		lookup.executeUpdate();
		return true;
	}

	ArrayList<CompanyData> allCompanyProfiles() throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("select * from footwearportal.company");
		ResultSet rs = lookup.executeQuery();
		ArrayList<CompanyData> companyResult = new ArrayList<>();

		while(rs.next()){
			companyResult.add(new CompanyData(rs.getString(1), rs.getString(2),
					rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
		}

		return companyResult;
	}

	public boolean profileCreate(String companyName, String city, String state, String email, String comments) throws SQLException {
		PreparedStatement lookup = dbconn.prepareStatement("insert into footwearportal.company(companyName, city, state, email, comments) values (?, ?, ?, ?, ?)");
		lookup.setString(1, companyName);
		lookup.setString(2, city);
		lookup.setString(3, state);
		lookup.setString(4, email);
		lookup.setString(5, comments);

		lookup.executeUpdate();
		System.out.println("New company profile: " + lookup.toString());
		return true;
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
}