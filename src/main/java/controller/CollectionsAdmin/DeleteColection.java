package controller.CollectionsAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CollectionsDAO;

@WebServlet(name = "DeleteColection", urlPatterns = {"/delete-collection"})
public class DeleteColection extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteColection() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	        String collection_id = request.getParameter("collection_id");
	        CollectionsDAO dao = new CollectionsDAO();
	        dao.deleteCollections(collection_id);
	        response.sendRedirect("collection-manager");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
