package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.ShoppingHistory;
import entities.User;
import logic.CtrlShoppingHistory;

@WebServlet("/ShoppingHistoryS")
public class ShoppingHistoryS extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public ShoppingHistoryS() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userS = (User) request.getSession().getAttribute("userSession");
		
		if (userS.isAdmin()) {
			User u = new User();
			u.setDni(Integer.parseInt(request.getParameter("dniUser")));
			
			CtrlShoppingHistory csh = new CtrlShoppingHistory();
			LinkedList<ShoppingHistory> sh = new LinkedList<>();
			sh = csh.getHistoryByUser(u);
			
			request.setAttribute("shList", sh);
			request.getRequestDispatcher("controlShoppingHistory.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 2);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}