package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import services.AccountService;

@WebServlet({"/Logout","/logout"})
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB 
	AccountService as;
	
    public Logout() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountService as = (AccountService) request.getSession().getAttribute("as");
		
		if (as == null || as.getCurrentUser() == null) {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		} else {
			as.logout();			
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
	}
}
