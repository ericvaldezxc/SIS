package controller.registrar.preenrollment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class MandatoryFee
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/MandatoryFee")
public class MandatoryFee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MandatoryFee() {
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

		String acadyear = request.getParameter("acadyear");
		String fee = request.getParameter("fee");
		String amount = request.getParameter("amount");

		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");
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
		if(type.equals("Insert"))
			sql = "Insert into r_mandatory_fee (Mandatory_Fee_AcademicYearID,Mandatory_Fee_FeeID,Mandatory_Fee_Amount) values ((SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Code = '"+ec.encrypt(ec.key, ec.initVector, acadyear)+"'),(SELECT Fee_ID FROM r_fee  WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, fee)+"'),'"+amount+"')";
//		else if(type.equals("Update"))
//			sql = "Update r_subject set Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Subject_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"',Subject_Units = '"+amount+"' where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Delete"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Retrieve"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		out.print(sql);
		
		try {
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
