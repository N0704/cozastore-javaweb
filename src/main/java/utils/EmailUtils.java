package utils;

import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class EmailUtils {
    private static final String FROM_EMAIL = "coza.vn@gmail.com"; // Gmail của bạn
    private static final String PASSWORD = "guwe xvyx zrkv miuv"; // App password từ Gmail

    public static void sendEmail(String toEmail, String subject, String messageText) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Tạo session
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(FROM_EMAIL, PASSWORD);
            }
        });

        try {
            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(FROM_EMAIL));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );
            message.setSubject(subject);

            // Gửi nội dung HTML
            message.setContent(messageText, "text/html; charset=UTF-8");

            // Gửi
            Transport.send(message);
            System.out.println("Đã gửi email tới " + toEmail);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
