package controller.registrar.academicawards;

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
@WebServlet("/Registrar/Controller/Registrar/AcademicAwards/AddStudentAwards")
public class AddStudentAwards extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddStudentAwards() {
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
		
		try {
			object=jsonParser.parse(request.getParameter("student"));
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String scholarship =  request.getParameter("code");

	
		
		
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
			
			
			for (Object o : studentlist) {
				
				
		        sql = "SELECT * FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+o+"'";
		        out.print(sql+"\n");
		        ResultSet rs = stmnt.executeQuery(sql);
				String studid = "";
				String yearlvl = "";
				String balance = "";
				while(rs.next()){
					studid = rs.getString("Student_Account_ID");
					yearlvl = rs.getString("Student_Account_Year");
					balance = rs.getString("Payment_Balance"); 
					
				}
				
				String efee = "0.00";
				sql = "SELECT ifnull(sum(Breakdown_Fee_Amount),0) as efee FROM t_breakdown_fee WHERE  Breakdown_Fee_Student_Account_ID = '"+studid+"' and Breakdown_Fee_Semester_ID = (SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active') and Breakdown_Fee_AcademicYearID = (SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present') and Breakdown_Fee_Type = 'Enrollment' ";
				out.print(sql+"\n");				
				rs = stmnt.executeQuery(sql);
				while(rs.next()){
					efee = rs.getString("efee");
					
					
				}
				String discount = "0.00";
				sql = "select * from r_awards where Awards_Code = '"+scholarship+"' ";
				rs = stmnt.executeQuery(sql);
				String adesc = "";
				while(rs.next()){
					discount = rs.getString("Awards_Discount_Perecentage");
					adesc = rs.getString("Awards_Description");
					
				}
				double scholarpayment = 0;
				scholarpayment = (Double.parseDouble(discount) / Double.parseDouble("100.00")) ;//* Double.parseDouble(efee) ;
				scholarpayment = scholarpayment * Double.parseDouble(efee);
				out.print(scholarpayment+"-"+efee);
				double rembal = 0 ;
				rembal = Double.parseDouble(efee)  - scholarpayment;

				double rembal2 = 0 ;
				rembal2 = Double.parseDouble(balance)  - scholarpayment;

				sql = "select * from t_payment where Payment_Student_Account_ID = '"+studid+"' ";
				rs = stmnt.executeQuery(sql);
				String curbal = "";
				while(rs.next()){
					curbal = rs.getString("Payment_Balance");
					
				}
				
				double finalbal = 0;
				finalbal = Double.parseDouble(curbal) - scholarpayment;
				
				sql = "insert into t_payable_history (Payable_History_Student_Account_ID,Payable_History_Semester_ID,Payable_History_AcademicYearID,Payable_History_Year_Level,Payable_History_Description,Payable_History_Type,Payable_History_Amount,Payable_History_Balance,Payable_History_ScholarshipID) values ((SELECT Student_Account_ID FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+o+"'),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),(SELECT Student_Account_Year FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+o+"'),'"+adesc.toUpperCase()+" PAYMENT','Payment','"+scholarpayment+"','"+rembal2+"',NULL)   ";
				out.print(sql+"\n");
				stmnt.execute(sql);
				
				sql = "insert into t_student_awards (Student_Awards_StudentAccountID,Student_Awards_SemesterID,Student_Awards_AcademicYearID,Student_Awards_AwardsID) values ((SELECT Student_Account_ID FROM t_student_account inner join t_payment on Payment_Student_Account_ID = Student_Account_ID WHERE  Student_Account_Student_Number = '"+o+"'),(SELECT Semester_ID FROM `r_semester` where Semester_Active_Flag = 'Active'),(SELECT Academic_Year_ID FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'),(SELECT Awards_ID FROM r_awards  WHERE  Awards_Code = '"+scholarship+"'))   ";
				out.print(sql+"\n");
				stmnt.execute(sql);

				sql = "update t_payment set Payment_Balance = '"+finalbal+"' where Payment_Student_Account_ID =  (SELECT Student_Account_ID FROM t_student_account WHERE  Student_Account_Student_Number = '"+o+"')  ";
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
