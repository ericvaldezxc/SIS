package controller.registrar.preenrollment;

import java.io.IOException;
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
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/SubjectFeeItemUpdate")
public class SubjectFeeItemUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubjectFeeItemUpdate() {
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

		String acad = request.getParameter("acad");
		String subj = request.getParameter("subj");

		String latcode = request.getParameter("latcode");
		String type = request.getParameter("type");
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
		
//		else if(type.equals("Update"))
//			sql = "Update r_subject set Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"',Subject_Description = '"+ec.encrypt(ec.key, ec.initVector, desc)+"',Subject_Units = '"+amount+"' where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Delete"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Inactive'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
//		else if(type.equals("Retrieve"))
//			sql = "Update r_subject set Subject_Display_Stat = 'Active'  where Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, latcode)+"'";
		
		try {
			sql = "UPDATE r_subject_fee  SET Subject_Fee_SubjectID = (SELECT Subject_ID FROM r_subject WHERE Subject_Code = '"+ec.encrypt(ec.key, ec.initVector, subj)+"'), Subject_Fee_AcademicYearID = (SELECT Academic_Year_ID FROM r_academic_year WHERE Academic_Year_Code = '"+ec.encrypt(ec.key, ec.initVector, acad)+"') where Subject_Fee_ID = '"+latcode+"'";
			stmnt.execute(sql);

			sql = "UPDATE r_subject_fee_items  SET Subject_Fee_Items_Display_Status = 'Inactive' where Subject_Fee_Items_SubjectFeeID = '"+latcode+"'";
			stmnt.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
