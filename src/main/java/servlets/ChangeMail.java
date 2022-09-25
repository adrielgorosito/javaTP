package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;
import logic.CtrlMail;
import utils.SpecialCharactersChecker;

@WebServlet("/ChangeMail")
public class ChangeMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeMail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		User u1 = (User) session1.getAttribute("userSession");
		
		u1.setMail(request.getParameter("mailInput"));
			
		CtrlMail cm = new CtrlMail();
		cm.changeMail(u1);
			
		request.setAttribute("mailChanged", u1.getMail());
		request.getRequestDispatcher("successful.jsp").forward(request, response);
	}

}
