package controller.student.registration;

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
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class GetSection
 */
@WebServlet("/Student/Controller/Student/Registration/BreakdownFee")
public class BreakdownFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BreakdownFee() {
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

		JSONParser jsonParser=new JSONParser();
		Object fee=null;
		try {
			fee=jsonParser.parse(request.getParameter("breakdownfee"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String totalamo = request.getParameter("totalamount");
		HttpSession session = request.getSession();
		String username = session.getAttribute("username").toString();
		
		JSONArray breakdownfee = new JSONArray();
		breakdownfee=(JSONArray) fee;
		
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
		
		JSONArray arr = new JSONArray();
		PrintWriter out = response.getWriter();	
		
		try {
			
			sql = "SELECT * FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE Student_Account_Student_Number = '"+username+"'";
			ResultSet rs = stmnt.executeQuery(sql);
			String studnum = "";
			String studid = "";
			String yearlvl = "";
			String balance = "";
			while(rs.next()){
				studnum = rs.getString("Student_Account_Student_Number");
				studid = rs.getString("Student_Account_ID");
				yearlvl = rs.getString("Student_Account_Year");
				balance = rs.getString("Payment_Balance");
			}
			
			
			
			for (Object o : breakdownfee) {
				JSONObject jsonLineItem = (JSONObject) o;
				String desc = (String) jsonLineItem.get("desc");
		        String feeamou = (String) jsonLineItem.get("amount");
				sql = "insert into `t_breakdown_fee` (Breakdown_Fee_Student_Account_ID,Breakdown_Fee_Semester_ID,Breakdown_Fee_AcademicYearID,Breakdown_Fee_Description,Breakdown_Fee_Amount,Breakdown_Fee_Type) VALUES ((SELECT Student_Account_ID FROM t_student_account where Student_Account_Student_Number = '"+username+"'),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),'"+desc+"','"+feeamou+"','Enrollment') ";			
				out.print(sql);
				stmnt.execute(sql);
			}
			double newbal = Double.parseDouble(balance) + Double.parseDouble(totalamo);
			
			sql = "insert into t_payable_history (Payable_History_Student_Account_ID,Payable_History_Semester_ID,Payable_History_AcademicYearID,Payable_History_Year_Level,Payable_History_Description,Payable_History_Type,Payable_History_Amount,Payable_History_Balance) values ('"+studid+"',(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),'"+yearlvl+"','TOTAL AMOUNT DUE','Assessment','"+balance+"','"+newbal+"')   ";
			out.print(sql);
			stmnt.execute(sql);
			
			sql = "Update t_payment set Payment_Balance = '"+newbal+"' where Payment_Student_Account_ID = '"+studid+"' ";
			out.print(sql);
			stmnt.execute(sql);
			
			
			

			conn.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
