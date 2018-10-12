package controller.registrar.crossenrollee;

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
@WebServlet("/Registrar/Controller/Registrar/CrossEnrollee/CreditSubject")
public class CreditSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditSubject() {
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

		JSONArray subject = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		String student = request.getParameter("student");
		
		try {
			object=jsonParser.parse(request.getParameter("subjectDrp"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		
		subject=(JSONArray) object;
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
			

			
			for (Object o : subject) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String code = (String) jsonLineItem.get("subjcode");
		        String grade = (String) jsonLineItem.get("grade");

		        sql = "INSERT INTO `t_student_taken_curriculum_subject` (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) VALUES ((SELECT Subject_ID FROM `r_subject` WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code.toString())+"'),(SELECT Student_Account_ID FROM t_student_account WHERE Student_Account_Student_Number = '"+student+"'),'true',null,null,null,null,null)";
				out.print(sql+"\n");
				stmnt.execute(sql);
				

				sql = "INSERT INTO `t_students_grade` (Students_Grade_StudentTakenCurriculumSubjectID,Students_Grade_FacultyID,Students_Grade_Grade) VALUES ((SELECT Student_Taken_Curriculum_Subject_ID FROM t_student_taken_curriculum_subject WHERE Student_Taken_Curriculum_Subject_ID = (SELECT MAX(Student_Taken_Curriculum_Subject_ID) FROM t_student_taken_curriculum_subject)),null,'"+grade+"')";
				out.print(sql+"\n");
				stmnt.execute(sql);
				

					
			}

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
