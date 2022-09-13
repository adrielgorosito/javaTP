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
import logic.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private CtrlLogin cl = new CtrlLogin();

	private DataUsers du = new DataUsers();
	
    public Login() {
    	super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User userFound = cl.userExists(request.getParameter("userInput"), request.getParameter("userPass"));
		
		if (userFound != null) {
			
			HttpSession sesion = request.getSession();
			sesion.setAttribute("userSession", userFound);
			sesion.setMaxInactiveInterval(30*60);
			
			if (userFound.getIsAdmin()) {
				////////////////////
				request.setAttribute("user", userFound);
				request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
			} else {
				////////////////////
				request.getRequestDispatcher("indexUser.jsp").forward(request, response);
			}
		} else {
			// Probar con un mostrar.println que edite la página y escriba error,
			// en vez de abrir una nueva (tantear a ver como queda)
			HttpSession sesion = request.getSession();
			sesion.setAttribute("userSession", null);
			request.setAttribute("errorType", 1);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}