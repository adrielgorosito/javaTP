package logic;

import data.DataUsers;
import entities.User;

public class CtrlAddress {
	
	public void changeAddress(User u) {
		DataUsers du = new DataUsers();
		
		du.changeAddress(u);
	}
	
}