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
@WebServlet("/Registrar/Controller/Registrar/Curriculum/GroupItems")
public class CurriculumGroupItemsView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumGroupItemsView() {
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
		String groupname = request.getParameter("groupname");
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
		
		sql = "SELECT t1.* FROM `r_subject` as t1 WHERE t1.Subject_Group = (select t2.Subject_ID from r_subject as t2 where t2.Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, groupname)+"')  ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
//		out.print(sql);

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description")));
				 obj.put("grp", groupname);
				 obj.put("unit", rs.getString("Subject_Credited_Units"));
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
