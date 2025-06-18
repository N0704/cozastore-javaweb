package controller.MenuAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MenuDAO;

@WebServlet("/edit-menu")
public class EditMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        int menuID = Integer.parseInt(request.getParameter("menuID"));
        String menuName = request.getParameter("menuName");
        int cid = Integer.parseInt(request.getParameter("cid"));
        boolean isActive = request.getParameter("IsActive") != null;
        MenuDAO dao = new MenuDAO();        
        dao.updateMenu(menuID, menuName, cid, isActive);
        response.sendRedirect("menu-manager");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
