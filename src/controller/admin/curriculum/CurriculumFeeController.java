package controller.admin.curriculum;

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
 * Servlet implementation class CurriculumFeeController
 */
@WebServlet("/Admin/Controller/Admin/Curriculum/CurriculumFeeController")
public class CurriculumFeeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumFeeController() {
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

		String FeeCode = request.getParameter("FeeCode");
		String CurCode = request.getParameter("CurCode");
		String Quantity = request.getParameter("Quantity");

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
			sql = "SELECT COUNT(*) as cou FROM t_assign_section_fee_item where Assign_Section_Fee_Item_Section_ID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+ec.encrypt(ec.key, ec.initVector, CurCode)+"' ) and Assign_Section_Fee_Item_Fee_ID = (SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, FeeCode)+"' )";
			stmnt.execute(sql);

			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				if(rs.getString("cou").equals("0")) {
					
					sql = "Insert into t_assign_section_fee_item (Assign_Section_Fee_Item_Section_ID,Assign_Section_Fee_Item_Fee_ID) values ((SELECT Section_ID FROM r_section WHERE Section_Code = '"+ec.encrypt(ec.key, ec.initVector, CurCode)+"' ),(SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, FeeCode)+"'))";
					stmnt.execute(sql);
					PrintWriter out = response.getWriter();	
					out.print(sql);
				}
				else {
					sql = "UPDATE `t_assign_section_fee_item` SET Assign_Section_Fee_Item_Display_Status = 'Active' where Assign_Section_Fee_Item_Section_ID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+ec.encrypt(ec.key, ec.initVector, CurCode)+"' ) and Assign_Section_Fee_Item_Fee_ID = (SELECT Fee_ID FROM r_fee WHERE Fee_Code = '"+ec.encrypt(ec.key, ec.initVector, FeeCode)+"' )";
					stmnt.execute(sql);
					PrintWriter out = response.getWriter();	
					out.print(sql);
					
					
				}
			}
			
			
			stmnt.execute(sql);
			PrintWriter out = response.getWriter();	
			out.print(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
