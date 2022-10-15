package utils;

import java.util.Random;

public class Randomize {
	
	public String generateRandomString() {
		int leftLimit = 48; // número "0"
	    int rightLimit = 122; // letra "z"
	    int targetStringLength = 20; // tamaño final del String
	    Random random = new Random();
	    
	    String generatedString = random.ints(leftLimit, rightLimit + 1)
	      .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97)) // Evita que aparezcan caracteres raros
	      .limit(targetStringLength)
	      .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	      .toString();
	    
		return generatedString;
	}
	
	public int getRandomId(int max) {
		int randomId = (int) (Math.random()*(max-1)) + 1;
		return randomId;
	}
	
}
