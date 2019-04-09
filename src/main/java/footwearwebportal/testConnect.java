package footwearwebportal;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Scanner;

public class testConnect {
	public static void main(String[] args){
		DataConnect data = new DataConnect();
		data.newConnection();
		try {
			//data.userCreate("5", "tim", "password", "rm", "Tim", "Jensen");
			//System.out.println(data.userlookup("tim", "password"));
			//createProfile(data);
			printAllProfile(data.allCompanyProfiles());
			data.closeConnection();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private static void createProfile(DataConnect data) throws  SQLException {
		String input = "1";
		String companyID, companyName, city, state;
		Scanner in = new Scanner(System.in);

		while(!input.equals("0")){
			System.out.println("CompanyID: ");
			input = in.nextLine();
			companyID = input;

			System.out.println("Company name: ");
			input = in.nextLine();
			companyName = input;

			System.out.println("City: ");
			input = in.nextLine();
			city = input;

			System.out.println("State: ");
			input = in.nextLine();
			state = input;

			data.profileCreate(companyID, companyName, city, state);
		}
	}

	private static void printAllProfile(ArrayList<CompanyData> list) throws SQLException {
		System.out.println(Arrays.toString(list.toArray()));
	}
}
