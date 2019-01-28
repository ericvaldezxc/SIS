package controller.registrar.graduate;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.*;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/GraduatedStudents/TranscriptofRecord")
public class TranscriptofRecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TranscriptofRecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("plain/text");
		PrintWriter out = response.getWriter();	
		EncryptandDecrypt ec = new EncryptandDecrypt();
		FinalGrade fg = new FinalGrade();
		String uname = request.getParameter("stnum");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		//String studentnumber = "2018-00001-CM-0";
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
		
		
		JSONArray arr = new JSONArray();
		Fullname fn = new Fullname();
		try {
			sql = "SELECT distinct Semester_ID,Academic_Year_ID,Semester_Description,Academic_Year_Description,Course_Code,Course_ID,Course_Description FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Account_Student_Number = '"+uname+"' and Student_Taken_Curriculum_Subject_Display_Status = 'Active' order by Student_Taken_Curriculum_Subject_Date_Added asc";
			ResultSet rs = stmnt.executeQuery(sql);
			//out.print(sql);
			while(rs.next()){
				String acadyear = rs.getString("Academic_Year_ID");
				String semester = rs.getString("Semester_ID");
				String course = rs.getString("Course_ID");
				String acadyeardesc = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
				String semesterdesc = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
				String coursedesc = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"));
				String coursecode = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));

				String sql2 = "SELECT Schedule_ProfessorID ,Students_Grade_FacultyID,  ifnull(Students_Grade_Grade,'0') grade,IFNULL(Professor_FirstName,0) AS FNAME ,IFNULL(Professor_MiddleName,0) AS MNAME,IFNULL(Professor_LastName,0) AS LNAME,Professor_Code,Subject_Code,Subject_Description,Subject_Credited_Units,Section_Code FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID INNER JOIN r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_curriculum on Curriculum_CourseID = Student_Taken_Curriculum_Subject_CourseID inner join r_curriculumitem on CurriculumItem_SubjectID = if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) left join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID INNER join r_professor on ifnull(Students_Grade_FacultyID,Schedule_ProfessorID ) = Professor_ID  where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Curriculum_YearLevel = Student_Taken_Curriculum_Subject_YearLevel and if(Schedule_ChildrenID is null,'0',Schedule_ChildrenID) = if(Schedule_ChildrenID is null,'0',Subject_ID)  and Student_Account_Student_Number = '"+uname+"' and Course_ID = '"+course+"' and Student_Taken_Curriculum_Subject_SemesterID = '"+semester+"' and Student_Taken_Curriculum_Subject_AcademicIYearID = '"+acadyear+"' and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Student_Taken_Curriculum_Subject_SectionID = Section_ID and if(Schedule_SectionID is null,0,Schedule_SectionID) = if(Schedule_SectionID is null,0,Section_ID)  and Schedule_ProfessorID is not null and Course_ID = Curriculum_CourseID  and Curriculum_SemesterID = Student_Taken_Curriculum_Subject_SemesterID and Curriculum_CurriculumYearID = Student_Account_CurriculumYearID and Schedule_AcademicYearID = '"+acadyear+"'  ";
				//out.print(sql2);
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				String wholesched = "";
				
				JSONArray gradeslist = new JSONArray();
				while(rs2.next()){
					JSONObject gradesholder = new JSONObject();
					String grade = rs2.getString("grade");
					String fname,mname,lname,fullname = "";
					if(rs2.getString("FNAME").equals("0")){
						fullname = "TBA";
								
					}
					else{
						fname = ec.decrypt(ec.key, ec.initVector, rs2.getString("FNAME"));
						mname = ec.decrypt(ec.key, ec.initVector, rs2.getString("MNAME"));
						lname = ec.decrypt(ec.key, ec.initVector, rs2.getString("LNAME"));
						fullname = fn.fullname(fname, mname, lname);
					}
					if(rs2.getString("grade").equals("0")){
						grade = "";
					}
					String subjcode = ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code"));
					String subjdesc = ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description"));
					String subcredunit = rs2.getString("Subject_Credited_Units");
					String section = rs2.getString("Section_Code");
//					out.print(rs2.getString("grade"));
					String finalgrade = fg.finalGrade(rs2.getString("grade"));
						 
					
					gradesholder.put("subjcode", subjcode);
					gradesholder.put("subjdesc", subjdesc);
					gradesholder.put("subcredunit", subcredunit);
					gradesholder.put("section", section);
					gradesholder.put("finalgrade", finalgrade);
					gradesholder.put("grade", grade);
					gradesholder.put("fullname", fullname);
					gradeslist.add(gradesholder);
					 
				}
				JSONObject obj = new JSONObject();
				obj.put("acadyear", acadyeardesc);
				obj.put("sem",  semesterdesc);	
				obj.put("course",  coursedesc );	
				obj.put("coursecode",  coursecode );	
				obj.put("grades",  gradeslist);
				arr.add(obj);

			}
		
			out.print(arr);	

			conn.close();
			
		
	


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		*/
	}

}
