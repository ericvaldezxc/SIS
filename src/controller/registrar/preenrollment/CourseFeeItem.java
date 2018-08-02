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

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class FeeController
 */
@WebServlet("/Registrar/Controller/Registrar/PreEnrollment/CourseFeeItem")
public class CourseFeeItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseFeeItem() {
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

		String fee = request.getParameter("fee");
		String amount = request.getParameter("amount");

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
		
		try {
			if(type.equals("Insert")) {
				sql = "Insert into r_course_fee_items (Course_Fee_Item_CourseFeeID,Course_Fee_Item_FeeID,Course_Fee_Item_Amount) values ((SELECT MAX(Course_Fee_ID) FROM r_course_fee ),(SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, fee)+"'),"+amount+")";
				stmnt.execute(sql);
				PrintWriter out = response.getWriter();	
				out.print(sql);
				
			}
			else if(type.equals("Update")) {
				sql = "SELECT COUNT(*) as cou FROM r_subject_fee_items where Subject_Fee_Items_FeeID = (SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, fee)+"' )";

				ResultSet rs = stmnt.executeQuery(sql);
				while(rs.next()){
					if(rs.getString("cou").equals("0")) {
						
						sql = "Insert into r_subject_fee_items (Subject_Fee_Items_SubjectFeeID,Subject_Fee_Items_FeeID,Subject_Fee_Items_Amount) values ((SELECT MAX(Subject_Fee_ID) FROM r_subject_fee ),(SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, fee)+"'),"+amount+")";
						stmnt.execute(sql);
						PrintWriter out = response.getWriter();	
						out.print(sql);
					}
					else {
						sql = "Update r_subject_fee_items set Subject_Fee_Items_Display_Status = 'Active',Subject_Fee_Items_Amount = "+amount+" where Subject_Fee_Items_SubjectFeeID = '"+latcode+"' and Subject_Fee_Items_FeeID = (SELECT Fee_ID FROM r_fee where Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, fee)+"')";
						stmnt.execute(sql);
						PrintWriter out = response.getWriter();	
						out.print(sql);
						
						
					}
				}
				
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
