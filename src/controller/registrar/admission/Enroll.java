package controller.registrar.admission;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import configuration.RandomCharacter;
import connection.DBConfiguration;
import controller.mobile.SendMail;

/**
 * Servlet implementation class AdmissionEnrollController
 */
@WebServlet("/Registrar/Controller/Registrar/Admission/Enroll")
public class Enroll extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Enroll() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/plain");
		EncryptandDecrypt ec = new EncryptandDecrypt();

		String studentid = request.getParameter("studentid");
		String CourseDrp = request.getParameter("CourseDrp");
		String SectionDrp = request.getParameter("SectionDrp");
		String type = request.getParameter("typeDrp");
		String campus = request.getParameter("campus");
		String amount = request.getParameter("amount");

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		PrintWriter out = response.getWriter();	
		Statement stmnt = null;

		JSONParser jsonParser=new JSONParser();
		JSONArray subject = new JSONArray();
		Object object = null;

		JSONParser jsonParser2=new JSONParser();
		JSONArray breakfee = new JSONArray();
		Object object2 = null;

		try {
			object=jsonParser.parse(request.getParameter("subject"));
			object2=jsonParser2.parse(request.getParameter("breakfee"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		sql = "SELECT CONCAT(YEAR(CURRENT_DATE),'-',RIGHT(COUNT(*)+100001,5),'-"+campus+"-0') AS STUDNUM FROM `t_student_account` where LEFT(Student_Account_Student_Number,4) = YEAR(CURRENT_DATE) and Student_Account_CampusID = (SELECT Campus_ID FROM r_campus WHERE Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, campus)+"') ";
		String studnum="";
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				studnum = rs.getString("STUDNUM");
			}
	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		subject = (JSONArray) object;
		breakfee = (JSONArray) object2;
		try {
			
			sql = "insert into `t_student_account` (Student_Account_CampusID,Student_Account_Type,Student_Account_Student_Profile_ID,Student_Account_Student_Number,Student_Account_Scholastic_Status,Student_Account_Year,Student_Account_CourseID,Student_Account_SectionID,Student_Account_CurriculumYearID) values ((SELECT Campus_ID FROM r_campus WHERE Campus_Code = '"+ec.encrypt(ec.key, ec.initVector, campus)+"'),'"+type+"','"+studentid+"','"+studnum+"','Regular','First Year',(SELECT Course_ID FROM r_course WHERE Course_Code = '"+ec.encrypt(ec.key, ec.initVector, CourseDrp)+"'),'"+SectionDrp+"',(SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE CurriculumYear_Ative_Flag = 'Active'))";
			stmnt.execute(sql);
			out.print(sql);
			
			 
		      

			for (Object o : subject) {
				JSONObject jsonLineItem = (JSONObject) o;
				String code = (String) jsonLineItem.get("code");
		        String grade = (String) jsonLineItem.get("grade");
				sql = "INSERT INTO `t_student_taken_curriculum_subject` (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) VALUES ((SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code.toString())+"'),(SELECT Student_Account_ID FROM t_student_account WHERE Student_Account_ID = (SELECT MAX(Student_Account_ID) FROM t_student_account)),'true',null,null,null,null,null)";
				out.print(sql+"\n");
				stmnt.execute(sql);
				
				sql = "INSERT INTO `t_students_grade` (Students_Grade_StudentTakenCurriculumSubjectID,Students_Grade_FacultyID,Students_Grade_Grade) VALUES ((SELECT Student_Taken_Curriculum_Subject_ID FROM t_student_taken_curriculum_subject WHERE Student_Taken_Curriculum_Subject_ID = (SELECT MAX(Student_Taken_Curriculum_Subject_ID) FROM t_student_taken_curriculum_subject)),null,'"+grade+"')";
				out.print(sql+"\n");
				stmnt.execute(sql);


			}

			String to = "";
			 ResultSet rs = stmnt.executeQuery("SELECT * FROM r_student_profile WHERE Student_Profile_ID = (select max(Student_Profile_ID) from r_student_profile)");
			 while(rs.next()){
				 to = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Email_Address")) ;
		 	 }
			
			 RandomCharacter ran = new RandomCharacter();
			 String userpass = ran.showPassword();
			  String subject2 = "Confirmation";
		      String message =  "<html><body><h4>The username is "+studnum+" and the password is "+userpass+"</h4></body></html>";
		      String user = "sisbsit41@gmail.com";
		      String pass = "passwordsis";
		      SendMail.send(to,subject2, message, user, pass);
	      
			
			sql = "insert into `r_user_account` (User_Account_Reference,User_Account_Type,User_Account_Username,User_Account_Password) VALUES ((SELECT MAX(Student_Account_ID) FROM t_student_account),'Student','"+ec.encrypt(ec.key, ec.initVector, studnum)+"','"+ec.encrypt(ec.key, ec.initVector, userpass)+"') ";			
			out.print(sql);
			stmnt.execute(sql);
			
			for (Object o : breakfee) {
				JSONObject jsonLineItem = (JSONObject) o;
				String desc = (String) jsonLineItem.get("desc");
		        String feeamou = (String) jsonLineItem.get("amount");
				sql = "insert into `t_breakdown_fee` (Breakdown_Fee_Student_Account_ID,Breakdown_Fee_Semester_ID,Breakdown_Fee_AcademicYearID,Breakdown_Fee_Description,Breakdown_Fee_Amount,Breakdown_Fee_Type) VALUES ((SELECT MAX(Student_Account_ID) FROM t_student_account),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),'"+desc+"','"+feeamou+"','Enrollment') ";			
				out.print(sql);
				stmnt.execute(sql);


			}
			
			
			sql = "insert into `t_payment` (Payment_Student_Account_ID,Payment_Balance) VALUES ((SELECT MAX(Student_Account_ID) FROM t_student_account),'"+amount+"') ";			
			out.print(sql);
			stmnt.execute(sql);
			
			
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
