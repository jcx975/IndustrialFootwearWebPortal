package footwearwebportal;/*
 */

import java.sql.*;
import java.util.Arrays;

public class DataConnect {
	static DataConnect instance = new DataConnect();
	static Connection dbconn;
	ResultSet results = null;
	PreparedStatement sql;
	String dpwd = null;
	StringBuilder sb = new StringBuilder();

	// change URL to your database server as needed
	String dbPath = "jdbc:mysql://localhost:3306";

	public static DataConnect getInstance() {
		if (instance == null) {
			instance = new DataConnect();
		}
		return instance;
	}

	// Establish connection to MySQL server
	public Connection newConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();

			try {
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

	public static boolean userlookup(String user, String pass) throws SQLException {
		instance.newConnection();
		boolean result = false;
		PreparedStatement lookup = dbconn
				.prepareStatement("SELECT count(*) from user WHERE username = ? and password = ?");
		lookup.setString(1, user);
		lookup.setString(2, pass);

		ResultSet rs = lookup.executeQuery();

		rs.next();
		if (!rs.getString(1).equals("0")) { // not equal to zero = username/password exists
			result = true;
		}

		dbconn.close();
		return result;
	}

	public boolean userCreate(String UID, String user, String pass, String group, String firstName, String lastName) throws SQLException {
		boolean result = true;
		instance.newConnection();
		PreparedStatement lookup = dbconn.prepareStatement("insert into footwearportal.user values(?, ?, ?, ?, ?, ?)");
		lookup.setString(1, UID);
		lookup.setString(2, user);
		lookup.setString(3, pass);
		lookup.setString(4, group);
		lookup.setString(5, firstName);
		lookup.setString(6, lastName);

		lookup.executeUpdate();
		dbconn.close();
		return result;
	}
}