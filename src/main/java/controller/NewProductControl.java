package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CategoriesDAO;
import dao.ProductsDAO;
import model.Categories;
import model.Products;

@WebServlet("/new-product")
public class NewProductControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public NewProductControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String sort = request.getParameter("sort");
	        String price = request.getParameter("price");
	        String discount = request.getParameter("discount");
			CategoriesDAO cdao = new CategoriesDAO();
	        List<Categories> listC = cdao.getCategories();
	        
	        ProductsDAO pdao = new ProductsDAO();
	        List<Products> listP = pdao.getNewProducts(price, sort, discount);
	        
	        request.setAttribute("listC", listC);
	        request.setAttribute("listP", listP);
	        request.setAttribute("currentSort", sort);
            request.setAttribute("currentPrice", price);
            request.setAttribute("currentDiscount", discount);
            
	        request.getRequestDispatcher("new_product.jsp").forward(request, response);
	        
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
