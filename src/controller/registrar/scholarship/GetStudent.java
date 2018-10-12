package controller.registrar.scholarship;

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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Scholarship/GetStudent")
public class GetStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetStudent() {
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
		String scholar = request.getParameter("scholar");
		Fullname fn = new Fullname();
		
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
		
		try {
			sql = "SELECT CurriculumYear_Description,CurriculumYear_Code,Student_Account_CurriculumYearID,Course_Code,Student_Account_CourseID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba,ifnull((select Returnee_ID from t_returnee where Returnee_Display_Status = 'Active' and Returnee_StudentAccountID =  Student_Account_ID ),'Not Returnee') as retid FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID inner join r_course on Student_Account_CourseID = Course_ID inner join r_curriculumyear on CurriculumYear_ID = Student_Account_CurriculumYearID  and IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') = 'Enrolled' and Student_Account_ID in (SELECT distinct Scholarship_Payment_History_StudentAccountID FROM `t_scholarship_payment_history` WHERE Scholarship_Payment_History_ScholarshipID = (SELECT Scholarship_ID FROM `r_scholarship` where Scholarship_Code = '"+scholar+"' )) group by Student_Taken_Curriculum_Subject_StudentAccountID ";
			
			PrintWriter out = response.getWriter();	
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			JSONArray arr = new JSONArray();
			JSONArray obj = new JSONArray();
			obj.add("Student Number");
			obj.add("Student Name");
			obj.add("Course and Section");
			obj.add("GWA");
			arr.add(obj);
			while(rs.next()){
				String uname = rs.getString("Student_Account_Student_Number");
				String sql2 = "SELECT Subject_Type,Schedule_ProfessorID ,Students_Grade_FacultyID,  ifnull(Students_Grade_Grade,'0') grade,IFNULL(Professor_FirstName,0) AS FNAME ,IFNULL(Professor_MiddleName,0) AS MNAME,IFNULL(Professor_LastName,0) AS LNAME,Professor_Code,Subject_Code,Subject_Description,Subject_Credited_Units,Section_Code FROM `t_student_taken_curriculum_subject` inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID inner join t_student_account on Student_Account_ID = Student_Taken_Curriculum_Subject_StudentAccountID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID INNER JOIN r_section on Student_Taken_Curriculum_Subject_SectionID = Section_ID inner join r_curriculum on Curriculum_CourseID = Student_Taken_Curriculum_Subject_CourseID inner join r_curriculumitem on CurriculumItem_SubjectID = if(ifnull(Subject_Group,0)=0,Subject_ID,Subject_Group) left join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID left join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID INNER join r_professor on ifnull(Students_Grade_FacultyID,Schedule_ProfessorID ) = Professor_ID  where Student_Account_CurriculumYearID = Curriculum_CurriculumYearID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Curriculum_YearLevel = Student_Taken_Curriculum_Subject_YearLevel and if(Schedule_ChildrenID is null,'0',Schedule_ChildrenID) = if(Schedule_ChildrenID is null,'0',Subject_ID)  and Student_Account_Student_Number = '"+uname+"' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Student_Taken_Curriculum_Subject_SectionID = Section_ID and if(Schedule_SectionID is null,0,Schedule_SectionID) = if(Schedule_SectionID is null,0,Section_ID)  and Schedule_ProfessorID is not null and Course_ID = Curriculum_CourseID  and Curriculum_SemesterID = Student_Taken_Curriculum_Subject_SemesterID  and Schedule_AcademicYearID = (SELECT myt1.Academic_Year_ID FROM `r_academic_year` as myt1 where myt1.Academic_Year_Active_Flag = 'Present')  ";				
				ResultSet rs2 = stmnt2.executeQuery(sql2);
				double gpa = 0;
				int countgpa = 0;
				double fgpa = 0;
				String finalgpa = "0";
				while(rs2.next()){
					String grade = rs2.getString("grade");
					if(rs2.getString("grade").equals("0")){
						grade = "";
					}
					else if(!rs2.getString("grade").equals("I") && !rs2.getString("grade").equals("Not S") && !rs2.getString("grade").equals("D") && !rs2.getString("Subject_Type").equals("Non-Academic")){
						countgpa++;
						gpa = gpa + Double.parseDouble(rs2.getString("grade"));
					}
					
				}
				if(countgpa!=0){
					fgpa = gpa / countgpa;
				}
				else{
					fgpa = 0;
				}
				
				
				obj = new JSONArray();
				
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				couid = ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"));
				String curcode = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Code"));
				String curdesc = ec.decrypt(ec.key, ec.initVector, rs.getString("CurriculumYear_Description"));
				String button = "";
				fullname = fn.fullname(fname, mname, lname);

				obj.add(rs.getString("Student_Account_Student_Number"));
				obj.add(fullname);
				obj.add(rs.getString("Section_Code"));
				obj.add(Double.toString(fgpa));
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
