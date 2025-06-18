package controller.Orders;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.OrderDAO;
import model.OrderDetails;
import model.Orders;

@WebServlet("/chi-tiet-don-hang")
public class LoadOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoadOrders() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderId = Integer.parseInt(request.getParameter("orderid"));
		OrderDAO dao = new OrderDAO();
		
		Orders order = dao.getOrderById(orderId);
        List<OrderDetails> details = dao.getOrderDetails(orderId);

        request.setAttribute("order", order);
        request.setAttribute("details", details);
        request.setAttribute("openOrder", true);
        request.getRequestDispatcher("orders").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
