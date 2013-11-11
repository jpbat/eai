package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({ "/Me", "/me" })
public class Me extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Me() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
