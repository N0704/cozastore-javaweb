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
import utils.GoogleUtils;

@WebServlet("/login-google")
public class LoginGoogle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginGoogle() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String code = request.getParameter("code");
	        if (code == null || code.isEmpty()) {
	            response.sendRedirect("login.jsp?error=google_login_failed");
	            return;
	        }

	        try {
	            // Lấy access token
	            String accessToken = GoogleUtils.getToken(code);
	            // Lấy thông tin người dùng từ Google
	            Users googleUser = GoogleUtils.getUserInfo(accessToken);

	            UsersDAO dao = new UsersDAO();
	            Users user = dao.findByEmail(googleUser.getEmail());

	            if (user == null) {
	                // Nếu chưa tồn tại, thêm vào CSDL
	                dao.insertGoogleUser(googleUser);
	                user = dao.findByEmail(googleUser.getEmail());
	            }

	            // Lưu thông tin vào session
	            HttpSession session = request.getSession();
	            session.setAttribute("acc", user);

	            response.sendRedirect("home");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("login.jsp?error=google_login_failed");
	        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
