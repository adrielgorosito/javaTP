package logic;

import data.DataUsers;
import entities.User;

public class CtrlMail {
	
	public DataUsers du = new DataUsers();
	
	public boolean mailExists(User u1) {
		if (du.searchUserByMail(u1) == null)
			return false;
		else
			return true;
	}
	
	public void changeMail(User u1) {
		du.changeMail(u1);
	}
}
