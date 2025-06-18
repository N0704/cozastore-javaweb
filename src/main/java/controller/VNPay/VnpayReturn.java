package controller.VNPay;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.OrderDAO;
import model.Orders;
import utils.Config;

@WebServlet("/vnpayReturn")
public class VnpayReturn extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VnpayReturn() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        OrderDAO orderDAO = new OrderDAO();

        try (PrintWriter out = response.getWriter()) {
            Map<String, String> fields = new HashMap<>();
            for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = params.nextElement();
                String fieldValue = request.getParameter(fieldName);
                if (fieldValue != null && !fieldValue.isEmpty()) {
                    fields.put(fieldName, fieldValue);
                }
            }

            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            String orderId = request.getParameter("vnp_TxnRef");
            String transactionStatus = request.getParameter("vnp_TransactionStatus");

            System.out.println("Received Fields: " + fields);
            System.out.println("vnp_SecureHash: " + vnp_SecureHash);

            if (vnp_SecureHash == null || vnp_SecureHash.isEmpty()) {
                handleInvalidTransaction(request, response, "Thiếu chữ ký bảo mật (vnp_SecureHash)");
                return;
            }

            fields.remove("vnp_SecureHash");
            fields.remove("vnp_SecureHashType");

            String signValue = Config.hashAllFields(fields);
            System.out.println("Calculated signValue: " + signValue);
            if (!signValue.equals(vnp_SecureHash)) {
                handleInvalidTransaction(request, response, "Giao dịch không hợp lệ: Sai chữ ký (invalid signature)");
                return;
            }

            if (orderId == null || orderId.isEmpty()) {
                handleInvalidTransaction(request, response, "Thiếu mã đơn hàng (vnp_TxnRef)");
                return;
            }

            try {
                int parsedOrderId = Integer.parseInt(orderId);
                Orders order = orderDAO.getOrderById(parsedOrderId);
                System.out.println("Order exists: " + (order != null));
                if (order == null) {
                    handleInvalidTransaction(request, response, "Đơn hàng không tồn tại: " + orderId);
                    return;
                }

                if ("Đã thanh toán".equals(order.getPayment_status())) {
                    System.out.println("Order already paid: " + orderId);
                    request.setAttribute("transResult", true);
                    request.setAttribute("orderId", orderId);
                    request.getRequestDispatcher("payreturn.jsp").forward(request, response);
                    return;
                }

                String paymentStatus;
                boolean transSuccess = false;

                switch (transactionStatus) {
                    case "00":
                        paymentStatus = "Đã thanh toán";
                        transSuccess = true;
                        break;
                    case "01":
                        paymentStatus = "Giao dịch chưa hoàn tất";
                        break;
                    case "02":
                        paymentStatus = "Giao dịch bị lỗi";
                        break;
                    case "04":
                        paymentStatus = "Giao dịch bị hoàn tiền";
                        break;
                    default:
                        paymentStatus = "Thanh toán thất bại";
                        break;
                }

                System.out.println("Order ID: " + orderId + ", Transaction Status: " + transactionStatus + ", New Payment Status: " + paymentStatus);

                order.setOrderid(parsedOrderId);
                order.setPayment_status(paymentStatus);
                boolean updateResult = orderDAO.updatePayStatus(order);
                System.out.println("Update Result: " + updateResult);

                if (!updateResult) {
                    System.err.println("Cập nhật trạng thái thanh toán thất bại cho đơn hàng: " + orderId);
                    handleInvalidTransaction(request, response, "Lỗi cập nhật trạng thái thanh toán");
                    return;
                }

                request.setAttribute("transResult", transSuccess);
                request.setAttribute("orderId", orderId);
                System.out.println("transResult before forward: " + transSuccess);
                request.getRequestDispatcher("payreturn.jsp").forward(request, response);

            } catch (NumberFormatException e) {
                handleInvalidTransaction(request, response, "Mã đơn hàng không hợp lệ: " + orderId);
            } catch (Exception e) {
                System.err.println("Lỗi xử lý giao dịch VNPay: " + e.getMessage());
                e.printStackTrace();
                handleInvalidTransaction(request, response, "Lỗi hệ thống khi xử lý giao dịch");
            }
        } catch (Exception e) {
            System.err.println("Lỗi xử lý callback từ VNPay: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi hệ thống");
        }
    }

    private void handleInvalidTransaction(HttpServletRequest request, HttpServletResponse response, String errorMessage)
            throws ServletException, IOException {
        System.err.println("Lỗi giao dịch: " + errorMessage);
        request.setAttribute("transResult", false);
        request.setAttribute("errorMessage", errorMessage);
        request.getRequestDispatcher("payreturn.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}