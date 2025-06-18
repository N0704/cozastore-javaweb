package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import dao.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.Users;

@WebServlet("/checkout")
public class CheckoutControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CheckoutControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession();
		    Users user = (Users) session.getAttribute("acc");
		    
		    if (user == null) {
		        response.sendRedirect("login.jsp");
		        return;
		    }
		    
		    // Lấy danh sách sản phẩm đã chọn
		    String[] selectedProducts = request.getParameterValues("selectedProducts");
		    
		    if (selectedProducts == null || selectedProducts.length == 0) {
		        response.sendRedirect("cart?error=Chưa chọn sản phẩm nào");
		        return;
		    }
		    
		    // Lấy giỏ hàng từ session
		    CartDAO cartDAO = new CartDAO();
		    List<Cart> cart = cartDAO.getCartWithProductInfo(user.getUid());
		    
		    // Lọc ra các sản phẩm đã chọn
		    List<Cart> selectedItems = new ArrayList<>();
		    BigDecimal total = BigDecimal.ZERO;
		    
		    for (String pidStr : selectedProducts) {
		    	int pid = Integer.parseInt(pidStr);
		        for (Cart item : cart) {
		            if (item.getPid() == pid) {
		                selectedItems.add(item);
		                total = total.add(item.getTotalPrice());
		                break;
		            }
		        }
		    }
		    
		    // Lưu thông tin vào session
		    session.setAttribute("selectedItems", selectedItems);
		    session.setAttribute("orderTotal", total);
		    
		    response.sendRedirect("checkout.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
