package servlets;

import java.io.IOException;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import entities.Product;
import entities.ShoppingHistory;
import entities.User;
import logic.CtrlProduct;
import logic.CtrlShoppingHistory;

@WebServlet("/FinishBuy")
public class FinishBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FinishBuy() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		User u1 = (User) session1.getAttribute("userSession");
		
		CtrlProduct cp = new CtrlProduct();
		CtrlShoppingHistory csh = new CtrlShoppingHistory();
		
		Product p = cp.getProduct(Integer.parseInt(request.getParameter("id_prod")));
		int cant = Integer.parseInt(request.getParameter("quantityInput"));
		String metodoPago = request.getParameter("metodoPago");	
		
		if (p.getStock() >= cant) {
			p.setStock(p.getStock() - cant);
			cp.updateStock(p);
			
			ShoppingHistory sh = new ShoppingHistory(p, u1, LocalDateTime.now(), cant, p.getPrice()*cant+600, metodoPago);
			csh.newShoppingHistory(sh);
			
			request.setAttribute("prod", p);
			request.setAttribute("cant", cant);
			request.setAttribute("metodo", metodoPago);
			request.getRequestDispatcher("successBuy.jsp").forward(request, response);
		}
		
		
	}

}