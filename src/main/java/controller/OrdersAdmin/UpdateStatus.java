package controller.OrdersAdmin;

import java.io.IOException;
import java.text.DecimalFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import dao.UsersDAO;
import model.Orders;
import model.Users;
import service.EmailTemplateService;
import utils.EmailUtils;

@WebServlet("/update-status")
public class UpdateStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateStatus() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("text/html;charset=UTF-8");

	    int orderId = Integer.parseInt(request.getParameter("orderid"));
	    String newStatus = request.getParameter("status");

	    OrderDAO orderDAO = new OrderDAO();
	    orderDAO.updateOrderStatus(orderId, newStatus);

	    Orders order = orderDAO.getOrderById(orderId);
	    if (order != null) {
	        Users user = new UsersDAO().getUser(order.getUid());
	        if (user != null) {
	            DecimalFormat formatter = new DecimalFormat("#,###");

	            EmailTemplateService emailTemplateService = new EmailTemplateService();

	            String subject;
	            String message;

	            if ("Đã xác nhận".equals(newStatus)) {
	                subject = "Thông báo xác nhận đơn hàng";
	                message = emailTemplateService.buildOrderConfirmationEmail(order, orderId, formatter);
	            } else if ("Đã hủy".equals(newStatus)) {
	                subject = "Xác nhận hủy đơn hàng";
	                message = emailTemplateService.buildOrderCancellationEmail(order, orderId, formatter);
	            } else {
	                subject = null;
	                message = null;
	            }

	            if (subject != null && message != null) {
	                EmailUtils.sendEmail(user.getEmail(), subject, message);
	            }
	        }
	    }

	    response.sendRedirect("order-manager");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
