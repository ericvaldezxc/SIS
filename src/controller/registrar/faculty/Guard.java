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
@WebServlet("/Registrar/Controller/Registrar/Faculty/Guard")
public class Guard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Guard() {
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

		JSONArray degree = new JSONArray();
		JSONArray subject = new JSONArray();
		
		Object object = null;
		Object object2 = null;
		JSONParser jsonParser=new JSONParser();
		String fname = request.getParameter("fname");
		String mname = request.getParameter("mname");
		String lname = request.getParameter("lname");
		String access = request.getParameter("access");
		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");
		

		
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
		
		PrintWriter out = response.getWriter();			
		try {
			if(type.equals("Insert")){
				sql = "INSERT INTO `r_school_guard` (School_Guard_Number,School_Guard_First_Name,School_Guard_Middl_Name,School_Guard_Last_Name,School_Guard_Access) VALUES ((SELECT concat(YEAR(NOW()),'-',right(count(*)+100001,5),'-GU') FROM (SELECT * FROM `r_school_guard`) AS T1 WHERE LEFT(T1.School_Guard_Number,4) = YEAR(NOW())),'"+ec.encrypt(ec.key, ec.initVector, fname)+"','"+ec.encrypt(ec.key, ec.initVector, mname)+"','"+ec.encrypt(ec.key, ec.initVector, lname)+"','"+access+"')";
				out.print(sql);
				stmnt.execute(sql);
				
				String guard = "";
				sql = "select School_Guard_Number from r_school_guard where School_Guard_ID =  (select max(School_Guard_ID) from r_school_guard )";
				ResultSet rs = stmnt.executeQuery(sql);
				while(rs.next()){
					guard = ec.encrypt(ec.key, ec.initVector,  rs.getString("School_Guard_Number")) ;
				      
				}
				
				

				sql = "INSERT INTO `r_user_account` (User_Account_Reference,User_Account_Type,User_Account_Username,User_Account_Password) VALUES ((select max(School_Guard_ID) from r_school_guard),'Guard','"+guard+"','"+guard+"')";
				out.print(sql);
				stmnt.execute(sql);
				
			}
			else if(type.equals("Update")) {
				sql = "update `r_professor` set Professor_FirstName = '"+ec.encrypt(ec.key, ec.initVector, fname)+"' ,Professor_MiddleName = '"+ec.encrypt(ec.key, ec.initVector, mname)+"' ,Professor_LastName = '"+ec.encrypt(ec.key, ec.initVector, lname)+"' where Professor_Code = '"+latcode+"'";
				stmnt.execute(sql);
				
			}
			
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
