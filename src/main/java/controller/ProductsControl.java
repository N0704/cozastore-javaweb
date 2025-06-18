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

@WebServlet("/category")
public class ProductsControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductsControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            
            String cid = request.getParameter("cid");
            String sort = request.getParameter("sort");
            String price = request.getParameter("price");
            String discount = request.getParameter("discount");
            
            // Kiểm tra tham số bắt buộc
            if (cid == null || cid.trim().isEmpty()) {
                response.sendRedirect("home");
                return;
            }
            
            try {
                CategoriesDAO cdao = new CategoriesDAO();
                ProductsDAO pdao = new ProductsDAO();
                
                Categories c = cdao.getCategoriesByID(cid);
                List<Products> listP = pdao.getFilteredProducts(cid, price, sort, discount);
                
                request.setAttribute("listC", cdao.getCategories());
                request.setAttribute("listCC", c);
                request.setAttribute("listP", listP);
                request.setAttribute("currentSort", sort);
                request.setAttribute("currentPrice", price);
                request.setAttribute("currentDiscount", discount);
                
            } catch (Exception e) {
                request.setAttribute("error", "Đang gặp sự cố, vui lòng thử lại");
                e.printStackTrace();
            }
            
            
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
