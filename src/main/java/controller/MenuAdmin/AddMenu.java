package controller.MenuAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MenuDAO;
import model.Menu;

@WebServlet("/add-menu")
public class AddMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String menuName = request.getParameter("menuName");
        int cid = Integer.parseInt(request.getParameter("cid"));
        boolean isActive = request.getParameter("IsActive") != null;
        MenuDAO dao = new MenuDAO();        
        dao.insertMenu(menuName, cid, isActive);
        response.sendRedirect("menu-manager");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
