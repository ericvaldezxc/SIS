package configuration;

import java.util.Random;

public class RandomCharacter {
	public static String showPassword() {
		String password = "";
		
		String[] myChar = {"","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t",
				"u","v","w","x","y","z","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q",
				"R","S","T","U","V","W","X","Y","Z"};
		String[] myNum = {"","0","1","2","3","4","5","6","7","8","9"};
		
		Random rand = new Random();

		int i = 0;
		while(i < 10) {
			int  n = rand.nextInt(2) + 1;
			String curchar = "";
			if(n == 1) {
				int place = rand.nextInt(50) + 1;
				curchar = myChar[place];
			}
			else {
				int place = rand.nextInt(10) + 1;
				curchar = myNum[place];
				
			}
			password += curchar;
			i++;
			
		}
		
		return password;
	}

}
