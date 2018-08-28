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
import connection.DBConfiguration;

/**
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/RegistrationOpeningItems")
public class RegistrationOpeningItems extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegistrationOpeningItems() {
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

		String getcode = request.getParameter("getcode");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		
		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "SELECT * FROM `r_registation_opening` WHERE Registation_Opening_CourseID = (select Course_ID from r_course where Course_Code = '"+ec.encrypt(ec.key, ec.initVector, getcode)+"')";
		JSONObject firstyear = new JSONObject();
		JSONObject secondyear = new JSONObject();
		JSONObject thirdyear = new JSONObject();
		JSONObject fourthyear = new JSONObject();
		JSONObject fifthyear = new JSONObject();
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			int i = 0;
			while(rs.next()){
				String yearlvl = rs.getString("Registation_Opening_YearLevel");
				if(yearlvl.equals("First Year")) {
					firstyear.put("yearlvl", rs.getString("Registation_Opening_YearLevel") );
					firstyear.put("status",  rs.getString("Registation_Opening_Status"));
				}
				else if(yearlvl.equals("Second Year")) {
					secondyear.put("yearlvl", rs.getString("Registation_Opening_YearLevel") );
					secondyear.put("status",  rs.getString("Registation_Opening_Status"));
				}
				else if(yearlvl.equals("Third Year")) {
					thirdyear.put("yearlvl", rs.getString("Registation_Opening_YearLevel") );
					thirdyear.put("status",  rs.getString("Registation_Opening_Status"));
				}
				else if(yearlvl.equals("Fourth Year")) {
					fourthyear.put("yearlvl", rs.getString("Registation_Opening_YearLevel") );
					fourthyear.put("status",  rs.getString("Registation_Opening_Status"));
				}
				else if(yearlvl.equals("Fifth Year")) {
					fifthyear.put("yearlvl", rs.getString("Registation_Opening_YearLevel") );
					fifthyear.put("status",  rs.getString("Registation_Opening_Status"));
				}

				
			     i++;
			}
			if(i == 0) {
				
				firstyear.put("yearlvl", "First Year" );
				firstyear.put("status",  "No");
				secondyear.put("yearlvl", "Second Year" );
				secondyear.put("status", "No" );
				thirdyear.put("yearlvl", "Third Year" );
				thirdyear.put("status", "No" );
				fourthyear.put("yearlvl", "Fourth Year" );
				fourthyear.put("status", "No" );
				fifthyear.put("yearlvl", "Fifth Year" );
				fifthyear.put("status", "No");
			}
			arr.add(firstyear);
			arr.add(secondyear);
			arr.add(thirdyear);
			arr.add(fourthyear);
			arr.add(fifthyear);
			out.print(arr);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
