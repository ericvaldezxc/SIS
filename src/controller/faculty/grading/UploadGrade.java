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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Faculty/Controller/Faculty/Grading/UploadGrades")
public class UploadGrade extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadGrade() {
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

		JSONArray studentlist = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		String subjectDrp = ec.encrypt(ec.key, ec.initVector, request.getParameter("subjectDrp"));
		
		try {
			object=jsonParser.parse(request.getParameter("student"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String subject = request.getParameter("student");
		studentlist=(JSONArray) object;
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		PrintWriter out = response.getWriter();	
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) { 	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		out.print(studentlist);
		String sql = "";
		
		
		try {
			HttpSession session = request.getSession();
			String username = session.getAttribute("username").toString();
			sql = "Select IF(IFNULL(Subject_Group,0)=0,'true','false') as stat from r_subject where Subject_Code = '"+subjectDrp+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			String stat = "";
			while(rs.next()){
				 stat = rs.getString("stat") ;
			}

			
			for (Object o : studentlist) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String studnum = (String) jsonLineItem.get("number");
		        String grade = (String) jsonLineItem.get("grade");
		        if(grade.equals("1"))
		        	grade = "1.00";
		        else if(grade.equals("2"))
		        	grade = "2.00";
		        else if(grade.equals("3"))
		        	grade = "3.00";
		        else if(grade.equals("5"))
		        	grade = "5.00";
		        else if(grade.equals("1.5"))
		        	grade = "1.50";
		        else if(grade.equals("2.5"))
		        	grade = "2.50";
	        	String cou = "";
	        	String cou2 = "";
		        String studtakenid = "";
		        /*
				if(stat.equals("true"))
					sql = "SELECT DISTINCT count(*)  as cou,Student_Taken_Curriculum_Subject_ID  FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID inner join r_curriculumitem on CurriculumItem_SubjectID = Student_Taken_Curriculum_Subject_SubjectID inner join t_schedule on Schedule_CurriculumItemID = CurriculumItem_ID  left join r_professor on Schedule_ProfessorID = Professor_ID  left join r_subject as t2 on t1.Subject_Group = t2.Subject_ID inner join r_section on Student_Account_SectionID = Section_ID left join t_students_grade on Student_Taken_Curriculum_Subject_ID = Students_Grade_ID   where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Professor_Code = '"+username+"'  and t1.Subject_Code = '"+subjectDrp+"' and Student_Account_Student_Number = '"+studnum+"'";
				else
					sql = "SELECT DISTINCT count(*)  as cou,Student_Taken_Curriculum_Subject_ID FROM `t_student_taken_curriculum_subject` inner join t_schedule on Student_Taken_Curriculum_Subject_SubjectID = Schedule_ChildrenID  inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_academic_year on Academic_Year_ID = Student_Taken_Curriculum_Subject_AcademicIYearID inner join r_semester on Student_Taken_Curriculum_Subject_SemesterID = Semester_ID left join r_professor on Schedule_ProfessorID = Professor_ID inner join  r_subject on Student_Taken_Curriculum_Subject_SubjectID =  Subject_ID inner join r_section on Student_Account_SectionID = Section_ID  where Semester_Active_Flag = 'Active' and Academic_Year_Active_Flag = 'Present' and Schedule_ProfessorID = Professor_ID and Schedule_AcademicYearID = Academic_Year_ID and Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Professor_Code = '"+username+"' and Subject_Code = '"+subjectDrp+"' and Student_Account_Student_Number = '"+studnum+"'";
				*/
				if(stat.equals("true"))
					sql = "SELECT Student_Taken_Curriculum_Subject_ID  FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID where t1.Subject_Code = '"+subjectDrp+"' and Student_Account_Student_Number = '"+studnum+"'";
				else
					sql = "SELECT Student_Taken_Curriculum_Subject_ID  FROM `t_student_taken_curriculum_subject` inner join t_student_account on Student_Taken_Curriculum_Subject_StudentAccountID = Student_Account_ID inner join r_subject as t1  on Student_Taken_Curriculum_Subject_SubjectID =  t1.Subject_ID where t1.Subject_Code = '"+subjectDrp+"' and Student_Account_Student_Number = '"+studnum+"'";

				rs = stmnt.executeQuery(sql);
				while(rs.next()){
					//cou = rs.getString("cou");
					studtakenid = rs.getString("Student_Taken_Curriculum_Subject_ID");
					
				}
				
				sql = "SELECT  count(*)  as cou from t_students_grade where Students_Grade_StudentTakenCurriculumSubjectID = '"+studtakenid+"' and Students_Grade_FacultyID = (SELECT Professor_ID FROM `r_professor` where Professor_Code = '"+username+"')";
				rs = stmnt.executeQuery(sql);
				while(rs.next()){
					cou2 = rs.getString("cou");
					
				}
				
				
				String insertquery = "";
				if(cou2.equals("0"))
					 insertquery = "Insert into t_students_grade (Students_Grade_StudentTakenCurriculumSubjectID,Students_Grade_Grade,Students_Grade_FacultyID) values ('"+studtakenid+"','"+grade+"',(SELECT Professor_ID FROM `r_professor` where Professor_Code = '"+username+"' ))";
				else
					 insertquery = "update t_students_grade set Students_Grade_Grade = '"+grade+"' where Students_Grade_StudentTakenCurriculumSubjectID = '"+studtakenid+"'";
					
				out.print(insertquery);
				stmnt.execute(insertquery);

					
			}

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
