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
@WebServlet("/Faculty/Controller/Faculty/Grading/GetStudents2")
public class GetStudents2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudents2() {
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
		subjectDrp = ec.encrypt(ec.key, ec.initVector, subjectDrp);
	
		

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

			if(section.equals("default")) {
				sql = "SELECT DISTINCT IFNULL(Students_Grade_Grade,'Not S') GRADE,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name, Schedule_AcademicYearID,Professor_ID,t1.Subject_Code,t1.Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID  left join r_professor on Schedule_ProfessorID = Professor_ID  left join r_subject as t2 on t1.Subject_Group = t2.Subject_ID inner join r_section on Student_Account_SectionID = Section_ID left join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID   where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and  Schedule_AcademicYearID = Academic_Year_ID  and Student_Taken_Curriculum_Subject_Taken_Status = 'true'  and Professor_Code = '"+username+"'  and t1.Subject_Code = '"+subjectDrp+"'";
				ResultSet rs = stmnt.executeQuery(sql);
				//out.print(sql);
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
				//ifnull dating 0 pero ginawa kong not set agihkkk
				sql = "SELECT distinct IFNULL(Students_Grade_Grade,'Not S') GRADE,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Professor_Code,Subject_Code,Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_schedule on Student_Taken_Curriculum_Subject_SubjectID = Schedule_ChildrenID  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID left join r_professor on Schedule_ProfessorID = Professor_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID =  Subject_ID inner join r_section on Student_Account_SectionID = Section_ID left join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID  where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Professor_Code = '"+username+"' and Subject_Code = '"+subjectDrp+"'";
				//out.print("\n"+sql);
				rs = stmnt.executeQuery(sql);
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
			}
			else {
				sql = "SELECT DISTINCT IFNULL(Students_Grade_Grade,'Not S') GRADE,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name, Schedule_AcademicYearID,Professor_ID,t1.Subject_Code,t1.Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID  left join r_professor on Schedule_ProfessorID = Professor_ID  left join r_subject as t2 on t1.Subject_Group = t2.Subject_ID inner join r_section on Student_Account_SectionID = Section_ID left join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID   where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and  Schedule_AcademicYearID = Academic_Year_ID  and Student_Taken_Curriculum_Subject_Taken_Status = 'true'  and Professor_Code = '"+username+"'  and t1.Subject_Code = '"+subjectDrp+"' and Section_Code = '"+section+"' and Student_Taken_Curriculum_Subject_SemesterID is not null ";
				ResultSet rs = stmnt.executeQuery(sql);
				out.print(sql);
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
				//ifnull dating 0 pero ginawa kong not set agihkkk
				sql = "SELECT distinct IFNULL(Students_Grade_Grade,'Not S') GRADE,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Professor_Code,Subject_Code,Subject_Description,Student_Account_Student_Number FROM `t_student_taken_curriculum_subject` inner join t_schedule on Student_Taken_Curriculum_Subject_SubjectID = Schedule_ChildrenID  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID left join r_professor on Schedule_ProfessorID = Professor_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID =  Subject_ID inner join r_section on Student_Account_SectionID = Section_ID left join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_StudentTakenCurriculumSubjectID  where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Professor_Code = '"+username+"' and Subject_Code = '"+subjectDrp+"' and Section_Code = '"+section+"' and Student_Taken_Curriculum_Subject_SemesterID is not null";
				//out.print("\n"+sql);
				rs = stmnt.executeQuery(sql);
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
				
			}
			
			
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
