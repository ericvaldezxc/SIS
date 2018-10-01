package controller.registrar.scholarship;

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
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Registrar/Controller/Scholarship/Scholarship/GetPaymentHistory")
public class GetPaymentHistory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetPaymentHistory() {
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

		JSONArray studentlist = new JSONArray();
		Object object=null;
		JSONParser jsonParser=new JSONParser();
		String scholarship = request.getParameter("scholar");
		String semester = request.getParameter("semester");
		String acadyear = request.getParameter("acadyear");
		semester = ec.encrypt(ec.key, ec.initVector, semester);
		acadyear = ec.encrypt(ec.key, ec.initVector, acadyear);

	
		
		
		studentlist=(JSONArray) object;
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
			
			JSONArray arr = new JSONArray();
			double totalamounttopay = 0;
				
	        sql = "SELECT *,format(Scholarship_Payment_History_Amount,2) as amo,date_format(Scholarship_Payment_History_Date_Added,'%M-%d-%Y %l:%i %p') as datef FROM `t_scholarship_payment_history` inner join t_student_account on Scholarship_Payment_History_StudentAccountID = Student_Account_ID inner join r_section on Student_Account_SectionID = Section_ID inner join r_student_profile on Student_Account_Student_Profile_ID = Student_Profile_ID inner join r_scholarship on Scholarship_ID = Scholarship_Payment_History_ScholarshipID where Scholarship_Payment_History_ScholarshipID = (SELECT Scholarship_ID FROM `r_scholarship` where Scholarship_Code = '"+scholarship+"') and Scholarship_Payment_History_SemesterID = (SELECT Semester_ID FROM `r_semester` where Semester_Code = '"+semester+"') and Scholarship_Payment_History_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Code = '"+acadyear+"')";
	        //out.print(sql+"\n");
	        ResultSet rs = stmnt.executeQuery(sql);
			String studid = "";
			String yearlvl = "";
			String balance = "";
			String fname = "";	
			String mname = "";	
			String lname = "";	
			String fullname = "";
			String section = "";
			String studnum = "";
			while(rs.next()){
				studid = rs.getString("Student_Account_ID");
				studnum = rs.getString("Student_Account_Student_Number");
				section = rs.getString("Section_Code");
				yearlvl = rs.getString("Student_Account_Year");
				fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
				mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
				lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
				Fullname fn = new Fullname();
				fullname = fn.fullname(fname, mname, lname);
				JSONObject obj = new JSONObject();
				obj.put("name", fullname);
				obj.put("section", section);
				obj.put("amount", rs.getString("amo"));
				obj.put("date", rs.getString("datef"));
				obj.put("studnum", studnum);
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
