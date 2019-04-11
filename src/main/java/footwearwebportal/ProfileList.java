package footwearwebportal;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;

public class ProfileList extends  HttpServlet {
	DataConnect data = serverInit.getConnection();

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

		out.append("<p id=\"currentCompanyName\">" + company.getCompanyName() + "</p>");
		out.append("<p id=\"currentCompanyCity\">" + company.getCity() + "</p>");
		out.append("<p id=\"currentCompanyState\">" + company.getState() + "</p>");
		out.append("<p id=\"currentCompanyEmail\">" + company.getEmail() + "</p>");
		out.append("<p id=\"currentCompanyComments\">" + company.getComments() + "</p>");

		return out.toString();
	}
}
