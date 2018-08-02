package configuration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import connection.DBConfiguration;
import configuration.EncryptandDecrypt;
public class Dropdowns {
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	EncryptandDecrypt ec = new EncryptandDecrypt();


	ResultSet rs;
	
	public String fillfeeDrp() throws SQLException {
		String feeDrp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select Fee_Code,Fee_Description from r_fee WHERE Fee_Display_Status = 'Active' and Fee_Type = 'Basic'");
		int  i = 0 ;
		while(rs.next()){
			if(i == 0){
				feeDrp += "<optgroup label='Basic Fee'>";				
				
			}
			feeDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code"))+"' data-description='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			feeDrp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Fee_Code,Fee_Description from r_fee WHERE Fee_Display_Status = 'Active' and Fee_Type = 'Laboratory'");
		while(rs.next()){
			if(i == 0){
				feeDrp += "<optgroup label='Laboratory Fee'>";				
				
			}
			feeDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code"))+"' data-desciption='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			feeDrp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Fee_Code,Fee_Description from r_fee WHERE Fee_Display_Status = 'Active' and Fee_Type = 'Miscellaneous'");
		while(rs.next()){
			if(i == 0){
				feeDrp += "<optgroup label='Miscellaneous Fee'>";				
				
			}
			feeDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code"))+"' data-desciption='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"</option>";
			i++;
			
		}
		if(i != 0){
			feeDrp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Fee_Code,Fee_Description from r_fee WHERE Fee_Display_Status = 'Active' and Fee_Type = 'Other'");
		while(rs.next()){
			if(i == 0){
				feeDrp += "<optgroup label='Other Fee'>";				
				
			}
			feeDrp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code"))+"' data-desciption='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"</option>";
			i++;
			
		}
		if(i != 0){
			feeDrp += "</optgroup>";				
			
		}
		i = 0;
		return feeDrp;
	}
	public String fillacadyearDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		int  i = 0 ;
		/*
		rs = stmnt.executeQuery("Select Academic_Year_Code,Academic_Year_Description from r_academic_year WHERE Academic_Year_Display_Status = 'Active' and Academic_Year_Active_Flag = 'Used'");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Used'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}*/
		i = 0;
		rs = stmnt.executeQuery("Select Academic_Year_Code,Academic_Year_Description from r_academic_year WHERE Academic_Year_Display_Status = 'Active' and Academic_Year_Active_Flag = 'Present'");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Present'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Academic_Year_Code,Academic_Year_Description from r_academic_year WHERE Academic_Year_Display_Status = 'Active' and Academic_Year_Active_Flag = 'Not Used'");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Not Used'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+"</option>";
			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		return Drp;
	}
	
	public String fillsubjectDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select Subject_Code,Subject_Description,Subject_Credited_Units from r_subject WHERE Subject_Display_Stat = 'Active' and Subject_Type = 'Academic'");
		int  i = 0 ;
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Academic'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Subject_Code,Subject_Description from r_subject WHERE Subject_Display_Stat = 'Active' and Subject_Type = 'Non-Academic'");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Non-Academic'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		
		return Drp;
	}
	
	public String fillgroupsubjectDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select distinct t1.Subject_Code,t1.Subject_Description,t1.Subject_Credited_Units from r_subject as t1 inner join r_subject as t2 on t1.Subject_ID = t2.Subject_Group WHERE t1.Subject_Display_Stat = 'Active' and t2.Subject_Display_Stat = 'Active'");
		while(rs.next()){

			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</option>";

		}

		return Drp;
	}

	public String fillcourseDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select Course_Code,Course_Description from r_course WHERE Course_Display_Status = 'Active' ");
		int  i = 0 ;
		while(rs.next()){
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</option>";

			i++;
			
		}
		i = 0;
		
		return Drp;
	}
	
	public String fillcampusDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select Campus_Code,Campus_Name from r_campus WHERE Campus_Display_Status = 'Active' ");
		int  i = 0 ;
		while(rs.next()){
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Campus_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Campus_Name"))+"</option>";

			i++;
			
		}
		i = 0;
		
		return Drp;
	}
	public String fillsemesterDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select Semester_Code,Semester_Description from r_semester WHERE Semester_Display_Status = 'Active' and Semester_Active_Flag ='Active' ");
		int  i = 0 ;
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Active'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select Semester_Code,Semester_Description from r_semester WHERE Semester_Display_Status = 'Active' and Semester_Active_Flag ='Inactive' ");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Inactive'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		
		return Drp;
	}
	public String fillcuryearDrp() throws SQLException {
		String Drp = "";
		Statement stmnt = conn.createStatement();
		rs = stmnt.executeQuery("Select * from r_curriculumyear WHERE CurriculumYear_Display_Status = 'Active' and CurriculumYear_Ative_Flag ='Active' ");
		int  i = 0 ;
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Active'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		rs = stmnt.executeQuery("Select * from r_curriculumyear WHERE CurriculumYear_Display_Status = 'Active' and CurriculumYear_Ative_Flag ='Inactive' ");
		while(rs.next()){
			if(i == 0){
				Drp += "<optgroup label='Inactive'>";				
				
			}
			Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"))+"' >"+ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"))+"</option>";

			i++;
			
		}
		if(i != 0){
			Drp += "</optgroup>";				
			
		}
		i = 0;
		
		return Drp;
	}
	public String fillyearlvl() throws SQLException {
		String Drp = "";
		Drp += "<option value='1'>First Year</option>";
		Drp += "<option value='2'>Second Year</option>";
		Drp += "<option value='3'>Third Year</option>";
		Drp += "<option value='4'>Fourth Year</option>";
		Drp += "<option value='5'>Fifth Year</option>";

		return Drp;
	}
	public String fillyearlvldrp() throws SQLException {
		String Drp = "";
		Drp += "<option value='First Year'>First Year</option>";
		Drp += "<option value='Second Year'>Second Year</option>";
		Drp += "<option value='Third Year'>Third Year</option>";
		Drp += "<option value='Fourth Year'>Fourth Year</option>";
		Drp += "<option value='Fifth Year'>Fifth Year</option>";

		return Drp;
	}


}
