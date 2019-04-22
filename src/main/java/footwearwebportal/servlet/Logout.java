package footwearwebportal.servlet;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class Logout extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html");

		//invalidate the session if exists
		HttpSession session = request.getSession(false);
		if(session != null){
			session.removeAttribute("user");
			session.invalidate();
		}

		System.out.println("logged out");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
}
