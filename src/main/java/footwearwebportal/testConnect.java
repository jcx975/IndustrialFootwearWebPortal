package footwearwebportal;

import java.sql.SQLException;

public class testConnect {
	public static void main(String[] args){
		DataConnect data = new DataConnect();
		try {
			data.userCreate("5", "tim", "password", "rm", "Tim", "Jensen");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
