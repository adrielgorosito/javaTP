package logic;

import data.DataUsers;
import entities.User;

public class CtrlMail {
	
	public void changeMail(User u1) {
		DataUsers du = new DataUsers();
		du.changeMail(u1);
	}
}
