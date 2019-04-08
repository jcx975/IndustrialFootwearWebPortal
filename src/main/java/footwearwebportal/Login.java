package footwearwebportal;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/** Simple servlet used to test server. */

@WebServlet("/login")

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		Enumeration<String> paramNames = request.getParameterNames();

		if (paramNames.hasMoreElements()) {

		}
	}

}
