package controller.registrar.student;

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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.*;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/GetWholeProfile")
public class GetWholeProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetWholeProfile() {
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
		String studentnumber = request.getParameter("studentnumber");
		Fullname fn = new Fullname();
		
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
		String contactnum = "";
		String guardiannum = "";
		String dob = "";
		String pob = "";
		String gender = "";
		String emailaddress = "";
		String civil = "";
		String address = "";
		
		try {
			sql = "SELECT *,ifnull(Student_Profile_Guardian_Contact_Number,'') as gcn from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID  where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject obj = new JSONObject();
				
			while(rs.next()){
				guardiannum = rs.getString("gcn");
				dob = rs.getString("Student_Profile_Date_Of_Birth");
				gender = rs.getString("Student_Profile_Gender");
				civil = rs.getString("Student_Profile_Civil_Status");
				address = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Address"));
				emailaddress = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Email_Address"));
				contactnum = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Contact_Number"));
				pob = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Place_Of_Birth"));
				obj.put("fname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name") ));
				obj.put("mname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name") ));
				obj.put("lname", ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name")) );
				obj.put("guardiannum", guardiannum);
				obj.put("dob", dob);
				obj.put("pob", pob);
				obj.put("gender", gender);
				obj.put("civil", civil);
				obj.put("address", address);
				obj.put("contactnum", contactnum);
				obj.put("emailaddress", emailaddress);
				obj.put("guardianname", rs.getString("Student_Profile_Guardian_Name"));
				
			}
			PrintWriter out = response.getWriter();	
			
			out.print(obj);
				
			
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
