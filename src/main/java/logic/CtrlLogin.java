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
			
			if (du.loginByUsername(u) != null) {
				return du.loginByUsername(u);
			} else {
				u.setDni(Integer.parseInt(word));
				u.setPassword(pass);
				
				return du.loginByDni(u);
			}
			
		}
	}

}
