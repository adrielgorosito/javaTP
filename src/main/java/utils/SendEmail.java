package utils;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import entities.User;

public class SendEmail {

    public void sendPassword(User u) {

        final String username = "mail@mail.com";
        final String password = "password";

        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
          }
        );
        
        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress("mail@mail.com"));
            msg.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(u.getMail()));
            msg.setSubject("Recuperación de contraseña");
            
            StringBuilder txt = new StringBuilder();
            txt.append("Hola, " + u.getName() + ":").append(System.lineSeparator());
            txt.append("").append(System.lineSeparator());
            txt.append("Hemos recibido una solicitud para recuperar tu cuenta de BG Electronics.").append(System.lineSeparator());
            txt.append("").append(System.lineSeparator());
            txt.append("Tu contraseña es: " + u.getPassword()).append(System.lineSeparator());
            txt.append("").append(System.lineSeparator());
            txt.append("").append(System.lineSeparator());
            txt.append("¿No fuiste tú quien realizó la solicitud?").append(System.lineSeparator());
            txt.append("No te preocupes, solo ignora este email.").append(System.lineSeparator());
            msg.setText(txt.toString());
            
            Transport.send(msg);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}