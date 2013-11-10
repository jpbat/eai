package servlets;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import services.AccountService;

@WebServlet({"/Index","/index"})
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB 
	AccountService as;  
    
	public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		if (type.equals("register")) {
			System.out.println("register");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			try {
				//TODO: add user
				as.add(new Account(username, password, name, email));
				request.getRequestDispatcher("/").forward(request, response);
			} catch (Exception e) {
				System.out.println("failed register");
				//TODO: failed register
				e.printStackTrace();
			}
		} else if (type.equals("login")) {
			System.out.println("login");
			//TODO: login
			request.getRequestDispatcher("/").forward(request, response);
		} else if (type.equals("scoreFilter")) {
			System.out.println("filter by score");
			//TODO: score filter
			request.getRequestDispatcher("/").forward(request, response);
		} else if (type.equals("categoriesFilter")) {
			System.out.println("filter by categories");
			//TODO: categories filter
			request.getRequestDispatcher("/").forward(request, response);
		} else {
			//TODO: fuck this shit
			request.getRequestDispatcher("login").forward(request, response);
		}
	}
}
