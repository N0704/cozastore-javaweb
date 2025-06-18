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


@WebServlet(name = "LoadControl", urlPatterns = {"/loadCategory"})
public class LoadControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        String cid = request.getParameter("cid");
        CategoriesDAO dao = new CategoriesDAO();
        Categories c = dao.getCategoriesByID(cid);
        List<Categories> listC = dao.getAllCategories();
        String checked = c.isActive() ? "checked" : "";
        
        request.setAttribute("isChecked", checked);
        request.setAttribute("detail", c);
        request.setAttribute("listCC", listC);
        request.setAttribute("openEdit", true);
        request.getRequestDispatcher("category-manager").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
