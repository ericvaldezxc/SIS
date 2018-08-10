package configuration;

public class Fullname {
	public String fullname(String fname,String mname,String lname) {
		String fullname;
		if(mname.equals(""))
			fullname = lname + ", " + fname;
		else	
			fullname = lname + ", " + fname + " " +  mname;
		return fullname;
	}
}
