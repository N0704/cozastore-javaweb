package controller.Admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.OrderDAO;
import dao.ProductsDAO;
import dao.UsersDAO;
import model.BestSellerProduct;
import model.CategoryCount;
import model.DailyRevenue;
import model.Orders;
import model.RevenueByCategory;
import model.SalesReport;
import model.Users;

@WebServlet("/dashboard")
public class AdminHomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminHomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("acc");
		
		if (!"Admin".equals(user.getRole())) {
		    response.sendRedirect("accessDenied.jsp");
		    return;
		}
		
		UsersDAO udao = new UsersDAO();
		OrderDAO orderDAO = new OrderDAO();
		ProductsDAO dao = new ProductsDAO();
        List<BestSellerProduct> list = dao.getBestSellers();
        List<Orders> orders = orderDAO.getDashboardOrders();
        SalesReport report = dao.getReport();
        int countCustomers = udao.countCustomers();
        List<CategoryCount> data = dao.getProductCountByCategory();
        List<RevenueByCategory> data1 = dao.getRevenueByCategory();
        List<DailyRevenue> data2 = dao.getRevenueByDate();
        
			 request.setAttribute("data2", data2);
		        request.setAttribute("data1", data1);
		        request.setAttribute("data", data);
		        request.setAttribute("customerCount", countCustomers);
		        request.setAttribute("report", report);
		        request.setAttribute("orders", orders);
		        request.setAttribute("bestSellers", list);
		        request.getRequestDispatcher("admin/dashboard.jsp").forward(request, response);
      
       
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
