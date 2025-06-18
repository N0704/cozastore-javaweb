package controller.ProductsAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ProductsDAO;

@WebServlet(name = "DeleteProduct", urlPatterns = {"/delete-product"})
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteProduct() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	response.setContentType("text/html;charset=UTF-8");
	        String pid = request.getParameter("pid");
	        ProductsDAO dao = new ProductsDAO();
	        dao.deleteProducts(pid);
	        response.sendRedirect("product-manager");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
