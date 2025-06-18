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


@WebServlet("/detail")
public class ProductDetailControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductDetailControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pid = request.getParameter("pid");
		
		CategoriesDAO cdao = new CategoriesDAO();
		ProductsDAO pdao = new ProductsDAO();
		
        List<Categories> listC = cdao.getCategories();
        List<Products> listP = pdao.getProducts();
        Products p = pdao.getProductByID(pid);
        
     // Lấy categoryID từ sản phẩm
        int cid = p.getCid(); // Giả sử có phương thức này
        
        // Tìm tên danh mục tương ứng
        String cname = "";
        for (Categories c : listC) {
            if (c != null && c.getCid() == cid) {
                cname = c.getCname();
                break;
            }
        }
        
        List<Products> list = pdao. getTop12ByCid(cid,pid);
        
        request.setAttribute("cname", cname);
        request.setAttribute("listC", listC);
        request.setAttribute("listP", listP);
        request.setAttribute("listPP", p);
        request.setAttribute("list", list);
        request.getRequestDispatcher("product_detail.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
