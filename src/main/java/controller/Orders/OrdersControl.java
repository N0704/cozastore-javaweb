package controller.Orders;

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

@WebServlet("/orders")
public class OrdersControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public OrdersControl() {
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
		OrderDAO orderDAO = new OrderDAO();
        List<Orders> orders = orderDAO.getOrdersWithProductCount(uid);
        
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
