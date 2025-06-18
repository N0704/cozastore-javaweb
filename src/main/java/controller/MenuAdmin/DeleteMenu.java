package controller.MenuAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MenuDAO;

@WebServlet("/delete-menu")
public class DeleteMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int menuID = Integer.parseInt(request.getParameter("menuID"));
		MenuDAO dao = new MenuDAO();
		dao.deleteMenu(menuID);
		response.sendRedirect("menu-manager");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
