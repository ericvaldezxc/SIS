package controller.registrar.faculty;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Registrar/Controller/Registrar/Faculty/GetFaculty")
public class GetFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFaculty() {
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
		
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONArray degree = new JSONArray();
		JSONArray subject = new JSONArray();
		JSONArray name = new JSONArray();
		
		String facnum = request.getParameter("facnum");
		
		String sql = "";

		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();			
		try {
			sql = "SELECT * from r_faculty_subject inner join r_subject on  Faculty_Subject_SubjectID = Subject_ID  where Faculty_Subject_ProfessorID = (SELECT Professor_ID FROM `r_professor` where Professor_Code = '"+facnum+"' ) and Faculty_Subject_Display_Status = 'Active'";
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 subject.add(ec.decrypt(ec.key, ec.initVector,  rs.getString("Subject_Code")));
			      
			}
			
			sql = "SELECT * from r_faculty_degree inner join r_degree on  Faculty_Degree_DegreeID = Degree_ID  where Faculty_Degree_ProfessorID = (SELECT Professor_ID FROM `r_professor` where Professor_Code = '"+facnum+"' ) and Faculty_Degree_Display_Status = 'Active'";
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 degree.add(rs.getString("Degree_Code"));
			      
			}

			sql = "SELECT * from r_professor  where Professor_Code = '"+facnum+"' ";
			rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("fname", ec.decrypt(ec.key, ec.initVector,  rs.getString("Professor_FirstName")));
				 obj.put("mname", ec.decrypt(ec.key, ec.initVector,  rs.getString("Professor_MiddleName")));
				 obj.put("lname", ec.decrypt(ec.key, ec.initVector,  rs.getString("Professor_LastName")));
				 name.add(obj);
			      
			}

			
			JSONObject fobj = new JSONObject();
			fobj.put("subject", subject);
			fobj.put("degree", degree);
			fobj.put("name", name);
			arr.add(fobj);
			
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
