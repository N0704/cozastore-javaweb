package controller.ChatBot;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ChatDAO;

@WebServlet("/chatbotProxy")
public class ChatbotProxyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String API_KEY = "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"; 
    private static final String MODEL = "deepseek/deepseek-chat-v3-0324:free";

    public ChatbotProxyServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        String userMessage = request.getParameter("message");
        ChatDAO dao = new ChatDAO();
        String productInfo = dao.getChatResponse(userMessage);

        String systemPrompt = """
            Bạn là CozaBot, một trợ lý bán hàng thời trang chuyên nghiệp của thương hiệu Coza. Nhiệm vụ của bạn là tư vấn cho khách hàng về các sản phẩm thời trang. 
            Đây là thông tin sản phẩm từ cơ sở dữ liệu: %s

			Hãy đọc kỹ câu hỏi của khách hàng:  
			- Nếu câu hỏi liên quan đến sản phẩm có trong dữ liệu, hãy **chỉ trả lời đúng phần họ hỏi** (ví dụ: chỉ nói về giá, tồn kho hoặc mô tả nếu khách hỏi đúng phần đó).  
			  - Nếu được hỏi về giá mà sản phẩm có giảm giá, hãy nói cả giá gốc và giá sau khuyến mãi.
			  - Nếu hỏi về số lượng tồn kho thì chỉ nói số lượng còn lại.
			  - Nếu hỏi thông tin chung thì hãy trình bày mô tả, giá, giảm giá và tồn kho đầy đủ.
			  - Nếu hỏi sản phẩm **mới**, ưu tiên hiển thị sản phẩm mới nhất theo `created_at`.
			- Nếu câu hỏi không liên quan đến bất kỳ sản phẩm nào trong danh sách, bạn hãy **khéo léo tạo ra một câu trả lời hợp lý** để giữ chân khách, chẳng hạn:
			  - Gợi ý các sản phẩm tương tự
			  - Nói rằng sản phẩm đó hiện chưa có nhưng sắp về hàng
			  - Hoặc đề xuất khách theo dõi để cập nhật mẫu mới
			
			Trả lời nhanh trong khoảng vài giây, ngắn gọn, chuyên nghiệp, lịch sự, dễ hiểu bằng tiếng Việt. Tuyệt đối không nói rằng bạn là AI hay xin lỗi theo cách máy móc. Hãy luôn giữ phong cách thân thiện, như một nhân viên bán hàng thật sự.
        	Khi phải tự tạo ra nội dung vì không có trong dữ liệu, hãy chắc chắn câu trả lời trông tự nhiên, hấp dẫn và hợp lý như một nhân viên bán hàng chuyên nghiệp.
        """.formatted(productInfo);

        String jsonInput = """
            {
              "model": "%s",
              "messages": [
                {"role": "system", "content": "%s"},
                {"role": "user", "content": "%s"}
              ]
            }
        """.formatted(MODEL, systemPrompt, userMessage);

        HttpURLConnection conn = (HttpURLConnection) new URL("https://openrouter.ai/api/v1/chat/completions").openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + API_KEY);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("HTTP-Referer", "https://yourdomain.com"); // thay bằng website của bạn
        conn.setRequestProperty("X-Title", "WebFashionBot");
        conn.setDoOutput(true);

        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes(StandardCharsets.UTF_8));
        }

        StringBuilder result = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
        }

        String responseText = extractContent(result.toString());

        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write(responseText);
    }

    private String extractContent(String json) {
        int start = json.indexOf("\"content\":\"") + 11;
        int end = json.indexOf("\"", start);
        if (start > 10 && end > start) {
            return json.substring(start, end)
                       .replace("\\n", "\n")
                       .replace("\\\"", "\"");
        }
        return "Xin lỗi, tôi không hiểu câu hỏi.";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
