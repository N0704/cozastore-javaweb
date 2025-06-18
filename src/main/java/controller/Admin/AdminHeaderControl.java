package controller.Admin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.NotificationDAO;
import model.Notification;

@WebServlet("/admin-header")
public class AdminHeaderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminHeaderControl() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		if (request.getAttribute("jakarta.servlet.include.request_uri") != null) {
		NotificationDAO dao = new NotificationDAO();
		List<Notification> notifications = dao.getUnreadNotifications();
		int count = 0;
		count = dao.countNotification();
		
		request.setAttribute("count", count);
		request.setAttribute("notifications", notifications);
		request.getRequestDispatcher("admin/header.jsp").include(request, response);
		 } else {
	            response.sendRedirect("home");
	        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
