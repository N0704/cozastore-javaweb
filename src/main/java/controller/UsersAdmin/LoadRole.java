package controller.UsersAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import model.Users;

@WebServlet("/loadRole")
public class LoadRole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoadRole() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        int uid = Integer.parseInt(request.getParameter("uid"));
        UsersDAO pdao = new UsersDAO();
        Users u = pdao.getUser(uid);
        
        request.setAttribute("detail", u);
		request.setAttribute("openEdit", true);
        request.getRequestDispatcher("user-manager").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
