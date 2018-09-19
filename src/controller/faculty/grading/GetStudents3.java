package controller.faculty.grading;

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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import configuration.FinalGrade;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Faculty/Controller/Faculty/Grading/GetStudents3")
public class GetStudents3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudents3() {
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

		String subjectDrp = request.getParameter("subjectDrp");
		String section = request.getParameter("section");
		String acadyearDrp = request.getParameter("acadyear");
		String semesterDrp = request.getParameter("sem");
		
		subjectDrp = ec.encrypt(ec.key, ec.initVector, subjectDrp);
		semesterDrp = ec.encrypt(ec.key, ec.initVector, semesterDrp);
		acadyearDrp = ec.encrypt(ec.key, ec.initVector, acadyearDrp);
		
		

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		FinalGrade fg = new FinalGrade();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	
		
		try {
			HttpSession session = request.getSession();
			String username = session.getAttribute("username").toString();
			
			
			sql = "SELECT  *,IFNULL(Students_Grade_Grade,'Not S') GRADE from t_student_taken_curriculum_subject inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID =  Subject_ID inner join r_curriculumitem on CurriculumItem_SubjectID = if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) left join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID left join r_professor on Schedule_ProfessorID = Professor_ID  where Student_Taken_Curriculum_Subject_SemesterID is not null  and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Section_Code = '"+section+"' and Subject_Code = '"+subjectDrp+"' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM r_semester WHERE Semester_Code = '"+semesterDrp+"') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` WHERE Academic_Year_Code = '"+acadyearDrp+"'  )  and if (Schedule_ChildrenID is null ,0,Schedule_ChildrenID) = if(Schedule_ChildrenID is null ,0,Subject_ID) and Schedule_SectionID = Section_ID ";
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				if(mname.equals(""))
					fullname = lname + ", " + fname;
				else	
					fullname = lname + ", " + fname + " " +  mname;
				 JSONObject obj = new JSONObject();
				 obj.put("name", fullname);
				 obj.put("number",  rs.getString("Student_Account_Student_Number"));
				 obj.put("section",  rs.getString("Section_Code"));	
				 obj.put("grade",  rs.getString("GRADE"));					 
				 obj.put("finalgrade",  fg.finalGrade(rs.getString("GRADE")));	
				 
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
