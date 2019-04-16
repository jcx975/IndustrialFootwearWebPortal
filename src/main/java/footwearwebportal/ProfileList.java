package footwearwebportal;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class ProfileList extends  HttpServlet {
	private DataConnect data = DataConnect.getInstance();

	public String generateListHTML() throws IOException, SQLException {
		StringWriter out = new StringWriter();
		ArrayList<CompanyData> companyData = data.allCompanyProfiles();
		Collections.sort(companyData);

		for (CompanyData company : companyData) {
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

	public String generateProfileInfoHTML(String companyID) throws IOException, SQLException {
		StringWriter out = new StringWriter();
		CompanyData company = data.getCompany(companyID);

		String companyName = company.getCompanyName();
		String city = company.getCity();
		String state = company.getState();
		String email = company.getEmail();
		String comments = company.getComments();

		out.append("<p id=\"currentCompanyName\">" + companyName + "</p>");
		if(city != null)
			out.append("<p id=\"currentCompanyCity\">" + city + "</p>");
		if(state != null)
			out.append("<p id=\"currentCompanyState\">" + state + "</p>");
		if(email != null)
			out.append("<p id=\"currentCompanyEmail\">" + email + "</p>");
		if(comments != null)
			out.append("<p id=\"currentCompanyComments\">" + comments + "</p>");

		return out.toString();
	}
}
