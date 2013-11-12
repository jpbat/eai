package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Account;
import models.Genre;
import models.Movie;
import services.AccountService;
import services.GenreService;
import services.MovieService;

@WebServlet({"/Index","/index"})
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB 
	AccountService as;  
	@EJB 
	MovieService ms;
	@EJB
	GenreService gs;
	
	public Index() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountService as = (AccountService) request.getSession().getAttribute("as");
	
		List<Movie> movies = new ArrayList<Movie>();
		List<Genre> genres = new ArrayList<Genre>();
		try {
			movies = ms.getAll();
			genres = gs.getAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("movieLst",movies);
		request.setAttribute("genreLst",genres);				
		
		if (as == null || as.getCurrentUser() == null) {
			request.getRequestDispatcher("login").forward(request, response);
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
		List<String> genresID = new ArrayList<String>();
		List<Movie> resultMovies = new ArrayList<Movie>();
		List<Genre> genresLst = new ArrayList<Genre>();
		
		String[] selected = request.getParameterValues("category");
		
		if(selected.length == 0){
			response.sendRedirect("/IMDbCrawler/index");
		}
		
		
		for (int i = 0; i < selected.length; i++) {
			System.out.println(selected[i]);
			genresID.add(selected[i]);
		}
		try {
			genresLst = gs.getAll();
			resultMovies = ms.getByGenres(genresID);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("genreLst",genresLst);
		request.setAttribute("movieLst", resultMovies);
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
		response.sendRedirect("/IMDbCrawler/index");
		return;
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
