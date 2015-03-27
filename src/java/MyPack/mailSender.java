/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MyPack;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

/**
 *
 * @author Arpit Kesharwani
 */
public class mailSender {

    public static void mailsender(String type, String name, String to, String message1) {

        if ("contactEmail".equals(type) || "attachmentEmail".equals(type)) {
            to = "arpitanshul@gmail.com";
        }
        //Sender's Email Id
        String from = "arpitanshul@gmail.com";
        //your host Server like Gmail or Yahoo
        //Assume we are using Gmail 
        String host = "smtp.gmail.com";
        String port = "587";
        //get System Properties
        Properties properties = System.getProperties();

        //setup mail Server
        properties.put("mail.smtp.host", "smtp.gmail.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");
        //We are using TLS Security(other Security is SSL)
        properties.put("mail.smtp.starttls.enable", "true");
        // Session session = Session.getDefaultInstance(properties);
        //get the default session object
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("arpitanshul@gmail.com", "105767512");
            }
        }
        );

        try {
            //Create default MimeMessage Object
            MimeMessage message = new MimeMessage(session);
            //set From: header field of the header
            message.setFrom(new InternetAddress(from));
            //set To: header field of the header
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            //set Subject:header field
            switch (type) {
                case "contactEmail":
                    message.setSubject("Feedback message from " + name);
                    //send the actual HTML meaasge as big as you like
                    message.setContent("<h1>Hi Arpit</h1>"
                            + "<h2>" + message1 + "</h2>"
                            + "<p>Regards</p>"
                            + "<p>Arpit's Gallery</p>", "text/html");
                    break;
                case "RegisterEmail":
                    message.setSubject("Greeting Email from Arpit's Gallery");
                    //send the actual HTML meaasge as big as you like
                    message.setContent("<h1>Hi " + name + "</h1>"
                            + "<h2>Thank You for register at Arpit's Gallery</h2>"
                            + "<p>Regards</p>"
                            + "<p>Arpit's Gallery</p>", "text/html");
                    break;
                case "friendAddMail":
                    message.setSubject("Greeting Email from Arpit's Gallery");
                    //send the actual HTML meaasge as big as you like
                    message.setContent("<h1>Hi " + name + "</h1>"
                            + "<h2>You are just added in Arpit's Gallery By Arpit Kesharwani.</h2>"
                            + "<h3>Please Visit the Website at </h3><a>www.arpitech.in</a>"
                            + "<p>Regards</p>"
                            + "<p>Arpit's Gallery</p>", "text/html");
                    break;
                case "attachmentEmail":
                    message.setSubject("Attachment Email from Arpit's Gallery");
                    //sent file attachment demo
                    //create the message part
                    BodyPart messageBodyPart = new MimeBodyPart();
                    //fill the message by set Text(simple message) or setContent(HTML message)
                    messageBodyPart.setText("This is for demo");
                    //create a multipart message
                    Multipart multipart = new MimeMultipart();
                    //set text message part
                    multipart.addBodyPart(messageBodyPart);
                    //part 2 is attachment
                    messageBodyPart = new MimeBodyPart();
                    String fileName = "E:/FB_IMG_1423823764021.jpg";
                    DataSource source = new FileDataSource(fileName);
                    messageBodyPart.setDataHandler(new DataHandler(source));
                    messageBodyPart.setFileName(fileName);
                    multipart.addBodyPart(messageBodyPart);
                    //send the complete message parts
                    message.setContent(multipart);
                    break;
            }
            //send Message
            Transport.send(message);
            System.out.println("sent mssage Successfully");
        } catch (MessagingException e) {
            System.out.println("MailError=" + e.toString());
        }
    }

}
