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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/GetSubject")
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
		
		sql = "SELECT *,if(ifnull(Subject_Group,0)=0,'No Group',(select t1.Subject_Code from r_subject as t1 where t2.Subject_Group = t1.Subject_ID )) as grp from r_subject as t2 where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"' ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		
		try {
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("lecunit", rs.getString("Subject_Lecture_Units"));
				 obj.put("labunit",rs.getString("Subject_Laboratory_Units"));
				 obj.put("credunit", rs.getString("Subject_Credited_Units"));
				 obj.put("lechrs", rs.getString("Subject_Lecture_Hours"));
				 obj.put("labhrs", rs.getString("Subject_Laboratory_Hours"));
				 obj.put("type", rs.getString("Subject_Type"));
				 obj.put("tuihrs", rs.getString("Subject_Tuition_Hours"));
				 
				 if(!rs.getString("grp").equals("No Group"))
					 obj.put("group", ec.decrypt(ec.key, ec.initVector, rs.getString("grp")));
				 else
					 obj.put("group","No Group");
				 String subid = rs.getString("Subject_ID");
				 JSONArray arr2 = new JSONArray();
				 String sql2 = "SELECT * FROM `r_prerequisite` inner join r_subject on Subject_ID = Prerequisite_Prequisite_SubjectID where Prerequisite_Main_SubjectID = '"+subid+"' and Prerequisite_Display_Status = 'Active'";
				 ResultSet rs2 = stmnt2.executeQuery(sql2);
				 while(rs2.next()){
					 arr2.add(ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code")) );
					 
				 }
				 obj.put("prereq", arr2);
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
