package controller.registrar.curriculum;

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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/CurriculumViewItemController")
public class CurriculumViewItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumViewItemController() {
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
		String latcode = request.getParameter("latcode");
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
		String sql2 = "";
		
		sql = "SELECT Subject_Code,Subject_Description,Subject_Credited_Units FROM `r_curriculumitem` INNER JOIN r_subject ON CurriculumItem_SubjectID = Subject_ID INNER JOIN r_curriculum ON Curriculum_ID = CurriculumItem_CurriculumID inner join r_curriculumyear on CurriculumYear_ID = Curriculum_CurriculumYearID WHERE Subject_Display_Stat = 'Active' and CurriculumItem_Display_Status = 'Active' and Curriculum_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"' Order by Subject_Group asc";
		JSONArray arr = new JSONArray();
		JSONArray grouplist = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql+"\n");

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			ResultSet rs2;
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 JSONObject group = new JSONObject();
				 grouplist = new JSONArray();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
				 obj.put("unit", rs.getString("Subject_Credited_Units"));
				 sql2 = "SELECT * FROM `r_subject` AS T1 WHERE T1.Subject_Group = (SELECT T2.Subject_ID FROM r_subject AS T2 where T2.Subject_Code = '"+rs.getString("Subject_Code")+"' )";
//				 out.print(sql2+" \n");
				 rs2 = stmnt2.executeQuery(sql2);
				 	
					while(rs2.next()){
						 group = new JSONObject();
						 group.put("code", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")));
						 group.put("desc", ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Description")));
						 group.put("unit", rs2.getString("Subject_Credited_Units"));
						 grouplist.add(group);
						 
						 
					 }
					obj.put("group", grouplist);
				 
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
