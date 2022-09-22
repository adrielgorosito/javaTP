package logic;

import entities.User;
import data.DataUsers;
import utils.Randomize;
import utils.SendEmail;

public class CtrlPassword {
	
	DataUsers du = new DataUsers();
	
	public User validateMail(User u) {
		return du.searchUserByMail(u);
	}
	
	public void sendMail(User u) {
		SendEmail se = new SendEmail();
		
		se.sendPassword(u);
	}
	
	public String sendMailChangePassword(User u) {
		SendEmail se = new SendEmail();
		Randomize r = new Randomize();
		
		String randomCode = r.generateRandomString();
		se.sendCodeToChangePassword(u, randomCode);
		
		return randomCode;
	}
	
	public int changePassword(User u, String p1, String p2) {
		
		if (p1.length() >= 8) {
			if (p1.equals(p2)) {
				u.setPassword(p1);
				
				du.changePassword(u);
				
				return 0;
			} else {
				return 3;
			}
		} return 4;
	}
	
	
}