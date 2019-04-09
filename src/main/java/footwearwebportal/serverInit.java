package footwearwebportal;

import javax.servlet.*;
import javax.servlet.http.HttpServlet;

public class serverInit extends HttpServlet {
	public static DataConnect data = new DataConnect();

	public void init() throws ServletException{
		System.out.println("----------");
		System.out.println("---------- Server Successfully Started ----------");
		System.out.println("----------");

		data.newConnection();
		System.out.println("----------");
		System.out.println("---------- Connected to SQL database ----------");
		System.out.println("----------");
	}

	public static DataConnect getConnection(){
		return data;
	}
}
