package controller.Cart;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CartDAO;
import dao.CategoriesDAO;
import model.Cart;
import model.Categories;
import model.Users;


@WebServlet("/cart")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Users user = (Users) session.getAttribute("acc");
	    CategoriesDAO cdao = new CategoriesDAO();
	    
	    if (user == null) {
            response.sendRedirect("login.jsp");
            return;
	    }
	    
	    CartDAO cartDAO = new CartDAO();
	    try {
	    	int uid = user.getUid();
	        List<Categories> listC = cdao.getCategories();
            List<Cart> cart = cartDAO.getCartWithProductInfo(uid);
            
            BigDecimal total = cart.stream()
            	    .map(Cart::getTotalPrice)
            	    .reduce(BigDecimal.ZERO, BigDecimal::add);
            

            request.setAttribute("total", total);
            request.setAttribute("cart", cart);
            request.setAttribute("listC", listC);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
