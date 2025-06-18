package controller.ProductsAdmin;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import dao.ProductsDAO;

import org.json.JSONObject;

@WebServlet(name = "EditProduct", urlPatterns = {"/edit-product"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,     // 1MB
    maxFileSize = 1024 * 1024 * 5,       // 5MB
    maxRequestSize = 1024 * 1024 * 10    // 10MB
)
public class EditProduct extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String IMGBB_API_KEY = "743833dfb28e88bc2394ffb1b616840b"; // Thay bằng Client-ID của bạn

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");
        String pdesc = request.getParameter("pdesc");
        String pci = request.getParameter("pci");
        String priceStr = request.getParameter("price");
        BigDecimal price = BigDecimal.ZERO;
        if (priceStr != null && !priceStr.isEmpty()) {
            price = new BigDecimal(priceStr);
        }
        int cid = Integer.parseInt(request.getParameter("cid"));
        int collection_id = Integer.parseInt(request.getParameter("collection_id"));
        int discount = Integer.parseInt(request.getParameter("discount"));
        int stock = Integer.parseInt(request.getParameter("stock"));
        boolean isActive = request.getParameter("IsActive") != null;
        String currentImage = request.getParameter("currentImage"); // Ảnh hiện tại từ hidden field
        
        String imageUrl = currentImage; // Mặc định giữ ảnh cũ
        Part filePart = request.getPart("cimage");
        
        try {
            // Xử lý ảnh mới nếu có upload
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

            // Cập nhật vào database
            ProductsDAO dao = new ProductsDAO();
            boolean result = dao.editProducts(pid, pname, pdesc, pci, price, imageUrl, isActive, cid, collection_id, discount, stock);

            if (result) {
                response.sendRedirect("product-manager");
            } else {
                request.getSession().setAttribute("errorMessage", "Không thể cập nhật danh mục");
                response.sendRedirect("product-manager");
            }

        } catch (Exception e) {
            request.getSession().setAttribute("errorMessage", "Lỗi: " + e.getMessage());
            response.sendRedirect("product-manager");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}