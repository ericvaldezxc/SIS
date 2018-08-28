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
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import configuration.YearLevelUp;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Student/Controller/Student/Registration/EnrollSubject")
public class EnrollSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollSubject() {
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
		YearLevelUp ylu = new YearLevelUp();
		JSONArray studentlist = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		
		try {
			object=jsonParser.parse(request.getParameter("subjects"));
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
			ResultSet rs = null;
	        String studaccid = "";
	        String course = "";

	        String yearlvl = "";
	        String semester = "";
	        String acadyear = "";
	        String semesterdesc = "";

			sql = "SELECT * FROM `t_student_account` where Student_Account_Student_Number = '"+username+"'";
			rs = stmnt.executeQuery(sql);
	        while(rs.next()){
	        	studaccid = rs.getString("Student_Account_ID");
	        	course = rs.getString("Student_Account_CourseID");
	        	yearlvl =  rs.getString("Student_Account_Year");
	        }

	        sql = "SELECT * FROM `r_semester` where Semester_Active_Flag = 'Active' and Semester_Active_Flag = 'Active'";
			rs = stmnt.executeQuery(sql);
	        while(rs.next()){
	        	semester = rs.getString("Semester_ID");
	        	semesterdesc = ec.decrypt(ec.key, ec.initVector,  rs.getString("Semester_Description")) ;
	        	
	        }
	        
	        sql = "SELECT * FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' and Academic_Year_Display_Status = 'Active'";
			rs = stmnt.executeQuery(sql);
	        while(rs.next()){
	        	acadyear = rs.getString("Academic_Year_ID");
	        }
	        
	        
	        if(semesterdesc.equals("First Semester")) {
	        	yearlvl = ylu.yearLevel(yearlvl);
	        	sql = "update t_student_account set Student_Account_Year = '"+yearlvl+"'  where  Student_Account_Student_Number = '"+username+"' ";
				
	        }
	        
	        
	        
	        
			
			for (Object o : studentlist) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String code = (String) jsonLineItem.get("code");
		        String section = (String) jsonLineItem.get("section");
		        String stat = (String) jsonLineItem.get("stat");
		        String subid = "";
		        sql = "SELECT * FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"' ";
				rs = stmnt.executeQuery(sql);
		        while(rs.next()){
		        	subid = rs.getString("Subject_ID");
		        }
		        
		        sql = "Insert into t_student_taken_curriculum_subject (Student_Taken_Curriculum_Subject_SubjectID,Student_Taken_Curriculum_Subject_StudentAccountID,Student_Taken_Curriculum_Subject_Taken_Status,Student_Taken_Curriculum_Subject_YearLevel,Student_Taken_Curriculum_Subject_SemesterID,Student_Taken_Curriculum_Subject_AcademicIYearID,Student_Taken_Curriculum_Subject_SectionID,Student_Taken_Curriculum_Subject_CourseID) values ('"+subid+"','"+studaccid+"','"+stat+"','"+yearlvl+"','"+semester+"','"+acadyear+"',(SELECT Section_ID FROM `r_section` where Section_Code = '"+section+"' ),'"+course+"')";
					
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
