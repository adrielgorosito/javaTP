package logic;

import entities.User;
import data.DataUsers;
import utils.SendEmail;

public class CtrlForgotPassword {
	
	DataUsers du = new DataUsers();
	
	public User validateMail(User u) {
		return du.searchUserByMail(u);
	}
	
	public void sendMail(User u) {
		SendEmail se = new SendEmail();
		
		se.sendPassword(u);
	}
	
}