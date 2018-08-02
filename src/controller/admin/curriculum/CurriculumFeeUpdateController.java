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
 * Servlet implementation class CurriculumFeeUpdateController
 */
@WebServlet("/Admin/Controller/Admin/Curriculum/CurriculumFeeUpdateController")
public class CurriculumFeeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumFeeUpdateController() {
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
		String code = request.getParameter("curcode");
		EncryptandDecrypt ec = new EncryptandDecrypt();
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
			sql = "UPDATE t_assign_section_fee_item SET Assign_Section_Fee_Item_Display_Status = 'Inactive' WHERE Assign_Section_Fee_Item_Section_ID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+ec.encrypt(ec.key, ec.initVector, code)+"' ) ";
			stmnt.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
