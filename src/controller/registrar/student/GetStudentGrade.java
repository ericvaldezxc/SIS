package controller.registrar.student;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/GetStudentGrade")
public class GetStudentGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudentGrade() {
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
		response.setContentType("plain/text");
		EncryptandDecrypt ec = new EncryptandDecrypt();
		String course = request.getParameter("course");
		String yearlvl = request.getParameter("yearlvl");
		String acadyear = request.getParameter("acadyear");
		String sem = request.getParameter("sem");
		Fullname fn = new Fullname();
		
		sem = ec.encrypt(ec.key, ec.initVector, sem);
		acadyear = ec.encrypt(ec.key, ec.initVector, acadyear);
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		Statement stmnt2 = null;

		
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		String stat = "";	
		String couid = "";
		String yearlvlres = "";
		if(yearlvl.equals("All")) {
			yearlvlres = "'First Year','Second Year','Third Year','Fourth Year'";
		}
		else {
			
			yearlvlres = "'"+yearlvl+"'";
			
		}
		
		try {
			if(course.equals("All")) {
				sql = "select distinct Student_Taken_Curriculum_Subject_StudentAccountID ,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number from t_student_taken_curriculum_subject inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_section on Section_ID = Student_Account_SectionID where Student_Taken_Curriculum_Subject_SemesterID =  (SELECT Semester_ID FROM `r_semester` WHERE Semester_Code = '"+sem+"') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` WHERE Academic_Year_Code = '"+acadyear+"' ) and Student_Taken_Curriculum_Subject_YearLevel in ("+yearlvlres+")";
				
			}else {
				course = ec.encrypt(ec.key, ec.initVector, course); 
				sql = "select distinct Student_Taken_Curriculum_Subject_StudentAccountID ,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number from t_student_taken_curriculum_subject inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_section on Section_ID = Student_Account_SectionID where Student_Taken_Curriculum_Subject_SemesterID =  (SELECT Semester_ID FROM `r_semester` WHERE Semester_Code = '"+sem+"') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` WHERE Academic_Year_Code = '"+acadyear+"' ) and Student_Taken_Curriculum_Subject_YearLevel in ("+yearlvlres+") and Student_Account_CourseID = (SELECT Course_ID FROM `r_course` WHERE Course_Code = '"+course+"' ) ";
				
			}
			
			PrintWriter out = response.getWriter();	
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			JSONArray arr = new JSONArray();
			while(rs.next()){
				JSONObject obj = new JSONObject();
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				String accid = rs.getString("Student_Taken_Curriculum_Subject_StudentAccountID");
				String sql2 = "select Subject_Type,Student_Taken_Curriculum_Subject_ID,Students_Grade_Grade from t_student_taken_curriculum_subject inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_section on Section_ID = Student_Account_SectionID inner join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID inner join r_subject on Subject_ID = Student_Taken_Curriculum_Subject_SubjectID where Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` WHERE Semester_Code = '"+sem+"') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` WHERE Academic_Year_Code = '"+acadyear+"' ) and Student_Taken_Curriculum_Subject_StudentAccountID = '"+accid+"'";
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				double wholegrade = 0;
				int counter = 0;
				while(rs2.next()){
					String type = rs2.getString("Subject_Type");
					String grade = rs2.getString("Students_Grade_Grade");
					if(type.equals("Academic")) {
						
						if(!grade.equals("D") && !grade.equals("I") && !grade.equals("NOT S")) {
							counter++;
							wholegrade = wholegrade + Double.parseDouble(grade);
						}
					}
					
				}
			
				
				
				
				
				
				String button = "";
				fullname = fn.fullname(fname, mname, lname);
				String printregi = "";
				button = "<center><a class='btn btn-cancel tar profile' style='color:white' data-toggle='modal' href='#Profile'><i class='fa fa-eye'></i></a> <a class='btn pedit' style='background-color:#33cc33;color:white' style='color:white' data-toggle='modal' href='#EditProfile'><i class='fa fa-edit'></i></a>  </center>"; 
				
				obj.put("Number", rs.getString("Student_Account_Student_Number"));
				obj.put("Name", fullname);
				if(counter == 0)
					obj.put("GWA", "");
				else {
					DecimalFormat formatter = new DecimalFormat("#0.00");
					obj.put("GWA", formatter.format(wholegrade/counter));
										
				}
				obj.put("CAS", rs.getString("Section_Code"));
				obj.put("button", button);
				arr.add(obj);
				
			}
			
			
			out.print(arr);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
