package footwearwebportal.servlet;

import footwearwebportal.DataConnect;
import footwearwebportal.User;

import java.io.*;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/login")
public class Login extends HttpServlet
{
	public void doPost(HttpServletRequest request,
					  HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
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

			User user = new User();
			try {
				user = data.getUserInfo(flag);
				newSession.setAttribute("UID", user.getUID());
			} catch (SQLException e) {
				e.printStackTrace();
			}

			switch(user.getGroup()){
				case "manager":
					response.sendRedirect("manager");
					break;
				case "supervisor":
					response.sendRedirect("supervisor");
					break;
				case "employee":
					response.sendRedirect("employee");
					break;
				default:
					authFail(request, response);
			}
		} else {
			authFail(request, response);
		}
	}

	private void authFail(HttpServletRequest request,
						  HttpServletResponse response) throws IOException, ServletException {
		RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
		PrintWriter out = response.getWriter();
		out.println("<font color=red>Incorrect login</font>");
		rd.include(request, response);
	}
}
