package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Account;
import models.Genre;
import models.Movie;
import services.AccountService;
import services.MovieService;

@WebServlet({"/Index","/index"})
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB 
	AccountService as;  
	@EJB 
	MovieService ms;
	
	public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountService as = (AccountService) request.getSession().getAttribute("as");
		if (as == null || as.getCurrentUser() == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
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

	private void filterCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("filter by categories");
		ArrayList<Movie> movies;
		ArrayList<String> result = new ArrayList<String>();
		String[] genres;
		String[] selected = request.getParameterValues("category");
		
		for (int i = 0; i < selected.length; i++) {
			System.out.println(selected[i]);
		}
		
		try {
			movies = (ArrayList<Movie>) ms.getAll();
		} catch (Exception e) {
			return;
		}
		
		for (int i = 0; i < movies.size(); i++) {
			genres = (String[]) movies.get(i).getGenres().toArray();
			for (int j = 0; j < genres.length; j++) {
				for (int k = 0; k < selected.length; k++) {
					if (genres[j].equals(selected[k])) {
						result.add(genres[j]);
						System.out.println(genres[j]);
					}
				}
			}
		}
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

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
		
		try {
			ArrayList<Movie> movies = (ArrayList<Movie>) ms.getAll();
		} catch (Exception e) {
		}
		
		//TODO: filter
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	//TODO: login
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("login");
		
		Account user = as.login(request.getParameter("loginUsername"), request.getParameter("loginPassword"));
		
		if (user == null) {
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}

		request.getSession().setAttribute("as", as);
		
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
		} catch (Exception e) {
			System.out.println("failed register");
			//TODO: fixme
			return;
		}
		Account user = as.login(username, password);
		request.getSession().setAttribute("as", as);
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
