package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.CtrlContact;

@WebServlet("/Contact")
public class Contact extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Contact() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlContact cc = new CtrlContact();
		
		cc.sendMailContact(request.getParameter("mailInput"), request.getParameter("subjectInput"), request.getParameter("msgInput"));

		request.setAttribute("mailSent", request.getParameter("mailInput"));
		request.getRequestDispatcher("mailSent.jsp").forward(request, response);
	}

}
