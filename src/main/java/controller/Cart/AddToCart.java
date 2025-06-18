package controller.Cart;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import dao.CartDAO;
import model.Users;


@WebServlet("/add-to-cart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Users user = (Users) session.getAttribute("acc");
        CartDAO cartDAO = new CartDAO();
	    if (user == null) {
            response.sendRedirect("login.jsp");
            return;
	    }
	    else {
	    	int uid = user.getUid();
	    	int pid = Integer.parseInt(request.getParameter("pid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String action = request.getParameter("action");
            
            cartDAO.addToCart(uid, pid, quantity);
            
            if ("buynow".equals(action)) {
                response.sendRedirect("cart");
            } else {
                // Nếu nhấn "Thêm vào giỏ" thì ở lại trang hiện tại
            	session.setAttribute("cartMessage", "Đã thêm vào giỏ hàng thành công!");
                String referer = request.getHeader("Referer");
                response.sendRedirect(referer); // Trả về trang gốc
            }
            
	    }

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
