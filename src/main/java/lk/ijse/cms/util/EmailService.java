package lk.ijse.cms.util;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

public class EmailService {

    private static String SENDER_EMAIL;
    private static String SENDER_PASSWORD;

    // ✅ Load from Railway environment variables OR local config.properties
    static {
        try {
            // 1. First try Railway environment variables
            SENDER_EMAIL = System.getenv("mail.sender.email");
            SENDER_PASSWORD = System.getenv("mail.sender.password");

            if (SENDER_EMAIL != null && !SENDER_EMAIL.isEmpty()) {
                System.out.println("✅ Email config loaded from Railway environment: " + SENDER_EMAIL);
            } else {
                // 2. Fall back to local config.properties
                Properties config = new Properties();
                InputStream input = EmailService.class
                        .getClassLoader()
                        .getResourceAsStream("config.properties");
                if (input != null) {
                    config.load(input);
                    SENDER_EMAIL = config.getProperty("mail.sender.email");
                    SENDER_PASSWORD = config.getProperty("mail.sender.password");
                    System.out.println("✅ Email config loaded from config.properties: " + SENDER_EMAIL);
                } else {
                    System.err.println("❌ config.properties NOT FOUND!");
                }
            }
        } catch (Exception e) {
            System.err.println("❌ Failed to load email config: " + e.getMessage());
        }
    }

    private static Session createSession() {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.connectiontimeout", "10000"); // ✅ 10 sec timeout
        props.put("mail.smtp.timeout", "10000"); // ✅ 10 sec timeout
        props.put("mail.smtp.writetimeout", "10000"); // ✅ 10 sec timeout

        return Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(SENDER_EMAIL, SENDER_PASSWORD);
            }
        });
    }

    // ✅ 1. Notify ALL ADMINS when student submits a new complaint
    public static void notifyAdminNewComplaint(List<String> adminEmails,
            String studentId,
            String title,
            String description) {
        new Thread(() -> {
            try {
                Session session = createSession();
                for (String adminEmail : adminEmails) {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(SENDER_EMAIL));
                    message.setRecipients(Message.RecipientType.TO,
                            InternetAddress.parse(adminEmail));
                    message.setSubject("🔔 New Complaint Submitted - CampVoice");
                    message.setContent(
                            "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto;'>" +
                                    "<div style='background: linear-gradient(to right, #2c3e50, #3498db);" +
                                    "padding: 20px; border-radius: 10px 10px 0 0;'>" +
                                    "<h2 style='color: white; margin: 0;'>🔔 New Complaint Received</h2>" +
                                    "</div>" +
                                    "<div style='background: #f8fafc; padding: 25px;" +
                                    "border-radius: 0 0 10px 10px; border: 1px solid #e2e8f0;'>" +
                                    "<p><strong>Student ID:</strong> " + studentId + "</p>" +
                                    "<p><strong>Subject:</strong> " + title + "</p>" +
                                    "<p><strong>Description:</strong></p>" +
                                    "<p style='background: white; padding: 15px; border-radius: 8px;" +
                                    "border-left: 4px solid #3498db;'>" + description + "</p>" +
                                    "<br>" +
                                    "<p style='color: #94a3b8; font-size: 0.85rem;'>" +
                                    "Login to CampVoice Admin Panel to respond.</p>" +
                                    "<div style='margin-top: 20px; padding-top: 15px;" +
                                    "border-top: 1px solid #e2e8f0;'>" +
                                    "<p style='color: #cbd5e1; font-size: 0.75rem;'>" +
                                    "© 2026 CampVoice | Ahmadu Bello University</p>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>",
                            "text/html");
                    Transport.send(message);
                    System.out.println("✅ Admin notified: " + adminEmail);
                }
            } catch (MessagingException e) {
                System.err.println("❌ Admin email failed: " + e.getMessage());
            }
        }).start();
    }

    // ✅ 2. Notify STUDENT when admin updates their complaint
    public static void notifyStudentResolution(String studentEmail,
            String studentId,
            String title,
            String status,
            String remark) {
        new Thread(() -> {
            try {
                Session session = createSession();
                Message message = new MimeMessage(session);
                message.setFrom(new InternetAddress(SENDER_EMAIL));
                message.setRecipients(Message.RecipientType.TO,
                        InternetAddress.parse(studentEmail));
                message.setSubject("📬 Update on Your Complaint - CampVoice");

                String statusColor = status.equals("RESOLVED") ? "#27ae60"
                        : status.equals("IN_PROGRESS") ? "#3498db" : "#f39c12";

                String statusLabel = status.equals("RESOLVED") ? "✅ Resolved"
                        : status.equals("IN_PROGRESS") ? "🔄 In Progress" : "⏳ Pending";

                message.setContent(
                        "<div style='font-family: Arial, sans-serif; max-width: 600px; margin: auto;'>" +
                                "<div style='background: linear-gradient(to right, #2c3e50, #3498db);" +
                                "padding: 20px; border-radius: 10px 10px 0 0;'>" +
                                "<h2 style='color: white; margin: 0;'>📬 Complaint Update</h2>" +
                                "</div>" +
                                "<div style='background: #f8fafc; padding: 25px;" +
                                "border-radius: 0 0 10px 10px; border: 1px solid #e2e8f0;'>" +
                                "<p>Dear <strong>" + studentId + "</strong>,</p>" +
                                "<p>Your complaint regarding <strong>\"" + title + "\"</strong>" +
                                " has been updated.</p>" +
                                "<p><strong>Status: </strong>" +
                                "<span style='background:" + statusColor + "; color: white;" +
                                "padding: 4px 14px; border-radius: 20px; font-size: 0.85rem;'>" +
                                statusLabel + "</span></p>" +
                                "<br>" +
                                "<p><strong>Admin Response:</strong></p>" +
                                "<div style='background: white; padding: 15px; border-radius: 8px;" +
                                "border-left: 4px solid #3498db; white-space: pre-line;'>" +
                                remark + "</div>" +
                                "<br>" +
                                "<p style='color: #94a3b8; font-size: 0.85rem;'>" +
                                "Login to CampVoice to view full details.</p>" +
                                "<div style='margin-top: 20px; padding-top: 15px;" +
                                "border-top: 1px solid #e2e8f0;'>" +
                                "<p style='color: #cbd5e1; font-size: 0.75rem;'>" +
                                "© 2026 CampVoice | Ahmadu Bello University</p>" +
                                "</div>" +
                                "</div>" +
                                "</div>",
                        "text/html");
                Transport.send(message);
                System.out.println("✅ Student notified: " + studentEmail);
            } catch (MessagingException e) {
                System.err.println("❌ Student email failed: " + e.getMessage());
            }
        }).start();
    }
}