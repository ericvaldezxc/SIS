package configuration;

public class YearLevelUp {
	public String yearLevel(String yearlvl) {
		if(yearlvl.equals("First Year"))
			yearlvl = "Second Year";
		else if(yearlvl.equals("Second Year"))
			yearlvl = "Third Year";
		else if(yearlvl.equals("Third Year"))
			yearlvl = "Fourth Year";
		
		return yearlvl;
	}
}
