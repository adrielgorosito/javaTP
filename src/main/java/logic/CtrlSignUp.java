package logic;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import data.DataUsers;
import entities.*;

public class CtrlSignUp {
	
	private DataUsers du = new DataUsers();

	public boolean hasSpecialCharacters(String word) {
		Pattern pat = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = pat.matcher(word);
		
		if (m.find()) {
			return true;
		} else {
			return false;
		}
	}
	
	public int createNewUser(User u1) {
		User u2 = new User();
		int error;
		
		u2 = du.searchUserByDni(u1);
		if (u2 == null) {
			u2 = du.searchUserByUsername(u1);
			if (u2 == null) {
				u2 = du.searchUserByMail(u1);
				if (u2 == null) {
					du.addNewUser(u1);
					error = 0;
				} else {
					error = 7;
				}
			} else {
				error = 6;
			}
		} else {
			error = 5;
		}
		
		return error;
	}
	
}
