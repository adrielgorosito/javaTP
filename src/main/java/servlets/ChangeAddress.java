package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;
import logic.CtrlAddress;

@WebServlet("/ChangeAddress")
public class ChangeAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangeAddress() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		
		User u = (User) session1.getAttribute("userSession");
		
		u.setState(request.getParameter("stateInput"));
		System.out.println(u.getState());
		u.setCity(request.getParameter("cityInput"));
		u.setAddress(request.getParameter("addressInput"));
		
		CtrlAddress ca = new CtrlAddress();
		
		ca.changeAddress(u);
		
		request.setAttribute("addressChanged", "nice");
		request.getRequestDispatcher("successful.jsp").forward(request, response);
	}

}
