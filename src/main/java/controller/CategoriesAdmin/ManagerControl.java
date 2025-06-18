package controller.CategoriesAdmin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CategoriesDAO;
import model.Categories;

@WebServlet(name = "ManagerControl", urlPatterns = {"/category-manager"})
public class ManagerControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		CategoriesDAO dao = new CategoriesDAO();
        List<Categories> listC = dao.getAllCategories();

	    request.setAttribute("listC", listC); 
        request.getRequestDispatcher("admin/manager-category.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
