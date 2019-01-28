package controller.registrar.student;

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

import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class AdmissionCurriculumItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Student/GetRegicard")
public class GetRegicard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRegicard() {
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
		String guardian = "";
		String year = "";
		String actyear = "";
		String actsem = "";
		String fullname = "";	
		String fname = "";	
		String mname = "";	
		String lname = "";
		String scho = "";
		String section = "";
		
		try {
			sql = "SELECT *,IFNULL(Student_Profile_Guardian_Name,'') AS GUARDIAN,(SELECT Academic_Year_Description FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present' ) as actyear,(SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active' ) as actsem,ifnull(Student_Profile_Guardian_Contact_Number,'') as gcn from t_student_account inner join r_student_profile on Student_Account_Student_Profile_ID  =  Student_Profile_ID inner join r_section on Student_Account_SectionID = Section_ID  where Student_Account_Student_Number= '"+studentnumber+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			JSONObject obj = new JSONObject();
				
			while(rs.next()){
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				scho = rs.getString("Student_Account_Scholastic_Status");
				fullname = fn.fullname(fname, mname, lname);
				
				section = rs.getString("Section_Code");
				guardiannum = rs.getString("gcn");
				dob = rs.getString("Student_Profile_Date_Of_Birth");
				gender = rs.getString("Student_Profile_Gender");
				civil = rs.getString("Student_Profile_Civil_Status");
				guardian = rs.getString("GUARDIAN");
				year = rs.getString("Student_Account_Year");
				actyear = ec.decrypt(ec.key, ec.initVector, rs.getString("actyear"));
				actsem = ec.decrypt(ec.key, ec.initVector, rs.getString("actsem"));
				address = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Address"));
				emailaddress = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Email_Address"));
				contactnum = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Contact_Number"));
				pob = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Place_Of_Birth"));
				
				obj.put("studentnumber", studentnumber);
				obj.put("name", fullname);
				obj.put("sem", actsem);
				obj.put("year", actyear);
				obj.put("address", address);
				obj.put("yearlvl", year);
				obj.put("guardian", guardian);
				obj.put("scho", scho);
				obj.put("section", section);
				obj.put("guardiannum", guardiannum);
				
				
				
				
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
