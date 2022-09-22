package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.CtrlPassword;
import entities.User;

@WebServlet("/ForgotPass")
public class ForgotPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ForgotPass() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlPassword cfp = new CtrlPassword();
		
		User u = new User();
		u.setMail(request.getParameter("mail"));
		
		u = cfp.validateMail(u);
		
		if (u != null) {
			cfp.sendMail(u);
			request.setAttribute("mailSent", request.getParameter("mail"));
			request.getRequestDispatcher("mailSent.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 9);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
