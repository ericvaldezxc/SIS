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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class Application
 */
@WebServlet("/Registrar/Controller/Registrar/Student/Enroll")
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

		String studnum = request.getParameter("studnum");
		String subject = request.getParameter("subject");
		String section = request.getParameter("section");

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
			sql = "SELECT * FROM `t_student_account` where Student_Account_Student_Number = '"+studnum+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			String couid = "";
			String yearlvl = "";
			String studid = "";
			
			while(rs.next()){
				couid = rs.getString("Student_Account_CourseID");
				yearlvl = rs.getString("Student_Account_Year");
				studid = rs.getString("Student_Account_Student_Profile_ID");
				
			}
			sql = "Insert into t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) values ((SELECT Subject_ID FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"'  ),'"+studid+"','true','"+yearlvl+"',(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active' ),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ),(SELECT Section_ID FROM `r_section` where Section_Code = '"+section+"'),'"+couid+"')";
			out.print(sql);
			stmnt.execute(sql);

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
