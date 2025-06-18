package controller.VNPay;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import dao.CartDAO;
import dao.OrderDAO;
import model.Cart;
import model.Users;
import utils.Config;

@WebServlet("/vnpay-payment")
public class VNPay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VNPay() {
        super();
    }

    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");
        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession();
        Users user = (Users) session.getAttribute("acc");

        // Kiểm tra đăng nhập
        if (user == null) {
            resp.sendRedirect("login");
            return;
        }

        // Lấy thông tin từ form
        String fullname = req.getParameter("fullname");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String paymentmethod = "VNPay";
        String language = req.getParameter("language");
        String bankCode = req.getParameter("bankCode");

        // Kiểm tra đơn hàng và sản phẩm được chọn
        List<Cart> selectedItems = (List<Cart>) session.getAttribute("selectedItems");
        BigDecimal total = (BigDecimal) session.getAttribute("orderTotal");

        if (selectedItems == null || selectedItems.isEmpty() || total == null) {
            resp.sendRedirect("cart");
            return;
        }

        // Lưu đơn hàng vào DB
        OrderDAO orderDAO = new OrderDAO();
        int orderId = orderDAO.createOrder(
            user.getUid(), fullname, phone, address,
            paymentmethod, total, selectedItems
        );

        if (orderId > 0) {
            // Xoá khỏi giỏ hàng
            CartDAO cartDAO = new CartDAO();
            for (Cart item : selectedItems) {
                cartDAO.deleteCartItem(user.getUid(), item.getPid());
            }

            // Cấu hình thông tin gửi đến VNPay
            String vnp_Version = "2.1.0";
            String vnp_Command = "pay";
            String orderType = "other";
            long amount = total.multiply(new BigDecimal(100)).longValue(); // Chuyển sang đơn vị nhỏ (VND x 100)
            String vnp_TxnRef = String.valueOf(orderId); // Mã đơn hàng
            String vnp_IpAddr = Config.getIpAddress(req);
            String vnp_TmnCode = Config.vnp_TmnCode;

            Map<String, String> vnp_Params = new HashMap<>();
            vnp_Params.put("vnp_Version", vnp_Version);
            vnp_Params.put("vnp_Command", vnp_Command);
            vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
            vnp_Params.put("vnp_Amount", String.valueOf(amount));
            vnp_Params.put("vnp_CurrCode", "VND");

            if (bankCode != null && !bankCode.isEmpty()) {
                vnp_Params.put("vnp_BankCode", bankCode);
            }

            vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
            vnp_Params.put("vnp_OrderInfo", "Thanh toán đơn hàng: " + vnp_TxnRef);
            vnp_Params.put("vnp_OrderType", orderType);
            vnp_Params.put("vnp_Locale", (language != null && !language.isEmpty()) ? language : "vn");
            vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
            vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

            // Thời gian tạo và hết hạn
            Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
            String vnp_CreateDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

            cld.add(Calendar.MINUTE, 15); // Hết hạn sau 15 phút
            String vnp_ExpireDate = formatter.format(cld.getTime());
            vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

            // Sắp xếp tham số
            List<String> fieldNames = new ArrayList<>(vnp_Params.keySet());
            Collections.sort(fieldNames);
            StringBuilder hashData = new StringBuilder();
            StringBuilder query = new StringBuilder();

            for (Iterator<String> itr = fieldNames.iterator(); itr.hasNext();) {
                String fieldName = itr.next();
                String fieldValue = vnp_Params.get(fieldName);
                if (fieldValue != null && !fieldValue.isEmpty()) {
                    hashData.append(fieldName).append('=')
                            .append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8.toString()));
                    query.append(URLEncoder.encode(fieldName, StandardCharsets.UTF_8.toString()))
                         .append('=')
                         .append(URLEncoder.encode(fieldValue, StandardCharsets.UTF_8.toString()));
                    if (itr.hasNext()) {
                        hashData.append('&');
                        query.append('&');
                    }
                }
            }

            // Tạo chữ ký
            String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
            query.append("&vnp_SecureHash=").append(vnp_SecureHash);

            // Redirect tới VNPay
            String paymentUrl = Config.vnp_PayUrl + "?" + query.toString();
            resp.sendRedirect(paymentUrl);
        } else {
            // Lỗi tạo đơn hàng
            resp.sendRedirect("error.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
