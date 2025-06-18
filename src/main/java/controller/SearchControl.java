package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ProductsDAO;
import model.Products;

@WebServlet("/search")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
		String txtSearch = request.getParameter("txt");
		String sort = request.getParameter("sort");
        String price = request.getParameter("price");
        String discount = request.getParameter("discount");
		
		ProductsDAO pdao = new ProductsDAO();
		List<Products> list = pdao.searchByName(txtSearch, sort, price, discount);
		int count = pdao.countSearch(txtSearch, price, discount);
		
		if (txtSearch != null && !txtSearch.trim().isEmpty()) {
			request.setAttribute("listP", list);
		}
		
		request.setAttribute("txtS", txtSearch);
		request.setAttribute("count", count);
		request.setAttribute("currentSort", sort);
        request.setAttribute("currentPrice", price);
        request.setAttribute("currentDiscount", discount);
		
		
		request.getRequestDispatcher("search_product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
