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
import utils.PasswordUtils;

@WebServlet(name = "LoginControl", urlPatterns = {"/login"})
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        UsersDAO dao = new UsersDAO();
        Users user = dao.login(username);
        
        if (user != null && PasswordUtils.checkPassword(password, user.getPassword())) {
            HttpSession session = request.getSession();
            session.setAttribute("uid", user.getUid());
            session.setAttribute("acc", user);
            response.sendRedirect("home");
        } else {
            request.setAttribute("error", "error-show");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
