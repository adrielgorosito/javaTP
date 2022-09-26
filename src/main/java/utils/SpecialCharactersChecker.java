package utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SpecialCharactersChecker {
	
	public boolean hasSpecialCharacters(String word) {
		Pattern pat = Pattern.compile("[^a-z0-9 ]", Pattern.CASE_INSENSITIVE);
		Matcher m = pat.matcher(word);
		
		if (m.find()) {
			return true;
		} else {
			return false;
		}
	}
	
}