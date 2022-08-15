package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import data.DataUsers;
import entities.User;

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
			if (userFound.getId() == 1) { // Admin (id = 1)
				request.setAttribute("user", userFound);
				request.getRequestDispatcher("indexAdmin.jsp").forward(request, response);
			} else { // Usuario (id != 0)
				request.getRequestDispatcher("indexUser.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("errorType", 1);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
