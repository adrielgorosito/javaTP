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
			String nameInput = request.getParameter("nameInput");
	        String descInput = request.getParameter("descInput");
	        Double priceInput;
	        Integer stockInput;
			
	        try {
            	priceInput = Double.parseDouble(request.getParameter("priceInput"));
    	        stockInput = Integer.parseInt(request.getParameter("stockInput"));
    	        
    	        if (nameInput == null || descInput == null || priceInput == null || stockInput == null) {
    	        	request.setAttribute("errorType", 15);
    				request.getRequestDispatcher("error.jsp").forward(request, response);
    				return;
    	        } else if (priceInput <= 0 || stockInput < 0) {
    	        	request.setAttribute("errorType", 14);
    				request.getRequestDispatcher("error.jsp").forward(request, response);
    				return;
    	        }
            } catch (NumberFormatException e) {
            	request.setAttribute("errorType", 14);
    			request.getRequestDispatcher("error.jsp").forward(request, response);
    			return;
            }
	        
	        Product p = new Product();
	        CtrlProductType cpt = new CtrlProductType();
	 	   	LinkedList<ProductType> allTypes = cpt.getAllProductTypes();
	 	   	
	 	   	for (ProductType prodType : allTypes) {
				if (prodType.getName().equals(request.getParameter("catInput"))) {
					p.setType(prodType);
				}
			}
	 	   	
	 	   	if (p.getType() == null) {
		 	   	request.setAttribute("errorType", 16);
				request.getRequestDispatcher("error.jsp").forward(request, response);
				return;
	 	   	}
	        
			p.setId_prod(Integer.parseInt(request.getParameter("id_prod")));
			p.setName(nameInput);
			p.setDescription(descInput);
			p.setPrice(priceInput);
			p.setStock(stockInput);
			
			CtrlProduct cp = new CtrlProduct();
			cp.updateProduct(p);
			
			request.setAttribute("productChanged", p);
			request.getRequestDispatcher("successful.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 2);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
