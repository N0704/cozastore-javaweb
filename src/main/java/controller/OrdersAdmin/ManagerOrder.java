package controller.OrdersAdmin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.OrderDAO;
import model.Orders;
import model.Users;

@WebServlet("/order-manager")
public class ManagerOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerOrder() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("acc");
		
		if (!"Admin".equals(user.getRole())) {
		    response.sendRedirect("accessDenied.jsp");
		    return;
		}
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		
		OrderDAO dao = new OrderDAO();
        List<Orders> listO = dao.getAllOrders();
               
        request.setAttribute("listO", listO);
        request.getRequestDispatcher("admin/manager-order.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
