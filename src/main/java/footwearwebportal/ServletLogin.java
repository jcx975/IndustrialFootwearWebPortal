package footwearwebportal;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class ServletLogin extends HttpServlet
{
	public void doPost(HttpServletRequest request,
					  HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter pwriter = response.getWriter();
		DataConnect data = DataConnect.getInstance();
		String flag = "-1";

		String username = request.getParameter("username");
		String password = request.getParameter("password");

		if(username != null && !username.trim().equals("")){
			try{
				flag = data.userLogin(username, password);
			} catch (Exception e){
				e.printStackTrace();
			}
		}

		if(!flag.equals("-1")){
			HttpSession oldSession = request.getSession(false);

			if(oldSession != null){
				oldSession.invalidate();
			}

			HttpSession newSession = request.getSession(true);

			newSession.setMaxInactiveInterval(5*60);

			Cookie idCookie = new Cookie("userID", flag);
			response.addCookie(idCookie);
			response.sendRedirect("auth/retailmanager.jsp");
		} else {
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
			PrintWriter out = response.getWriter();
			out.println("<font color=red>Incorrect login</font>");
			rd.include(request, response);
		}
	}
}
