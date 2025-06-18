package controller.Account;

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

@WebServlet("/changePass")
public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangePass() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("acc");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int uid = user.getUid();
        UsersDAO userDAO = new UsersDAO();

        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra xác nhận mật khẩu
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("account").forward(request, response);
            return;
        }

        // Kiểm tra mật khẩu hiện tại (so sánh với hash trong DB)
        if (!userDAO.checkPassword(uid, currentPassword)) {
            request.setAttribute("mess", "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("account").forward(request, response);
            return;
        }

        // Mã hóa mật khẩu mới bằng BCrypt trước khi cập nhật
        String hashedNewPassword = PasswordUtils.hashPassword(newPassword);
        userDAO.updatePassword(uid, hashedNewPassword);

        request.setAttribute("message", "Đổi mật khẩu thành công!");
        request.getRequestDispatcher("account").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
