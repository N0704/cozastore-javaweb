package controller.CollectionsAdmin;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import dao.CollectionsDAO;

import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.JSONObject;

@WebServlet(name = "AddColection", urlPatterns = {"/add-collection"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB
    maxFileSize = 1024 * 1024 * 5,       // 5MB
    maxRequestSize = 1024 * 1024 * 10    // 10MB
)
public class AddColection extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Thay bằng Client-ID của bạn
    private static final String IMGBB_API_KEY = "743833dfb28e88bc2394ffb1b616840b";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String name = request.getParameter("name");
        String hashtag = request.getParameter("hashtag");
        String style = request.getParameter("style");

        Part filePart = request.getPart("cimage");
        String imageUrl = null; // Mặc định là null

        try {
            // Xử lý upload ảnh nếu có
        	if (filePart != null && filePart.getSize() > 0) {
        	    InputStream inputStream = filePart.getInputStream();
        	    byte[] imageBytes = inputStream.readAllBytes();
        	    String base64Image = Base64.getEncoder().encodeToString(imageBytes);

        	    // Gửi lên imgbb
        	    URL url = new URL("https://api.imgbb.com/1/upload?key=" + IMGBB_API_KEY);
        	    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        	    conn.setRequestMethod("POST");
        	    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        	    conn.setDoOutput(true);

        	    String data = "image=" + URLEncoder.encode(base64Image, "UTF-8");
        	    try (OutputStream os = conn.getOutputStream()) {
        	        os.write(data.getBytes());
        	    }

        	    if (conn.getResponseCode() != 200) {
        	        throw new ServletException("Lỗi imgbb API: " + conn.getResponseCode());
        	    }

        	    try (InputStream responseStream = conn.getInputStream()) {
        	        String jsonResponse = new String(responseStream.readAllBytes());
        	        JSONObject json = new JSONObject(jsonResponse);
        	        imageUrl = json.getJSONObject("data").getString("url");
        	    }
            }

            // Gọi DAO để thêm vào database
            CollectionsDAO dao = new CollectionsDAO();
            dao.insertCollections(name, imageUrl, hashtag, style);
            response.sendRedirect("collection-manager");


        } catch (Exception e) {
            // Chuyển hướng kèm thông báo lỗi (qua URL hoặc session)
            request.getSession().setAttribute("errorMessage", "Lỗi: " + e.getMessage());
            response.sendRedirect("collection-manager");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doPost(request, response);
    }
}
