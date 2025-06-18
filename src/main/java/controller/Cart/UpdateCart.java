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


@WebServlet("/update-cart")
public class UpdateCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateCart() {
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
            cartDAO.updateQuantity(uid, pid, quantity);
            response.sendRedirect("cart");
	    }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
