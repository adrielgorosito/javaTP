package logic;

import utils.ContactEmail;

public class CtrlContact {
	
	public void sendMailContact(String userMail, String subject, String userMsg) {
		ContactEmail ce = new ContactEmail();
		
		ce.sendMail(userMail, subject, userMsg);
		
	}
	
}
