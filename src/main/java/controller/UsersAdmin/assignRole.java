package controller.UsersAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UsersDAO;

@WebServlet("/assignRole")
public class assignRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public assignRole() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
		String uid = request.getParameter("uid");
        String role = request.getParameter("role");

        UsersDAO userDAO = new UsersDAO();
        userDAO.assignRole(uid, role);
        
        response.sendRedirect("user-manager");		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
