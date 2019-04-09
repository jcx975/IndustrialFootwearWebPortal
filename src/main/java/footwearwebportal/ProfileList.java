package footwearwebportal;

import javax.servlet.http.*;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

public class ProfileList extends  HttpServlet {
	DataConnect data = serverInit.getConnection();

	public String createList() throws IOException, SQLException {
		StringWriter out = new StringWriter();
		ArrayList<CompanyData> companyData = data.allCompanyProfiles();
		Iterator<CompanyData> itr = companyData.iterator();

		while(itr.hasNext()){
			CompanyData company = itr.next();
			out.append("<div class=\"col-md-6 mb-5 profile-container\">");
			out.append("<div class=\"company-profile\">");
			out.append("<p class=\"profile-name\">" + company.companyName + "</p>");
			out.append("<p>" + company.city + ", " + company.state + "</p>");
			out.append("<form action=\"company.jsp\" method=\"GET\"");
			out.append("<input type=\"hidden\" name=\"id\" value=\"" + company.id + "\">");
			out.append("<input class=\"btn btn-primary\" type=\"submit\" value=\"View Details\"></form>");
			out.append("</div>");
			out.append("</div>");
		}

		return out.toString();
	}
}
