package controller.registrar.student;

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
import connection.DBConfiguration;

/**
 * Servlet implementation class Application
 */
@WebServlet("/Registrar/Controller/Registrar/Student/Shift")
public class Shift extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Shift() {
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

		String studnum = request.getParameter("studnum");
		String course = request.getParameter("course");
		String section = request.getParameter("section");
		course =  ec.encrypt(ec.key, ec.initVector,course);
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		JSONArray curtaken = new JSONArray();
		
		try {
			object=jsonParser.parse(request.getParameter("curtaken"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		curtaken=(JSONArray) object;

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
//			sql = "insert into r_student_profile (Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Profile_Date_Of_Birth,Student_Profile_Place_Of_Birth,Student_Profile_Gender,Student_Profile_Civil_Status,Student_Profile_Address,Student_Profile_Contact_Number,Student_Profile_Email_Address) values ('"+ec.encrypt(ec.key, ec.initVector, firstNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, middleNameTxt)+"','"+ec.encrypt(ec.key, ec.initVector, lastNameTxt)+"','"+dobTxt+"','"+ec.encrypt(ec.key, ec.initVector, pobTxt)+"','"+genderDrp+"','"+civilDrp+"','"+ec.encrypt(ec.key, ec.initVector, addressTxt)+"','"+ec.encrypt(ec.key, ec.initVector, conTxt)+"','"+ec.encrypt(ec.key, ec.initVector, emailTxt)+"')";
		
		
		try {

			PrintWriter out = response.getWriter();	
			
			sql = "Update t_student_account set Student_Account_Year = 'First Year',Student_Account_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"' ),Student_Account_SectionID = (SELECT Section_ID FROM `r_section` WHERE Section_Code = '"+section+"'),Student_Account_CurriculumYearID = (SELECT CurriculumYear_ID FROM `r_curriculumyear` WHERE CurriculumYear_Ative_Flag = 'Active') where Student_Account_Student_Number = '"+studnum+"'";
			out.print(sql);
			stmnt.execute(sql);
			
			for (Object o : curtaken) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String code = (String) jsonLineItem.get("code");
		        String sect = (String) jsonLineItem.get("section");
		        code =  ec.encrypt(ec.key, ec.initVector,code);
		        String takenstat = (String) jsonLineItem.get("takenstat");
		        
				
				String insertquery = "INSERT INTO t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID)  VALUES ((SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+code+"'  ),(SELECT Student_Account_ID FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"'),'"+takenstat+"','First Year',(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),(SELECT Section_ID FROM `r_section` where Section_Code = '"+sect+"'),(SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"' )) ";
				
				out.print(insertquery);
				stmnt.execute(insertquery);

					
			}
			
			
			
			/*
			sql = "SELECT * FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			String couid = "";
			String yearlvl = "";
			String studid = "";
			
			while(rs.next()){
				couid = rs.getString("Student_Account_CourseID");
				yearlvl = rs.getString("Student_Account_Year");
				studid = rs.getString("Student_Account_ID");
				
			}
			*/

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
