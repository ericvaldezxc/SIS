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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class CurriculumViewItemController
 */
@WebServlet("/Faculty/Controller/Faculty/Dashboard/GetEnrolledSubjects")
public class GetEnrolledSubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEnrolledSubjects() {
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
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		
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
		
		sql = "SELECT distinct Academic_Year_Description,Schedule_AcademicYearID FROM `t_schedule` inner join r_academic_year on Academic_Year_ID = Schedule_AcademicYearID left join r_professor on Schedule_ProfessorID = Professor_ID where Professor_Code = '"+username+"'";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		
		try {
//			 out.print(sql+"\n");	
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 String yeardesc = rs.getString("Academic_Year_Description");
				 String yearid = rs.getString("Schedule_AcademicYearID");
				 yeardesc = ec.decrypt(ec.key, ec.initVector, yeardesc);
				 JSONArray arr2 = new JSONArray();
				 
				 JSONArray yearitem = new JSONArray();
				 String sql2 = "SELECT distinct Subject_Code,CurriculumItem_SubjectID,Schedule_SectionID FROM `t_schedule` inner join r_academic_year on Academic_Year_ID = Schedule_AcademicYearID left join r_professor on Schedule_ProfessorID = Professor_ID inner join r_curriculumitem on CurriculumItem_ID = Schedule_CurriculumItemID inner join r_subject on Subject_ID = CurriculumItem_SubjectID where Professor_Code = '"+username+"' and Schedule_AcademicYearID = '"+yearid+"' ";
//				 out.print(sql2+"\n");	

				 ResultSet rs2 = stmnt2.executeQuery(sql2);
				 int i = 0;
				 while(rs2.next()){
					 JSONObject yearitemobj = new JSONObject();
					 String subId = rs2.getString("CurriculumItem_SubjectID");
					 String subCode = rs2.getString("Subject_Code");
					 subCode = ec.decrypt(ec.key, ec.initVector, subCode);
					 String sectionId = rs2.getString("Schedule_SectionID");
					 
					 String sql3 = "SELECT count(*) as cou FROM `t_student_taken_curriculum_subject` WHERE Student_Taken_Curriculum_Subject_Taken_Status = 'true' and Student_Taken_Curriculum_Subject_SubjectID = '"+subId+"' and Student_Taken_Curriculum_Subject_SectionID = '"+sectionId+"' and Student_Taken_Curriculum_Subject_AcademicIYearID = '"+yearid+"'";
//					 out.print(sql3+"\n");	
					 ResultSet rs3 = stmnt3.executeQuery(sql3);
					 String cou = "";
					 while(rs3.next()){
						 cou = rs3.getString("cou");
						 i = i + Integer.parseInt(rs3.getString("cou"))  ;
						 
					 }
					 
					 yearitemobj.put("subject",subCode);
					 yearitemobj.put("cou",cou);
					 arr2.add(yearitemobj);
					 
				 }
				 obj.put("body", arr2);
				 obj.put("total", i);
				 obj.put("year", yeardesc);
				 arr.add(obj);
				 
			      
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
