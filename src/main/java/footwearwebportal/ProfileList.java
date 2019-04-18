package footwearwebportal;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class ProfileList extends  HttpServlet {
	private DataConnect data = DataConnect.getInstance();

	public String generateListHTML() throws SQLException {
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

	public String generateSupervisorListHTML(String companyID) throws  SQLException {
		StringWriter out = new StringWriter();
		ArrayList<Supervisor> supervisors = data.supervisorProfiles(companyID);
		Collections.sort(supervisors);

		for (Supervisor supervisor : supervisors) {
			out.append("<div class=\"col-md-6 supervisor-container\">");
			out.append("<form action=\"supervisor.jsp\" method=\"GET\">");
			out.append("<div class=\"program-profile border d-flex flex-column\">");
			out.append("<p class=\"profile-name\">" + supervisor.getLastName() + ", " + supervisor.getFirstName() + "</p>");
			out.append("<p>" + supervisor.getEmail() + "</p>");
			out.append("<input type=\"hidden\" name=\"id\" value=\"" + supervisor.getUID() + "\">");
			out.append("<input type=\"hidden\" name=\"companyID\" value=\"" + supervisor.getCompanyID() + "\">");
			out.append("<input type=\"submit\" class=\"btn btn-primary\" value=\"View\">");
			out.append("</div>");
			out.append("</form>");
			out.append("</div>");
		}

		return out.toString();
	}
}
