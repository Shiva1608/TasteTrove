package loginportal;

import java.security.SecureRandom;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailSender {
	public static String Gotp;

	public static boolean sendMail(String recepient) throws Exception
	{
		String myEmail = "harisoumyha@gmail.com";
		String password = "Oa5V6LNPrvy98Cs4";
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "false");
		properties.put("mail.smtp.user", "myEmail");
		properties.put("mail.smtp.password", "password");
		properties.put("mail.smtp.host", "smtp-relay.sendinblue.com");
		properties.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(myEmail,password);
			}
		});
		
		Message message = prepareMessage(session,myEmail, recepient);
		Transport.send(message);
		return true;
	}
	
	private static Message prepareMessage(Session session, String myEmail, String recepient) {
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(myEmail));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(recepient));
			message.setSubject("OTP");
			message.setText(generateOTP());
			return message;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	private static String generateOTP()
	{
		int upperbound = 1000000;
		int lowerbound =100000;
		SecureRandom rand = new SecureRandom();
		int int_random = rand.nextInt(lowerbound,upperbound);
		Gotp =Integer.toString(int_random);
		return Gotp;
	}
	
}
