package controller.ProductsAdmin;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CategoriesDAO;
import dao.CollectionsDAO;
import dao.ProductsDAO;
import model.Categories;
import model.Collections;
import model.Products;
import model.Users;

@WebServlet(name = "ManagerProduct", urlPatterns = {"/product-manager"})
public class ManagerProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ManagerProduct() {
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
		ProductsDAO pdao = new ProductsDAO();
        List<Products> listP = pdao.getNewProduct();
        CollectionsDAO cdao = new CollectionsDAO();
        List<Collections> listCC = cdao.getAllCollections();
        CategoriesDAO dao = new CategoriesDAO();
        List<Categories> listC = dao.getAllCategories();

        request.setAttribute("listC", listC);
        request.setAttribute("listCC", listCC);
        request.setAttribute("listP", listP); 
        request.getRequestDispatcher("admin/manager-product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
