package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.User;

@WebServlet("/ChangePasswordConfirmCode")
public class ChangePasswordConfirmCode extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ChangePasswordConfirmCode() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session1 = request.getSession();
		String randomCode = (String) session1.getAttribute("randomCode");
		String codeInput = request.getParameter("codeInput");
		
		if (randomCode.equals(codeInput)) {
			request.setAttribute("correctCode", true);
			request.getRequestDispatcher("modifyPassword.jsp").forward(request, response);
		} else {
			request.setAttribute("errorType", 11);
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
		
	}

}
