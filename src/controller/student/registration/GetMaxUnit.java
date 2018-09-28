package controller.student.registration;

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

import configuration.EncryptandDecrypt;
import configuration.YearLevelUp;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Student/Controller/Student/Registration/GetMaxUnit")
public class GetMaxUnit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMaxUnit() {
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

		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();

		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		YearLevelUp ylu = new YearLevelUp();
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		try {
			String sql = "";
			
			sql = "SELECT * FROM `t_student_account` WHERE Student_Account_Student_Number = '"+username+"' ";
			ResultSet rs = stmnt.executeQuery(sql);
			String yearlvl = "";
			String course = "";
			String curyear = "";
			String accid = "";
			while(rs.next()){
				yearlvl = rs.getString("Student_Account_Year");
				course = rs.getString("Student_Account_CourseID");
				curyear = rs.getString("Student_Account_CurriculumYearID");
				accid = rs.getString("Student_Account_ID");
			}
			
			
			
			
			String tcount = "";
			rs = stmnt.executeQuery("SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_SectionID is not null and Student_Taken_Curriculum_Subject_StudentAccountID = '"+accid+"' ");
			while(rs.next()){
				tcount =  rs.getString("cou");		
				
			}
			
			String sem = "";
			rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active' ");
			while(rs.next())
				sem = rs.getString("Semester_Description");
			sem = ec.decrypt(ec.key, ec.initVector, sem);
			
			//out.print(sem + " - " + tcount);
			if(sem.equals("First Semester") && !tcount.equals("0")){
				yearlvl = ylu.yearLevel(yearlvl);

			}
			
			
			
			sql = "Select * from r_curriculum where Curriculum_CourseID = '"+course+"' and Curriculum_YearLevel = '"+yearlvl+"' and Curriculum_SemesterID = (SELECT Semester_ID FROM `r_semester` WHERE Semester_Active_Flag = 'Active')  ";
			
			JSONArray arr = new JSONArray();
			PrintWriter out = response.getWriter();	
			
			
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				out.print(rs.getString("Curriculum_Max_Credited_Unit"));	
			      
			}
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
