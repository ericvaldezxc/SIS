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
 * Servlet implementation class AdmissionSectionViewController
 */
@WebServlet("/Admin/Controller/Admin/Student/AdmissionSectionViewController")
public class AdmissionSectionViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmissionSectionViewController() {
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

		String course = request.getParameter("course");
		String year = request.getParameter("year");

		

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
		
		sql = "SELECT Curriculum_Code,Section_Section,(SELECT FORMAT(sum(Fee_Amount),2) FROM `t_assign_section_fee_item` inner join r_fee on Assign_Section_Fee_Item_Fee_ID = Fee_ID WHERE Assign_Section_Fee_Item_Section_ID = Section_ID) AS FEE FROM `r_section` INNER JOIN r_curriculum ON Section_CurriculumID = Curriculum_ID  WHERE Section_CourseID = (SELECT Course_ID FROM r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"') and Section_Year = "+year;
		
		JSONArray arr = new JSONArray();
		List<String> list = new ArrayList<String>();
		PrintWriter out = response.getWriter();	

		
		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("curcode", ec.decrypt(ec.key, ec.initVector, rs.getString("Curriculum_Code")));
				 obj.put("fee",  rs.getString("FEE"));
				 obj.put("section", ec.decrypt(ec.key, ec.initVector, rs.getString("Section_Section")));
				 arr.add(obj);
			      
			}
			out.print(arr);	

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
