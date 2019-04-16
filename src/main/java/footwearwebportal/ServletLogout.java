package footwearwebportal;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/auth/logout")
public class ServletLogout extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {

		//invalidate the session if exists
		HttpSession session = request.getSession(false);
		if(request.isRequestedSessionIdValid() && session != null){
			session.invalidate();
		}

		Cookie[] cookies = request.getCookies();

		if(cookies != null){
			for(Cookie cookie : cookies){
				cookie.setMaxAge(0);
				System.out.println("deleted cookie: " + cookie.getName());
				response.addCookie(cookie);
			}
		}

		System.out.println("logged out");
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
}
