package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.*;
import entities.*;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignUpServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataUsers du = new DataUsers();
		
		User newUser = new User();
		User userFound = new User();
		
		if (request.getParameter("password1").length() >= 8) {
			if (request.getParameter("password1").equals(request.getParameter("password2"))) {
				newUser.setName(request.getParameter("name"));
				newUser.setSurname(request.getParameter("surname"));
				newUser.setDni(Integer.parseInt(request.getParameter("dni")));
				newUser.setPhone(request.getParameter("phone"));
				newUser.setMail(request.getParameter("mail"));
				newUser.setUsername(request.getParameter("username"));
				newUser.setPassword(request.getParameter("password1"));
				newUser.setIsAdmin(false);
			
				userFound = du.getUserByDni(newUser);
				
				if (userFound == null) {
					userFound = du.getUserByUsername(newUser);

					if (userFound == null) {
						userFound = du.getUserByMail(newUser);
						
						if (userFound == null) {
							du.addNewUser(newUser);
							
							HttpSession sesion = request.getSession();
							sesion.setAttribute("userSession", newUser);
							sesion.setMaxInactiveInterval(30*60);
							
							request.setAttribute("newUser", newUser);
							request.getRequestDispatcher("cuentaCreada.jsp").forward(request, response);
						} else {
							request.setAttribute("errorType", 7);
							request.getRequestDispatcher("error.jsp").forward(request, response);
						}
					} else {
						request.setAttribute("errorType", 6);
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
				} else {
					request.setAttribute("errorType", 5);
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}				
			} else {
				request.setAttribute("errorType", 4);
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}

		} else {
			request.setAttribute("errorType", 3);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		

	}

}
