package footwearwebportal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class testConnect {
	public static void main(String[] args){
		DataConnect data = DataConnect.getInstance();
		data.newConnection();
		try {
			//Crypto.generateKeys();
			System.out.println(data.userCreate(new User("tim", "password", "manager", "Tim", "Jensen", "tim@jensen.com")));
			System.out.println(data.supervisorCreate(new Supervisor("bob", "password", "supervisor", "Bob", "Jackson", "tim@jensen.com", "1")));
			//System.out.println(data.userCreate(new User("tom", "password", "employee", "Tom", "Hanson", "tim@jensen.com")));
			//System.out.println(data.userLogin("tim", "password"));
			//generateProfileInfoHTML(data);
			printAllProfile(data.allCompanyProfiles());
			System.out.println(Arrays.toString(data.supervisorProfiles("1").toArray()));

			data.closeConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void createProfile(DataConnect data) throws  SQLException {
		String input = "1";
		String companyName, city, state, email, comments;
		Scanner in = new Scanner(System.in);

		while(!input.equals("0")){
			System.out.println("Company name: ");
			input = in.nextLine();
			companyName = input;

			System.out.println("City: ");
			input = in.nextLine();
			city = input;

			System.out.println("State: ");
			input = in.nextLine();
			state = input;

			System.out.println("Email: ");
			input = in.nextLine();
			email = input;

			System.out.println("Comments: ");
			input = in.nextLine();
			comments = input;
			if(!input.equals("0"))
				data.profileCreate(new Company(companyName, city, state, email, comments));
		}
	}

	private static void printAllProfile(ArrayList<Company> list) throws SQLException {
		System.out.println(Arrays.toString(list.toArray()));
	}
}
