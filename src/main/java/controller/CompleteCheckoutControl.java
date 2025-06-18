package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CartDAO;
import dao.OrderDAO;
import model.Cart;
import model.Users;

@WebServlet("/complete-checkout")
public class CompleteCheckoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CompleteCheckoutControl() {
        super();
        // TODO Auto-generated constructor stub
    }


	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
	    Users user = (Users) session.getAttribute("acc");
	    
	    if (user == null) {
	        response.sendRedirect("login.jsp");
	        return;
	    }
	    
	    // Lấy thông tin từ form
	    String fullname = request.getParameter("fullname");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String paymentmethod = request.getParameter("paymentMethod");
	    
	    // Lấy thông tin đơn hàng từ session
	    List<Cart> selectedItems = (List<Cart>) session.getAttribute("selectedItems");
	    BigDecimal total = (BigDecimal) session.getAttribute("orderTotal");
	    
	    // Lưu đơn hàng vào database
	    OrderDAO orderDAO = new OrderDAO();
	    int orderId = orderDAO.createOrder(user.getUid(), fullname, phone, address, 
	                                     paymentmethod, total, selectedItems);
	    
	    if (orderId > 0) {
	        CartDAO cartDAO = new CartDAO();
	        for (Cart item : selectedItems) {
	            cartDAO.deleteCartItem(user.getUid(), item.getPid());
	        }
	        
	        // Chuyển hướng đến trang cảm ơn
	        response.sendRedirect("thankyou.jsp");
	    } else {
	        response.sendRedirect("checkout.jsp?error=Thanh toán thất bại");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
