package footwearwebportal.servlet;

import footwearwebportal.Company;
import footwearwebportal.DataConnect;
import footwearwebportal.Program;
import footwearwebportal.Supervisor;

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
			out.append("<div class=\"col-md-6 mb-5 profile-container\">");
			out.append("<div class=\"company-profile\">");
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

	public static String generateSupervisorListHTML(String companyID) throws  SQLException {
		DataConnect data = DataConnect.getInstance();

		StringWriter out = new StringWriter();
		ArrayList<Supervisor> supervisors = data.supervisorProfiles(companyID);
		Collections.sort(supervisors);

		for (Supervisor supervisor : supervisors) {
			out.append("<div class=\"col-md-6 supervisor-container\">");
			out.append("<form action=\"supervisor.jsp\" method=\"GET\">");
			out.append("<div class=\"program-profile border d-flex flex-column\">");
			out.append("<p class=\"profile-name\">" + supervisor.getLastName() + ", " + supervisor.getFirstName() + "</p>");
			out.append("<p>" + supervisor.getEmail() + "</p>");
			out.append("<input type=\"hidden\" name=\"supervisorID\" value=\"" + supervisor.getUID() + "\">");
			out.append("<input type=\"hidden\" name=\"companyID\" value=\"" + supervisor.getCompanyID() + "\">");
			out.append("<input type=\"submit\" class=\"btn btn-primary\" value=\"View\">");
			out.append("</div>");
			out.append("</form>");
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
			out.append("<div class=\"col-md-6 supervisor-container\">");
			out.append("<form action=\"program.jsp\" method=\"GET\">");
			out.append("<div class=\"program-profile border d-flex flex-column\">");
			out.append("<p class=\"profile-name\">" + program.getProgramName() + "</p>");
			out.append("<p>" + program.getProgramDesc() + "</p>");
			out.append("<input type=\"hidden\" name=\"programID\" value=\"" + program.getProgramID() + "\">");
			out.append("<input type=\"submit\" class=\"btn btn-primary\" value=\"View\">");
			out.append("</div>");
			out.append("</form>");
			out.append("</div>");
		}

		return out.toString();
	}

	public static boolean checkRequest(String input){
		return (input != null && !input.trim().equals(""));
	}
}
