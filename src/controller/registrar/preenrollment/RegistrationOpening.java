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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/RegistrationOpening")
public class RegistrationOpening extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationOpening() {
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

		JSONArray opening = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		String course = request.getParameter("latcode");
		
		try {
			object=jsonParser.parse(request.getParameter("opening"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String subject = request.getParameter("student");
		opening=(JSONArray) object;
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		PrintWriter out = response.getWriter();	
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) { 	
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		out.print(studentlist);
		String sql = "";
		
		
		try {

			
			for (Object o : opening) {
				JSONObject jsonLineItem = (JSONObject) o;
		        String yearlvl = (String) jsonLineItem.get("yearlvl");
		        Boolean fstatus = (Boolean) jsonLineItem.get("status");
		        String status = "";
		        if(fstatus == true)
		        	status = "Yes";
		        else
		        	status = "No";
		        	
		        
		        
				sql = "Select count(*) as cou from r_registation_opening where Registation_Opening_CourseID = (select Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"') and Registation_Opening_YearLevel = '"+yearlvl+"' ";
				ResultSet rs = stmnt.executeQuery(sql);
				String cou = "";
				while(rs.next()){
					cou = rs.getString("cou") ;
				}

		        if(cou.equals("0")) 
		        	sql = "Insert into r_registation_opening (Registation_Opening_CourseID,Registation_Opening_YearLevel,Registation_Opening_Status) values ((select Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"'),'"+yearlvl+"','"+status+"')";
		        else 
		        	sql = "update r_registation_opening set Registation_Opening_Status = '"+status+"' where Registation_Opening_CourseID = (select Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, course)+"') and Registation_Opening_YearLevel = '"+yearlvl+"' ";
					
				out.print(sql+"\n");
				stmnt.execute(sql);
					
			}

			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
