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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class Payment
 */
@WebServlet("/Cashier/Controller/Cashier/Account/Offset")
public class Offset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Offset() {
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

		String amount = request.getParameter("amount");
		String studentNumber = request.getParameter("studentNumber");

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
		String sql = "";
		
		try {

			sql = "update `t_payment` set Payment_Balance = (Payment_Balance + "+ Math.abs(Double.parseDouble(amount)) +")  WHERE Payment_Student_Account_ID = (SELECT Student_Account_ID FROM t_student_account WHERE Student_Account_Student_Number = '"+studentNumber+"')   ";			
			out.print(sql);
			stmnt.execute(sql);
			
			sql = "SELECT * FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+studentNumber+"'";
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

			
			
			sql = "insert into t_payable_history (Payable_History_Student_Account_ID,Payable_History_Semester_ID,Payable_History_AcademicYearID,Payable_History_Year_Level,Payable_History_Description,Payable_History_Type,Payable_History_Amount,Payable_History_Balance) values ('"+studid+"',(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),'"+yearlvl+"','OFFSET','Assessment','"+amount+"','"+balance+"')   ";
			out.print(sql);
			stmnt.execute(sql);
			
			
			sql = "insert into t_payment_log (Payment_Log_StudentAccountID,Payment_Log_OR_Number,Payment_Log_SemesterID,Payment_Log_AcademicyYearID,Payment_Log_Paymount_Amount,Payment_Log_Remaining_Balance,Payment_Log_Type) values ('"+studid+"',(SELECT CONCAT(YEAR(CURRENT_DATE),'-',RIGHT(COUNT(*)+100001,5),'-OF') FROM (select * from t_payment_log where left(Payment_Log_OR_Number,4) = YEAR(CURRENT_DATE) and RIGHT(Payment_Log_OR_Number,2) = 'OF') as t1),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),'"+amount+"','"+balance+"','Offset')   ";
			out.print(sql);
			stmnt.execute(sql);
			
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
