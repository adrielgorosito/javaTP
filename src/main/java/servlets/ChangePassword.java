package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;
import logic.CtrlPassword;

@WebServlet("/ChangePassword")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangePassword() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		CtrlPassword cp = new CtrlPassword();
		
		User u1 = (User) session1.getAttribute("userSession");
		String password1 = request.getParameter("newPassInput");
		String password2 = request.getParameter("newPassConfirmInput");
		
		int error = cp.changePassword(u1, password1, password2);
		
		if (error == 3) {
			request.setAttribute("errorType", 3);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else if (error == 4) {
			request.setAttribute("errorType", 4);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		} else {
			request.setAttribute("passChanged", password1);
			request.getRequestDispatcher("successful.jsp").forward(request, response);
		}
	}

}
