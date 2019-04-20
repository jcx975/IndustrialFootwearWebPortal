package footwearwebportal.servlet;

import footwearwebportal.DataConnect;

import javax.servlet.http.HttpServlet;

public class serverInit extends HttpServlet {
	public void init(){
		System.out.println("----------                             ----------");
		System.out.println("---------- Server Successfully Started ----------");
		System.out.println("----------                             ----------");

		DataConnect data = DataConnect.getInstance();

		if(data.newConnection()) {
			System.out.println("----------                           ----------");
			System.out.println("---------- Connected to SQL database ----------");
			System.out.println("----------                           ----------");
		} else {
			System.out.println("----------                                 ----------");
			System.out.println("---------- SQL Database connection failure ----------");
			System.out.println("----------                                 ----------");
		}
	}
}
