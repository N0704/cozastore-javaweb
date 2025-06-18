package controller.Admin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.NotificationDAO;

@WebServlet("/mark-as-read")
public class MarkAsRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MarkAsRead() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
        String id = request.getParameter("id");
		NotificationDAO dao = new NotificationDAO();
		dao.markAsRead(id);
		
		response.sendRedirect("loadProduct?pid=" + pid);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
