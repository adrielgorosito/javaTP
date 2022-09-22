package logic;

import utils.SendEmail;

public class CtrlContact {
	
	public void sendMailContact(String userMail, String subject, String userMsg) {
		SendEmail se = new SendEmail();
		
		se.sendMail(userMail, subject, userMsg);
		
	}
	
}
