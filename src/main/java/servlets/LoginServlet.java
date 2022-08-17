package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entities.*;
import data.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	private DataUsers du = new DataUsers();
	
    public LoginServlet() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User userLogin = new User();
		userLogin.setUsername(request.getParameter("username"));
		userLogin.setPassword(request.getParameter("pass"));
		
		User userFound = new User();
		userFound = du.getUser(userLogin);
		
		if (userFound != null) {
			HttpSession sesion = request.getSession();
			sesion.setAttribute("userSession", userFound);
			sesion.setMaxInactiveInterval(30*60); // Máximo de 30 minutos
			
			// Probar que se logee con usuario y contraseña y si da error entonces
			// dni y contraseña
			
			if (userFound.getIsAdmin()) {
				request.setAttribute("user", userFound);
				request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("indexUser.jsp").forward(request, response);
			}
		} else {
			// Probar con un mostrar.println que edite la página y escriba error,
			// en vez de abrir una nueva (tantear a ver como queda)
			request.setAttribute("errorType", 1);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}