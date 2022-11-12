package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Product;
import entities.ProductType;
import logic.CtrlProductType;

@WebServlet("/EditProductType")
public class EditProductType extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public EditProductType() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductType pt = new ProductType();
		Product p = new Product();
		CtrlProductType cpt = new CtrlProductType();

		pt.setName(request.getParameter("oldProdName"));
		p.setType(pt);
		
		pt = cpt.getProductTypeByName(p);
		cpt.changeName(pt, request.getParameter("newProdName"));
		
		request.getRequestDispatcher("controlProductTypes.jsp").forward(request, response);
	}

}
