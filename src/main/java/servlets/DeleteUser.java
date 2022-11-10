package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entities.User;
import logic.CtrlUser;

@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteUser() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = new User();
		CtrlUser cu = new CtrlUser();
		u.setDni(Integer.parseInt(request.getParameter("dni_user")));
		
		cu.deleteUser(u);
		
		request.getRequestDispatcher("controlUsers.jsp").forward(request, response);
	}

}
