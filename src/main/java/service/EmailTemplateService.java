package service;

import java.text.DecimalFormat;
import model.Orders;

public class EmailTemplateService {

    public String buildOrderConfirmationEmail(Orders order, int orderId, DecimalFormat formatter) {
        return "<!DOCTYPE html>"
                + "<html><head><meta charset='UTF-8'></head>"
                + "<body style='font-family: Arial, sans-serif; color: #000;'>"
                + "<p>Kính gửi Quý khách <strong style='color: #000;'>" + order.getFullName() + "</strong>,</p>"
                + "<p>Chúng tôi xin thông báo đơn hàng của bạn đã được "
                + "<strong style='color: #000;'>xác nhận thành công</strong> và đang được chuẩn bị để giao đến bạn trong thời gian sớm nhất.</p>"
                + "<h3 style='color: #000;'>Thông tin chi tiết đơn hàng:</h3>"
                + "<ul>"
                + "<li><strong>Mã đơn hàng:</strong> #DH-" + orderId + "</li>"
                + "<li><strong>Tổng giá trị:</strong> " + formatter.format(order.getTotal()) + " VNĐ</li>"
                + "<li><strong>Hình thức thanh toán:</strong> " + order.getPaymentMethod() + "</li>"
                + "<li><strong>Địa chỉ nhận hàng:</strong> " + order.getAddress() + "</li>"
                + "</ul>"
                + "<h3 style='color: #000;'>Lưu ý quan trọng:</h3>"
                + "<ul>"
                + "<li>Vui lòng giữ liên lạc để việc nhận hàng được thuận lợi.</li>"
                + "<li>Nhân viên giao hàng sẽ liên hệ với bạn trước khi đến.</li>"
                + "</ul>"
                + "<p>Chúng tôi chân thành cảm ơn bạn đã tin tưởng và ủng hộ <strong style='color: #000;'>Coza Store</strong>! "
                + "Nếu có bất kỳ thắc mắc nào, bạn vui lòng liên hệ hotline <strong style='color: #000;'>1900.xxxx</strong> hoặc phản hồi email này để được hỗ trợ nhanh nhất.</p>"
                + "<p>Trân trọng,<br><strong style='color: #000;'>Đội ngũ Coza Store</strong></p>"
                + "</body></html>";
    }

    public String buildOrderCancellationEmail(Orders order, int orderId, DecimalFormat formatter) {
        return "<!DOCTYPE html>"
                + "<html><head><meta charset='UTF-8'></head>"
                + "<body style='font-family: Arial, sans-serif; color: #000;'>"
                + "<p>Kính gửi Quý khách <strong style='color: #000;'>" + order.getFullName() + "</strong>,</p>"
                + "<p>Chúng tôi xin thông báo đơn hàng của bạn đã được "
                + "<strong style='color: #000;'>quản trị viên hỗ trợ hủy thành công</strong> theo yêu cầu.</p>"
                + "<h3 style='color: #000;'>Thông tin chi tiết đơn hàng:</h3>"
                + "<ul>"
                + "<li><strong>Mã đơn hàng:</strong> #DH-" + orderId + "</li>"
                + "<li><strong>Tổng giá trị:</strong> " + formatter.format(order.getTotal()) + " VNĐ</li>"
                + "<li><strong>Hình thức thanh toán:</strong> " + order.getPaymentMethod() + "</li>"
                + "<li><strong>Địa chỉ nhận hàng:</strong> " + order.getAddress() + "</li>"
                + "</ul>"
                + "<h3 style='color: #000;'>Lưu ý quan trọng:</h3>"
                + "<p>Nếu bạn cần hỗ trợ thêm hoặc có bất kỳ thắc mắc nào liên quan đến "
                + "<strong style='color: #000;'>đơn hàng đã hủy</strong>, "
                + "vui lòng liên hệ hotline <strong style='color: #000;'>1900.xxxx</strong> hoặc phản hồi email này để được hỗ trợ nhanh nhất.</p>"
                + "<p>Chúng tôi chân thành cảm ơn bạn đã tin tưởng và ủng hộ <strong style='color: #000;'>Coza Store</strong>! "
                + "Hy vọng sẽ tiếp tục được phục vụ bạn trong những đơn hàng sắp tới.</p>"
                + "<p>Trân trọng,<br><strong style='color: #000;'>Đội ngũ Coza Store</strong></p>"
                + "</body></html>";
    }
}
