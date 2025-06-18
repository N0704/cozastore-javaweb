package controller.MenuAdmin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CategoriesDAO;
import dao.MenuDAO;
import model.Categories;
import model.Menu;
import model.Users;

@WebServlet("/menu-manager")
public class MenuManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MenuManager() {
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
		MenuDAO dao = new MenuDAO();
		List<Menu> list = dao.getAllMenu();
		CategoriesDAO cdao = new CategoriesDAO();
        List<Categories> listC = cdao.getAllCategories();

        request.setAttribute("listC", listC);		
		request.setAttribute("list", list);
		request.getRequestDispatcher("admin/manager-menu.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
