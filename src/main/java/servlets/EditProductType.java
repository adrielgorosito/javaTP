package servlets;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.Product;
import entities.ProductType;
import entities.User;
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
		User userS = (User) request.getSession().getAttribute("userSession");
		
		if (userS.isAdmin()) {
			Product p = new Product();
			ProductType pt = new ProductType();
			CtrlProductType cpt = new CtrlProductType();
			
			LinkedList <ProductType> allTypes = cpt.getAllProductTypes();
			
	 	   	for (ProductType prodType : allTypes) {
				if (prodType.getName().equals(request.getParameter("newProdName"))) {
					request.setAttribute("errorType", 16);
					request.getRequestDispatcher("error.jsp").forward(request, response);
					return;
				}
			}
	 	   	
	 	   	pt.setName(request.getParameter("oldProdName"));
	 	   	p.setType(pt);
			pt = cpt.getProductTypeByName(p);
			
			cpt.changeName(pt, request.getParameter("newProdName"));
			
			request.getRequestDispatcher("controlProductTypes.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 2);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
