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

import models.Genre;
import models.Movie;
import services.AccountService;
import services.GenreService;
import services.MovieService;

@WebServlet({ "/Me", "/me" })
public class Me extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB 
	MovieService ms;
	@EJB
	GenreService gs;
	
    public Me() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AccountService as = (AccountService) request.getSession().getAttribute("as");
		if (as == null || as.getCurrentUser() == null) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		List<Movie> movies = new ArrayList<Movie>();
		List<Genre> genres = new ArrayList<Genre>();
		List<Genre> myGenres = (List<Genre>) as.getCurrentUser().getFavorites();
		try {
			movies = ms.getAll();
			genres = gs.getAll();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("movieLst",movies);
		request.setAttribute("myGenreLst",myGenres);
		request.setAttribute("genreLst",genres);
		
		request.getRequestDispatcher("me.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] selected = request.getParameterValues("category");
		
		for (int i = 0; i < selected.length; i++) {
			System.out.println(selected[i]);
		}
		
		//TODO: update favorites
		request.getRequestDispatcher("me.jsp").forward(request, response);
	}
}
