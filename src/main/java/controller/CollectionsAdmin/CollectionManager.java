package controller.CollectionsAdmin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CollectionsDAO;
import model.Collections;
import model.Users;

@WebServlet("/collection-manager")
public class CollectionManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CollectionManager() {
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
		response.setContentType("text/html;charset=UTF-8");
		CollectionsDAO dao = new CollectionsDAO();
        List<Collections> listC = dao.getAllCollections();

	    request.setAttribute("listC", listC); 
        request.getRequestDispatcher("admin/manager-collection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
