package footwearwebportal;

import javax.servlet.http.HttpServlet;

public class serverInit extends HttpServlet {
	public void init(){
		System.out.println("----------");
		System.out.println("---------- Server Successfully Started ----------");
		System.out.println("----------");

		DataConnect data = DataConnect.getInstance();
		data.newConnection();

		System.out.println("----------");
		System.out.println("---------- Connected to SQL database ----------");
		System.out.println("----------");
	}
}
