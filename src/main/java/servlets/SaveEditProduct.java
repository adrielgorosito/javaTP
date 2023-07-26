package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entities.Product;
import entities.ProductType;
import entities.User;
import logic.CtrlProduct;
import logic.CtrlProductType;

@WebServlet("/SaveEditProduct")
public class SaveEditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveEditProduct() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User userS = (User) request.getSession().getAttribute("userSession");
		
		if (userS.isAdmin()) {
			CtrlProduct cp = new CtrlProduct();
			Product p = cp.getProduct(Integer.parseInt(request.getParameter("id_prod")));
			
			p.setName(request.getParameter("nameInput"));
			p.setDescription(request.getParameter("descInput"));
			p.setPrice(Double.parseDouble(request.getParameter("priceInput")));
			p.setStock(Integer.parseInt(request.getParameter("stockInput")));
			p.getType().setName(request.getParameter("catInput"));
			
			CtrlProductType cpt = new CtrlProductType();
			ProductType pt = new ProductType();
			pt = cpt.getProductTypeByName(p);
			p.getType().setId(pt.getId());
			
			cp.updateProduct(p);
			
			request.setAttribute("productChanged", p);
			request.getRequestDispatcher("successful.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 2);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
