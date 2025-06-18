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

@WebServlet("/delete-from-cart")
public class DeleteCartItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteCartItem() {
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
            
            cartDAO.deleteCartItem(uid, pid);
            response.sendRedirect("cart");
	    }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
