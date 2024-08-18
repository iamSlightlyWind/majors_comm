package Main;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;

public class Email {
    private final String username = System.getenv("EMAIL_ADDRESS");
    private final String password = System.getenv("EMAIL_PASSWORD");

    public boolean checkLocal() {
        if (username == null || password == null) {
            return false;
        }
        return true;
    }

    public void sendRecoveryPassword(String email, String password) {
        if (!checkLocal()) {
            return;
        }
        String htmlContent = head()
                + "\n<body>\n" + //
                "    <div class=\"container\">\n" + //
                "        <h1>Recover your account at Major's Comm!</h1>\n" + //
                "        <p>You sent us a request to reset your password.</p>\n" + //
                "        <p>Here is your new password:</p>\n" + //
                "        <p class=\"code\">" + password + "</p>\n" + //
                "        <p>Please login using this new password if you wish to reset it.<br>You can change your password later in\n"
                + //
                "            profile settings.</p>\n" + //
                "        <p>Otherwise, your old password will stay the same.</p>\n" + //
                "\n" + //
                "        <br>\n" + //
                "        <p class=\"footer\">Your information is in safe hands.</p>\n" + //
                "        <p class=\"footer\">The Major's Comm Team</p>\n" + //
                "    </div>\n" + //
                "</body>\n" + //
                "\n" + //
                "</html>";

        sendEmail(email, "Recover your account at Major's Comm", htmlContent);
    }

    protected String head() {
        String head = "<!DOCTYPE html>\n" + //
                "<html lang=\"en\">\n" + //
                "\n" + //
                "<head>\n" + //
                "    <meta charset=\"UTF-8\">\n" + //
                "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n" + //
                "    <style>\n" + //
                "";

        String tail = "\n" + //
                "    </style>\n" + //
                "</head>";

        return head + style + tail;
    }

    protected String style = "body {\n" + //
            "    font-family: Arial, sans-serif;\n" + //
            "    background-color: #f4f4f4;\n" + //
            "    margin: 0;\n" + //
            "    padding: 0;\n" + //
            "    display: flex;\n" + //
            "    justify-content: center;\n" + //
            "    align-items: center;\n" + //
            "    height: 100vh;\n" + //
            "}\n" + //
            "\n" + //
            ".container {\n" + //
            "    background-color: #ffffff;\n" + //
            "    border-radius: 8px;\n" + //
            "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" + //
            "    padding: 20px;\n" + //
            "    max-width: 800px;\n" + //
            "    width: 100%;\n" + //
            "    text-align: center;\n" + //
            "}\n" + //
            "\n" + //
            "p {\n" + //
            "    color: #666;\n" + //
            "    line-height: 1.6;\n" + //
            "}\n" + //
            "\n" + //
            ".code {\n" + //
            "    font-size: 1.2em;\n" + //
            "    font-weight: bold;\n" + //
            "    color: #2c3e50;\n" + //
            "    background-color: #ecf0f1;\n" + //
            "    padding: 10px;\n" + //
            "    border-radius: 5px;\n" + //
            "    display: inline-block;\n" + //
            "    margin: 20px 0;\n" + //
            "}\n" + //
            "\n" + //
            ".link {\n" + //
            "    color: #2980b9;\n" + //
            "    text-decoration: none;\n" + //
            "}\n" + //
            "\n" + //
            ".link:hover {\n" + //
            "    text-decoration: underline;\n" + //
            "}\n" + //
            "\n" + //
            "body {\n" + //
            "    font-family: Arial, sans-serif;\n" + //
            "    background-color: #f4f4f4;\n" + //
            "    margin: 0;\n" + //
            "    padding: 0;\n" + //
            "    display: flex;\n" + //
            "    justify-content: center;\n" + //
            "    align-items: center;\n" + //
            "    height: 100vh;\n" + //
            "}\n" + //
            "\n" + //
            ".container {\n" + //
            "    background-color: #ffffff;\n" + //
            "    border-radius: 8px;\n" + //
            "    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n" + //
            "    padding: 20px;\n" + //
            "    max-width: 800px;\n" + //
            "    width: 100%;\n" + //
            "    text-align: center;\n" + //
            "}\n" + //
            "\n" + //
            "h1 {\n" + //
            "    color: #333;\n" + //
            "}\n" + //
            "\n" + //
            ".link {\n" + //
            "    color: #2980b9;\n" + //
            "    text-decoration: none;\n" + //
            "}\n" + //
            "\n" + //
            ".link:hover {\n" + //
            "    text-decoration: underline;\n" + //
            "}\n" + //
            "\n" + //
            ".footer {\n" + //
            "    color: #999;\n" + //
            "    font-size: 0.8em;\n" + //
            "    margin-top: 20px;\n" + //
            "    clear: both;\n" + //
            "}\n" + //
            "\n" + //
            "table {\n" + //
            "    border-collapse: collapse;\n" + //
            "    max-width: 75%;\n" + //
            "    min-width: 50%;\n" + //
            "    margin: auto;\n" + //
            "    background-color: #ecf0f1;\n" + //
            "}\n" + //
            "\n" + //
            "td,\n" + //
            "th {\n" + //
            "    padding: 8px;\n" + //
            "    text-align: left;\n" + //
            "}\n" + //
            "\n" + //
            ".section-header {\n" + //
            "    color: white;\n" + //
            "    font-weight: bold;\n" + //
            "    background-color: #E65103;\n" + //
            "}\n" + //
            "\n" + //
            ".summary-item {\n" + //
            "    border-right: 2px solid white;\n" + //
            "}";

    public void sendEmail(String address, String subject, String content) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
                new jakarta.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(address));
            message.setSubject(subject);
            message.setContent(content, "text/html");

            Transport.send(message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}