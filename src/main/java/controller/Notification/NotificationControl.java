package controller.Notification;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.NotificationDAO;
import model.Notification;

@WebServlet("/notification")
public class NotificationControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public NotificationControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		NotificationDAO dao = new NotificationDAO();
		List<Notification> notifications = dao.getNotifications();
		
		request.setAttribute("notification", notifications);
		request.getRequestDispatcher("admin/notification.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
