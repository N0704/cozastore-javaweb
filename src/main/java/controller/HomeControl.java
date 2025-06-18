package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CategoriesDAO;
import dao.CollectionsDAO;
import dao.ProductsDAO;
import model.BestSellerProduct;
import model.Categories;
import model.Collections;
import model.Products;

@WebServlet("/home")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		CategoriesDAO cdao = new CategoriesDAO();
		ProductsDAO pdao = new ProductsDAO();
		CollectionsDAO codao = new CollectionsDAO();

		try {
			List<Categories> listCC = cdao.getCategories();
			List<Collections> listCo = codao.getAllCollections();
			List<Categories> listC = cdao.getCategories();

			for (Categories c : listCC) {
				List<Products> products = pdao.get4LastProducts(c.getCid());
				List<BestSellerProduct> bestseller = pdao.getBestSellersByCid(c.getCid());
				c.setProducts(products);
				c.setBestseller(bestseller );
			}
			
			for (Collections co : listCo) {
	            List<Products> products = pdao.getProductsByCollectionId(co.getCollection_id());
	            co.setProducts(products);
	        }

			request.setAttribute("listC", listC);
			request.setAttribute("listCC", listCC);
			request.setAttribute("listCo", listCo);
			
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error loading home page");
		}

	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
