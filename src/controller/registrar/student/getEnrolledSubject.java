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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/getEnrolledSubject")
public class getEnrolledSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getEnrolledSubject() {
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
		String id = request.getParameter("id");
		Fullname fn = new Fullname();
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;

		
		try {
			stmnt = conn.createStatement();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "SELECT * FROM `t_student_taken_curriculum_subject` inner join r_subject on Student_Taken_Curriculum_Subject_SubjectID = Subject_ID  where Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_Display_Status = 'Active' and Student_Taken_Curriculum_Subject_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active' ) and Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ) and Student_Taken_Curriculum_Subject_StudentAccountID = '"+id+"' ";
		PrintWriter out = response.getWriter();	
		
		
		
		try {
			
			ResultSet rs = stmnt.executeQuery(sql);
			
			JSONArray subjects = new JSONArray();	
			while(rs.next()){
				JSONObject obj = new JSONObject();
				String subjectCode = rs.getString("Subject_Code");
				String subjectDesc = rs.getString("Subject_Description");
				String credUnit = rs.getString("Subject_Credited_Units");
				String takenSubjectId = rs.getString("Student_Taken_Curriculum_Subject_ID");
				
				subjectCode = ec.decrypt(ec.key, ec.initVector, subjectCode);
				subjectDesc =  ec.decrypt(ec.key, ec.initVector, subjectDesc);
				obj.put("subjectCode", subjectCode);
				obj.put("subjectDesc", subjectDesc);
				obj.put("credUnit", credUnit);
				obj.put("takenSubjectId", takenSubjectId);
				subjects.add(obj);
				
			}
			out.print(subjects);
			
				
			
			
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
