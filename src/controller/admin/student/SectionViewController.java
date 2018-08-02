package controller.admin.student;

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
 * Servlet implementation class SectionViewController
 */
@WebServlet("/Admin/Controller/Admin/Student/SectionViewController")
public class SectionViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SectionViewController() {
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
		String curcode = request.getParameter("curcode");
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
		
		sql = "SELECT * FROM `r_section` INNER JOIN r_curriculum ON Section_CurriculumID = Curriculum_ID INNER JOIN r_course ON Section_CourseID = Course_ID where Section_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"'";
		
		JSONArray arr = new JSONArray();
		List<String> list = new ArrayList<String>();
		PrintWriter out = response.getWriter();	

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("sectioncode", ec.decrypt(ec.key, ec.initVector, rs.getString("Section_Code")));
				 obj.put("curriculumcode", ec.decrypt(ec.key, ec.initVector, rs.getString("Curriculum_Code")));
				 obj.put("coursecode", ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code")));
				 obj.put("year", rs.getString("Section_Year"));
				 obj.put("section", ec.decrypt(ec.key, ec.initVector, rs.getString("Section_Section")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Section_Description")));
				 
				 arr.add(obj);
			      
			}
			out.print(arr);	

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	}

}
