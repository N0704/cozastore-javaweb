package controller.ProductsAdmin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ProductsDAO;
import model.Products;


@WebServlet(name = "LoadProduct", urlPatterns = {"/loadProduct"})
public class LoadProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        String pid = request.getParameter("pid");
        ProductsDAO pdao = new ProductsDAO();
        Products p = pdao.getProductByID(pid);
        String checked = p.isActive() ? "checked" : "";

        request.setAttribute("isChecked", checked);
        request.setAttribute("detail", p);
        request.setAttribute("openEdit", true);
        request.getRequestDispatcher("product-manager").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
