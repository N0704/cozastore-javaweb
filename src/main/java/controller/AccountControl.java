package controller;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.UsersDAO;
import model.Users;

/**
 * Servlet implementation class AccountControl
 */
@WebServlet("/account")
public class AccountControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AccountControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    Users user = (Users) session.getAttribute("acc");
		    
		    if (user == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		    int uid = user.getUid();
		    UsersDAO userDAO = new UsersDAO();
		    Users u = userDAO.getUser(uid);
		    
		    request.setAttribute("detail", u);
		    request.getRequestDispatcher("account.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
