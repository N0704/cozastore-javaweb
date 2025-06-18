package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CartDAO;
import dao.MenuDAO;
import model.Menu;
import model.Users;

@WebServlet("/header")
public class HeaderControl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HeaderControl() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();

        // Chỉ xử lý menu và cartItemCount nếu là request nội bộ (như từ <c:import>)
        if (request.getAttribute("jakarta.servlet.include.request_uri") != null) {
            // Lấy menu
            List<Menu> menu = new MenuDAO().getMenu();
            request.setAttribute("menu", menu);

            // Giỏ hàng
            Users user = (Users) session.getAttribute("acc");
            int cartItemCount = 0;
            if (user != null) {
                cartItemCount = new CartDAO().countCartItemsByUserId(user.getUid());
            }
            session.setAttribute("cartItemCount", cartItemCount);

            // Render header.jsp
            request.getRequestDispatcher("header.jsp").include(request, response);
        } else {
            // Nếu người dùng truy cập trực tiếp vào /header thì chuyển hướng về trang chủ
            response.sendRedirect("home");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}