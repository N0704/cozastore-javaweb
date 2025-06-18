package controller.MenuAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MenuDAO;
import model.Menu;

@WebServlet("/loadMenu")
public class LoadMenu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadMenu() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        String menuID = request.getParameter("menuID");
        MenuDAO dao = new MenuDAO();
        Menu m = dao.getMenuByID(menuID);
        String checked = m.isIsActive() ? "checked" : "";
        
        request.setAttribute("isChecked", checked);
        request.setAttribute("detail", m);
		request.setAttribute("openEdit", true);
        request.getRequestDispatcher("menu-manager").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
