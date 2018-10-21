package controller.mobile;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import configuration.RandomCharacter;

public class SendMail {
	  public static void send(String to, String sub,String msg, final String user,final String pass)
		{  
		Properties props = new Properties();
		
		
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");		
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		
		
		Session session = Session.getInstance(props,new javax.mail.Authenticator()
		{
			protected PasswordAuthentication getPasswordAuthentication() 
			{
			 
				return new PasswordAuthentication(user,pass);
			}
		});
		
		try
		{
			
		
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
			message.setSubject(sub);
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String time = dateFormat.format(date); //2016/11/16 12:08:43
			String htmlbody = "<table><tbody><tr><td>This is a computer generated message to confirm that we already created an account for you <h3>"+msg+"</h3> As of <label style='font-style:italic'>"+time+"</label> [Student Information System] </td></tr></tbody></table>";
			message.setContent(htmlbody, "text/html");

			Transport.send(message);
		
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}  
}