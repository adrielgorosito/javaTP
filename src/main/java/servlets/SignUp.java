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
import logic.*;

@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SignUp() {
        super();
    }
    
	private CtrlSignUp csu = new CtrlSignUp();

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User newUser = null;
		
		try {
			newUser = new User(request.getParameter("name"), request.getParameter("surname"),
				  				Integer.parseInt(request.getParameter("dni")), request.getParameter("phone"),
				  				request.getParameter("mail"), request.getParameter("username"), request.getParameter("password1"));
		} catch (NumberFormatException e) {
			request.setAttribute("errorType", 14);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
		if (newUser != null) {
			if (newUser.getName().matches("[a-zA-Z]+") && newUser.getSurname().matches("[a-zA-Z]+")) {
				if (newUser.getPassword().length() >= 8) {
					if (newUser.getPassword().equals(request.getParameter("password2"))) {
						if (!csu.checkCharacters(newUser.getUsername())) {
							if (newUser.getMail().contains("@") && newUser.getMail().contains(".com")) {
								int res = csu.createNewUser(newUser);
								
								switch (res) {
								case 0:
									HttpSession sesion = request.getSession();
									sesion.setAttribute("userSession", newUser);
									sesion.setMaxInactiveInterval(30*60);
									
									request.setAttribute("accountCreated", newUser);
									request.getRequestDispatcher("successful.jsp").forward(request, response);
									break;
									
								case 5: // Ya existe un usuario con ese DNI
									request.setAttribute("errorType", 5);
									request.getRequestDispatcher("error.jsp").forward(request, response);
									break;
		
								case 6: // Ya existe un usuario con ese nombre de usuario
									request.setAttribute("errorType", 6);
									request.getRequestDispatcher("error.jsp").forward(request, response);
									break;
									
								case 7: // Ya existe un usuario con ese mail
									request.setAttribute("errorType", 7);
									request.getRequestDispatcher("error.jsp").forward(request, response);
									break;
									
								default:
									break;
								}
							} else {
								// Mail inválido
								request.setAttribute("errorType", 18);
								request.getRequestDispatcher("error.jsp").forward(request, response);
							}
						} else {
							// La contraseña tiene caracteres especiales
							request.setAttribute("errorType", 8);
							request.getRequestDispatcher("error.jsp").forward(request, response);
						}		
					} else {
						// Las contraseñas no coinciden
						request.setAttribute("errorType", 3);
						request.getRequestDispatcher("error.jsp").forward(request, response);
					}
				} else {
					// La contraseña no tiene como mínimo 8 caracteres
					request.setAttribute("errorType", 4);
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			} else {
				// El nombre o apellido tienen carácteres inválidos
				request.setAttribute("errorType", 21);
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
	}
}