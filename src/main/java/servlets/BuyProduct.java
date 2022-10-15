package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Product;
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
		
		int cant = Integer.parseInt(request.getParameter("quantityInput"));
		
		request.setAttribute("prod", p);
		request.setAttribute("cant", cant);
		request.getRequestDispatcher("buy.jsp").forward(request, response);
	}

}
