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
		//TODO: check if there is a user
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		if (type.equals("register")) {
			add(request, response);
		} else if (type.equals("login")) {
			login(request, response);
		} else if (type.equals("scoreFilter")) {
			filterScore(request, response);
		} else if (type.equals("categoriesFilter")) {
			filterCategories(request, response);
		}
	}

	//TODO: categories filter
	private void filterCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("filter by categories");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	//TODO: score filter
	private void filterScore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("filter by score");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	//TODO: login
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login");
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	//TODO: register
	private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("register");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		try {
			as.add(new Account(username, password, name, email));
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("failed register");
			//TODO: fixme
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
