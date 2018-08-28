package configuration;

public class FinalGrade {
	public String finalGrade(String grade) {
		String equi = "";
		if(grade.equals("") || grade.equals("Not S"))
			equi = "Not S";
		else if(grade.equals("0"))
			equi = "";
		else if(grade.equals("I"))
			equi = "INC";
		else if(grade.equals("5.00"))
			equi = "F";
		else
			equi = "P";

		return equi;
	}
}
