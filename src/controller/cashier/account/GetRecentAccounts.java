package controller.cashier.account;

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

import configuration.EncryptandDecrypt;
import configuration.Fullname;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetDocument
 */
@WebServlet("/Cashier/Controller/Cashier/Print/GetRecentAccounts")
public class GetRecentAccounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRecentAccounts() {
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
		Fullname fn = new Fullname();
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();

		String studentNumber = request.getParameter("studentNumber");

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
		
		sql = "SELECT *,ifnull(Scholarship_Description,'') as scho,format(Payable_History_Amount,2) as amo,format(Payable_History_Balance,2) as bal,TIME_FORMAT(Payable_History_Date_Added, '%Y-%m-%d ') as gdate FROM `t_payable_history` inner join t_student_account on Student_Account_ID = Payable_History_Student_Account_ID inner join r_semester on Payable_History_Semester_ID = Semester_ID inner join r_academic_year on Payable_History_AcademicYearID = Academic_Year_ID  left join r_scholarship on Payable_History_ScholarshipID = Scholarship_ID where Student_Account_Student_Number = '"+studentNumber+"' order by Payable_History_ID desc limit 5 ";
//		sql = "select *,ifnull(Scholarship_Description,'') as scho,format(Payable_History_Amount,2) as amo,format(Payable_History_Balance,2) as bal,TIME_FORMAT(Payable_History_Date_Added, '%Y-%m-%d ') as gdate FROM `t_payable_history` inner join t_student_account on Student_Account_ID = Payable_History_Student_Account_ID inner join r_semester on Payable_History_Semester_ID = Semester_ID inner join r_academic_year on Payable_History_AcademicYearID = Academic_Year_ID  left join r_scholarship on Payable_History_ScholarshipID = Scholarship_ID where Payable_History_ID in (SELECT t1.Payable_History_ID FROM `t_payable_history` as t1 inner join t_student_account on Student_Account_ID = Payable_History_Student_Account_ID inner join r_semester on Payable_History_Semester_ID = Semester_ID inner join r_academic_year on Payable_History_AcademicYearID = Academic_Year_ID  left join r_scholarship on Payable_History_ScholarshipID = Scholarship_ID where Student_Account_Student_Number = '"+studentNumber+"' order by Payable_History_ID desc limit 5) ";
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		
		try {
			//out.print(sql);
			ResultSet rs = stmnt.executeQuery(sql);
			
			while(rs.next()){
				JSONObject obj = new JSONObject();
				String assessment = "0.00";
				String payment = "0.00";
				if(rs.getString("Payable_History_Type").equals("Assessment"))
					assessment = rs.getString("amo");
				else
					payment = rs.getString("amo");
				
				String sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
				String acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));

				obj.put("yearlvl",  rs.getString("Payable_History_Year_Level"));
				obj.put("sem", sem );
				obj.put("desc", rs.getString("Payable_History_Description"));		 
				obj.put("scho", rs.getString("scho"));		 
				obj.put("date", rs.getString("gdate"));		 
				obj.put("assessment", assessment);		 
				obj.put("payment", payment);		 
				obj.put("bal", rs.getString("bal"));		 	
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
