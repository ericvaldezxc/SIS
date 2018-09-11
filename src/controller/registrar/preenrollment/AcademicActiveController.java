package controller.registrar.preenrollment;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class RoomController
 */
@WebServlet("/Registrar/Controller/Registrar/Pre-Enrollment/AcademicActiveController")
public class AcademicActiveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcademicActiveController() {
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


		String code = request.getParameter("semcode");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		Statement stmnt2 = null;
		Statement stmnt3 = null;
		try {
			stmnt = conn.createStatement();
			stmnt2 = conn.createStatement();
			stmnt3 = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();	
		String sql = "";
		try {
			ResultSet rs = stmnt.executeQuery("SELECT Student_Account_ID,Section_Code,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Account_Student_Number,case when Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' then 'Enrolled' else 'Not Enrolled' end as status,IF((SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'))=0,'Not Enrolled','Enrolled') as enrolledba FROM `t_student_taken_curriculum_subject`  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join r_section on Student_Account_SectionID = Section_ID where Student_Account_ID not in (SELECT Graduate_StudentAccountID FROM `t_graduate` WHERE Graduate_Display_Status = 'Active') and Student_Account_Display_Status = 'Active'  group by Student_Taken_Curriculum_Subject_StudentAccountID");
			while(rs.next()){
				String studid = rs.getString("Student_Account_ID");
				String student = rs.getString("Student_Account_Student_Number");
				sql = "SELECT CurriculumItem_SubjectID FROM `r_curriculumitem` inner join r_curriculum on Curriculum_ID = CurriculumItem_CurriculumID where Curriculum_CourseID = (select Student_Account_CourseID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"') and Curriculum_CurriculumYearID = (select Student_Account_CurriculumYearID FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"')  and Curriculum_Display_Status = 'Active' and CurriculumItem_Display_Status = 'Active' ";
				ResultSet rs2 = stmnt2.executeQuery(sql);
				int flag = 0;
				while(rs2.next()){
					String sub = rs2.getString("CurriculumItem_SubjectID"); 
					String sql2 = "SELECT if('"+sub+"' in (SELECT if(ifnull(Subject_Group,0) = 0 ,Subject_ID,Subject_Group) as subid FROM `t_student_taken_curriculum_subject` inner join t_students_grade on Students_Grade_StudentTakenCurriculumSubjectID = Student_Taken_Curriculum_Subject_ID inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID  WHERE Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Students_Grade_Display_Status = 'Active' and Students_Grade_Grade not in ('5.00','I','D','Not S')),'Complete','NA') as stat FROM `t_student_account` WHERE Student_Account_Student_Number = '"+student+"'";
					ResultSet rs3 = stmnt3.executeQuery(sql2);
					while(rs3.next()){
						if(rs3.getString("stat").equals("NA")) {
							flag = 1;
						}
						
					}
					
				}
				
				if(flag == 0) {
					
					String sql3 = "INSERT INTO t_graduate (Graduate_StudentAccountID,Graduate_AcademicYearID,Graduate_SemesterID) VALUES ('"+studid+"',(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'))";
					out.print(sql3);
					stmnt.execute(sql3);
				}
				
				
				
				
			}
			
			
			sql = "Update r_academic_year set Academic_Year_Active_Flag = 'Used' where Academic_Year_Active_Flag = 'Present'";
			stmnt.execute(sql);
			sql = "Update r_academic_year set Academic_Year_Active_Flag = 'To be Used' where Academic_Year_Active_Flag = 'Not Used'";
			stmnt.execute(sql);
			sql = "Update r_academic_year set Academic_Year_Active_Flag = 'Present' where Academic_Year_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"'";
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
