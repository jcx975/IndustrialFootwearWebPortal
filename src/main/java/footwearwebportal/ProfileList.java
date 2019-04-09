package footwearwebportal;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
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
			
		}
		return out.toString();
	}
}
