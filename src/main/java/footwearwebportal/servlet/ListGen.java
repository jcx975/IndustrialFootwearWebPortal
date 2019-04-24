package footwearwebportal.servlet;

import footwearwebportal.*;

import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class ListGen {

	public static String generateListHTML() throws SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Company> companyData = data.allCompanyProfiles();
		Collections.sort(companyData);

		for (Company company : companyData) {
			out.append("<div class=\"col-md-4 mb-3 profile-container\">");
			out.append("<div class=\"company-profile border\">");
			out.append("<p class=\"profile-name\">" + company.getCompanyName() + "</p>");
			out.append("<p>" + company.getCity() + ", " + company.getState() + "</p>");
			out.append("<form action=\"company.jsp\" method=\"GET\">");
			out.append("<input type=\"hidden\" name=\"id\" value=\"" + company.getCompanyID() + "\">");
			out.append("<input class=\"btn btn-primary\" type=\"submit\" value=\"View Details\"></form>");
			out.append("</div>");
			out.append("</div>");
		}

		return out.toString();
	}

	public static String generateSupervisorListHTML(String companyID, boolean link) throws  SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Supervisor> supervisors = data.supervisorProfiles(companyID);
		Collections.sort(supervisors);

		for (Supervisor supervisor : supervisors) {
			out.append("<div class=\"col-md-6 supervisor-container\">");
			if(link) out.append("<form action=\"supervisor.jsp\" method=\"GET\">");
			out.append("<div class=\"program-profile border d-flex flex-column\">");
			out.append("<p class=\"profile-name\">" + supervisor.getLastName() + ", " + supervisor.getFirstName() + "</p>");
			out.append("<p>" + supervisor.getEmail() + "</p>");
			if(link) {
				out.append("<input type=\"hidden\" name=\"supervisorID\" value=\"" + supervisor.getUID() + "\">");
				out.append("<input type=\"hidden\" name=\"companyID\" value=\"" + supervisor.getCompanyID() + "\">");
				out.append("<input type=\"submit\" class=\"btn btn-primary\" value=\"View\">");
			}
			out.append("</div>");
			if(link) out.append("</form>");
			out.append("</div>");
		}

		return out.toString();
	}

	public static String generateProgramListHTML(String companyID) throws  SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Program> programs = data.programList(companyID);
		Collections.sort(programs);

		for (Program program : programs) {
			out.append("<div class=\"col-md-12 program-container\">");
			out.append("<div class=\"program-profile border\">");
			out.append("<form action=\"program.jsp\" method=\"GET\">");
			out.append("<div class=\"row\">");
			out.append("<div class=\"col-6\">");
			out.append("<h3 class=\"profile-name\">" + program.getProgramName() + "</h3>");
			out.append("<p class=\"profile-desc\">" + program.getProgramDesc() + "</p>");
			out.append("</div>");
			out.append("<div class=\"col-6 d-flex\">");
			out.append("<input type=\"hidden\" name=\"programID\" value=\"" + program.getProgramID() + "\">");
			out.append("<input type=\"submit\" class=\"btn ml-auto btn-primary\" value=\"View\">");
			out.append("</div>");
			out.append("</div>");
			out.append("</form>");
			out.append("</div>");
			out.append("</div>");
		}

		return out.toString();
	}

	public static boolean checkRequest(String input){
		return (input != null && !input.trim().equals(""));
	}

	@SuppressWarnings("Duplicates")
	public static String generateShoeListHTML() throws SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Shoe> shoes = data.allShoes();
		Collections.sort(shoes);

		for (Shoe shoe : shoes) {
			out.append("<div class=\"col-md-4 mb-3 profile-container\">");
			out.append("<div class=\"company-profile border\">");
			out.append("<p class=\"profile-name\">" + shoe.getShoeName() + "</p>");
			out.append("<form action=\"shoe.jsp\" method=\"GET\">");
			out.append("<input type=\"hidden\" name=\"shoeID\" value=\"" + shoe.getShoeID() + "\">");
			out.append("<input class=\"btn btn-primary\" type=\"submit\" value=\"View Details\"></form>");
			out.append("</div>");
			out.append("</div>");
		}

		return out.toString();
	}

	public static String generateShoeSelectHTML() throws  SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Shoe> shoes = data.allShoes();
		Collections.sort(shoes);

		for (Shoe shoe : shoes) {
			out.append("<option value=\"" + shoe.getShoeID() + "\">" + shoe.getShoeName() + "</option>");
		}

		return out.toString();
	}

	public static String generateProgramShoeListHTML(String programID, boolean link) throws  SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Shoe> shoes = data.programShoeList(programID);
		if(shoes.isEmpty())
			return "";

		int shoeDiscount = Integer.parseInt(data.getProgram(programID).getDiscount());
		Collections.sort(shoes);

		for (Shoe shoe : shoes) {
			double discountPrice = Double.parseDouble(shoe.getShoePrice()) * (1.00 - (shoeDiscount / 100.00));
			out.append("<div class=\"col-md-6 supervisor-container\">");
			if(link) out.append("<form action=\"program.jsp?programID=" + programID +"\" method=\"POST\">");
			out.append("<div class=\"program-profile border d-flex flex-column\">");
			out.append("<p class=\"shoe-name\">" + shoe.getShoeName() + "</p>");
			out.append("<p>$" + shoe.getShoePrice() + "</p>");
			out.append("<p>$" + discountPrice + "</p>");
			if(link) {
				out.append("<input type=\"hidden\" name=\"removeShoe\" value=\"" + shoe.getShoeID() + "\">");
				out.append("<input type=\"submit\" class=\"btn btn-primary\" value=\"Remove\">");
			}
			out.append("</div>");
			if(link) out.append("</form>");
			out.append("</div>");
		}

		return out.toString();
	}
}
