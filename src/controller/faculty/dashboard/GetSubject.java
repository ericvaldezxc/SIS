package controller.faculty.dashboard;

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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class CurriculumViewItemController
 */
@WebServlet("/Faculty/Controller/Registrar/Dashboard/Student")
public class GetSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSubject() {
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
		String sql = "";
		
		sql = "SELECT * FROM `r_academic_year` order by Academic_Year_Date_Added asc";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		
		try {
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 String yeardesc = rs.getString("Academic_Year_Description");
				
				 JSONArray arr2 = new JSONArray();
				 
				 JSONArray yearitem = new JSONArray();
				 String sql2 = "SELECT DISTINCT Course_Code,Course_ID FROM `t_student_taken_curriculum_subject` inner join r_course on Course_ID = Student_Taken_Curriculum_Subject_CourseID where Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Description = '"+yeardesc+"')";
				 //out.print(sql2);
				 ResultSet rs2 = stmnt2.executeQuery(sql2);
				 String course = "";
				 String cou = "";
				 String totalcount = "";
				 int i = 0;
				 while(rs2.next()){
					 i++;
					 JSONObject yearitemobj = new JSONObject();
					 String coursecode = rs2.getString("Course_Code");
					 String courseid = rs2.getString("Course_ID");
					 course = ec.decrypt(ec.key, ec.initVector, rs2.getString("Course_Code"));
					 String sql3 = "SELECT  count( DISTINCT Student_Taken_Curriculum_Subject_StudentAccountID) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Description = '"+yeardesc+"') and Student_Taken_Curriculum_Subject_CourseID  =  '"+courseid+"'";
					 ResultSet rs3 = stmnt3.executeQuery(sql3);
					 while(rs3.next()){
						cou = rs3.getString("cou");
						 
					 }
					 yearitemobj.put("course",course);
					 yearitemobj.put("cou",cou);
					 arr2.add(yearitemobj);
					 
				 }
				 sql2 = "SELECT  count( DISTINCT Student_Taken_Curriculum_Subject_StudentAccountID) as cou FROM `t_student_taken_curriculum_subject` where Student_Taken_Curriculum_Subject_AcademicIYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Description = '"+yeardesc+"') ";
				 rs2 = stmnt2.executeQuery(sql2);
				 while(rs2.next()){
					 totalcount = rs2.getString("cou");
					 
				 }
				 
				 if(i != 0 ) {
					 obj.put("body", arr2);
					 obj.put("total", totalcount);
					 obj.put("year", ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description")));
					 arr.add(obj);
				 }
			      
			}
			out.print(arr);	

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
//		
//		 List<String> list = new ArrayList<String>();
//		    list.add("item1");
//		    list.add("item2");
//		    list.add("item3");	
//		    
//		    
	
	}

}
