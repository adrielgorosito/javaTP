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

@WebServlet("/ChangePasswordSendCode")
public class ChangePasswordSendCode extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePasswordSendCode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlPassword cp = new CtrlPassword();
		HttpSession session1 = request.getSession();
		
		User userS = (User) session1.getAttribute("userSession");

		String randomcode = cp.sendMailChangePassword(userS);
		
		session1.setAttribute("randomCode", randomcode);
		request.getRequestDispatcher("modifyPassword.jsp").forward(request, response);
	}

}
