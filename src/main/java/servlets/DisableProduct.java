package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Product;
import entities.User;
import logic.CtrlProduct;

@WebServlet("/DisableProduct")
public class DisableProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DisableProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userS = (User) request.getSession().getAttribute("userSession");
		
		if (userS.isAdmin()) {
			Product p = new Product();
			CtrlProduct cp = new CtrlProduct();
			
			p.setName(request.getParameter("prodName"));
			p.setActive(false);
			
			cp.disableProduct(p);
			
			request.setAttribute("prod", p);
			request.getRequestDispatcher("controlProducts.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 2);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
