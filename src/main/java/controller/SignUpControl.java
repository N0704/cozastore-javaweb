package controller;


import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import utils.PasswordUtils;

@WebServlet("/signup")
public class SignUpControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String avatar = request.getParameter("avatar");
        String hashedPassword = PasswordUtils.hashPassword(password);
        

        UsersDAO dao = new UsersDAO();
     // Kiểm tra username/email đã tồn tại
        if (dao.isUsernameExists(username)) {
            request.setAttribute("error", "* Tên đăng nhập đã tồn tại!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        if (dao.isEmailExists(email)) {
            request.setAttribute("mess", "* Email đã được sử dụng!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }
        
        dao.signup(email,username,hashedPassword,fullname,phone,address,avatar);

        request.setAttribute("username", username);
        request.getRequestDispatcher("login.jsp").forward(request, response);
    
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}