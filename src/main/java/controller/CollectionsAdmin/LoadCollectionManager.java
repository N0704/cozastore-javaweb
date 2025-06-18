package controller.CollectionsAdmin;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.CollectionsDAO;
import model.Collections;

@WebServlet("/loadCollection")
public class LoadCollectionManager extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoadCollectionManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        String collection_id = request.getParameter("collection_id");
        CollectionsDAO dao = new CollectionsDAO();
        Collections c = dao.getCollectionsByID(collection_id);

        request.setAttribute("detail", c);
        request.setAttribute("openEdit", true);
        request.getRequestDispatcher("collection-manager").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
