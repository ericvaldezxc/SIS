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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/SubjectProfileViewController")
public class SubjectProfileViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectProfileViewController() {
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
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT t1.*,if(t1.Subject_Group != 0,(Select t2.Subject_Code from r_subject as t2 where t2.Subject_ID = t1.Subject_Group),'No Group') as code,if(t1.Subject_Group != 0,(Select t3.Subject_Description from r_subject as t3 where t3.Subject_ID = t1.Subject_Group),'No Group') as des FROM `r_subject` as t1 where t1.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"' ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		
		try {
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
				 if(!rs.getString("code").equals("No Group"))
					 obj.put("group", ec.decrypt(ec.key, ec.initVector, rs.getString("code")) + " - " + ec.decrypt(ec.key, ec.initVector, rs.getString("des")));
				 else
					 obj.put("group","No Group");
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
