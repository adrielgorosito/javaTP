package logic;

import entities.*;
import data.*;

public class CtrlLogin {
	
	private DataUsers du = new DataUsers();
	
	public User userExists(String word, String pass) {
		User u = new User();
		
		if (word.contains("@")) {
			u.setMail(word);
			u.setPassword(pass);
			
			return du.loginByMail(u);
			
		} else {
			u = new User(word, pass);
			
			return du.loginByUsername(u);
		}
	}

}
