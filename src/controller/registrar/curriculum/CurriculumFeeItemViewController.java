package controller.registrar.curriculum;

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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import configuration.EncryptandDecrypt;
import connection.DBConfiguration;

/**
 * Servlet implementation class CurriculumFeeItemViewController
 */
@WebServlet("/Registrar/Controller/Registrar/Curriculum/CurriculumFeeItemViewController")
public class CurriculumFeeItemViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CurriculumFeeItemViewController() {
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
		EncryptandDecrypt ec = new EncryptandDecrypt();
		String curcode = request.getParameter("curcode");
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
		
		sql = "SELECT Fee_Code,Fee_Description, FORMAT(Fee_Amount, 2) as AMOUNT FROM `t_assign_section_fee_item` INNER JOIN r_fee ON Fee_ID = Assign_Section_Fee_Item_Fee_ID  WHERE Assign_Section_Fee_Item_Section_ID = (SELECT Section_ID FROM r_section WHERE Section_Code = '"+ec.encrypt(ec.key, ec.initVector, curcode)+"') AND Fee_Display_Status = 'Active' and Assign_Section_Fee_Item_Display_Status = 'Active'";
		
		JSONArray arr = new JSONArray();
		List<String> list = new ArrayList<String>();
		PrintWriter out = response.getWriter();	

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				 JSONObject obj = new JSONObject();
				 obj.put("code", ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Code")));
				 obj.put("desc", ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description")));
				 obj.put("amount", rs.getString("AMOUNT"));
//				 obj.put("quantity", rs.getString("Assign_Curriculum_Fee_Item_Quantity"));
				 arr.add(obj);
			      
			}
			out.print(arr);	

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	
	
	}

}
