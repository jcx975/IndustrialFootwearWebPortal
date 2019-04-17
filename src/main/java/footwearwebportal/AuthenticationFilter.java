package footwearwebportal;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class AuthenticationFilter implements Filter {

	public void init(FilterConfig fConfig)  {
		ServletContext context = fConfig.getServletContext();
		System.out.println("AuthenticationFilter initialized");
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

			HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;

		HttpSession session = req.getSession(false);

		//TODO: also authenticate based on user group
		if (session == null || session.getAttribute("user") == null) {   //checking whether the session exists
			System.out.println("Unauthorized access request");
			res.sendRedirect(req.getContextPath() + "/index.jsp");
		} else {
			// pass the request along the filter chain
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
		//close any resources here
	}
}
