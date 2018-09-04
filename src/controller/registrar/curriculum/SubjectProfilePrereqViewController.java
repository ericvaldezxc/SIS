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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/SubjectProfilePrereqViewController")
public class SubjectProfilePrereqViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectProfilePrereqViewController() {
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
		
		sql = "SELECT Subject_Code,Subject_Description from r_prerequisite inner join r_subject ON Subject_ID =  Prerequisite_Prequisite_SubjectID where Prerequisite_Main_SubjectID = (SELECT T1.Subject_ID FROM r_subject AS T1 WHERE T1.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"') ";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
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
