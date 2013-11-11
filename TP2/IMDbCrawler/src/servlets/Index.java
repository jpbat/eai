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
		if (type == null)  {
			System.out.println("type is null");
			return;
		}
		System.out.println(type);
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
		
		String[] selected = request.getParameterValues("category");
		
		for (int i = 0; i < selected.length; i++) {
			System.out.println(selected[i]);
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	//TODO: score filter
	private void filterScore(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("filter by score");
		
		String selected = request.getParameter("score");
		
		if (selected.equals("bigger")) {
			double v = Double.parseDouble(request.getParameter("valueBigger"));
			System.out.println("bigger then: " + v);
		} else if (selected.equals("less")) {
			double v = Double.parseDouble(request.getParameter("valueLess"));
			System.out.println("less then: " + v);
		} else {
			double v1 = Double.parseDouble(request.getParameter("valueBetweenSmaller"));
			double v2 = Double.parseDouble(request.getParameter("valueBetweenBigger"));
			System.out.println("between " + v1 + " and " + v2);
		}
		
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
