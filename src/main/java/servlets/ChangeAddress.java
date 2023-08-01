package servlets;

import java.io.IOException;
import java.util.Arrays;
import java.util.LinkedList;

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
		u.setCity(request.getParameter("cityInput"));
		u.setAddress(request.getParameter("addressInput"));
		
		LinkedList<String> validStates = new LinkedList<>();
		
		validStates.addAll(Arrays.asList(
			    "Buenos Aires", "Ciudad Autónoma de Buenos Aires", "Catamarca", "Chaco", "Chubut",
			    "Córdoba", "Corrientes", "Entre Ríos", "Formosa", "Jujuy", "La Pampa", "Mendoza",
			    "Misiones", "Neuquén", "Río Negro", "Salta", "San Juan", "San Luis", "Santa Cruz",
			    "Santa Fe", "Santiago del Estero", "Tucumán"
				)
			);
		
		if (u.getCity() != null || u.getState() != null || u.getAddress() != null) {
			if (u.getCity().matches("^[a-zA-Z\\s]+$")) {
				if (validStates.contains(u.getState())) {
					CtrlAddress ca = new CtrlAddress();
					
					ca.changeAddress(u);
					
					request.setAttribute("addressChanged", "nice");
					request.getRequestDispatcher("successful.jsp").forward(request, response);
				} else {
					request.setAttribute("errorType", 19);
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("errorType", 19);
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("errorType", 19);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
			
		
		
	}

}
