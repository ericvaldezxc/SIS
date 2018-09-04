package controller.registrar.preenrollment;

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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Registrar/Controller/Registrar/Preenrollment/GetFacultyPerSubject")
public class GetFacultyPerSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetFacultyPerSubject() {
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

		String subject = request.getParameter("subject");

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
		
		sql = "SELECT * FROM r_faculty_subject inner join r_professor on Faculty_Subject_ProfessorID = Professor_ID WHERE Faculty_Subject_SubjectID  = (SELECT Subject_ID FROM `r_subject` where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subject)+"')";
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		//out.print(sql);
		
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";	

		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_FirstName"));
				 mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_MiddleName"));
				 lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
				 Fullname fn = new Fullname();
				 fullname = fn.fullname(fname, mname, lname);
				 obj.put("code",  rs.getString("Professor_Code"));				 
				 obj.put("name",  fullname);				 
				 arr.add(obj);
			      
			}
			out.print(arr);	

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
