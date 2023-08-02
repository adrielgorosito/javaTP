package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.Product;
import entities.User;
import logic.CtrlPassword;
import logic.CtrlProduct;

@WebServlet("/BuyProduct")
public class BuyProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BuyProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CtrlProduct cp = new CtrlProduct();
		Product p = cp.getProduct(Integer.parseInt(request.getParameter("id_prod")));
		
		HttpSession session1 = request.getSession();
		User u1 = (User) session1.getAttribute("userSession");
		
		int cant = Integer.parseInt(request.getParameter("quantityInput"));
		
		if (p.getStock() >= cant) {
			if (u1.getState() != null && u1.getCity() != null && u1.getAddress() != null) {
				request.setAttribute("prod", p);
				request.setAttribute("cant", cant);
				request.getRequestDispatcher("buy.jsp").forward(request, response);
			} else {
				request.setAttribute("errorType", 20);
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("errorType", 13);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
