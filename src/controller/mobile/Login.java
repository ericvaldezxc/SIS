package controller.mobile;

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
import connection.DBConfiguration;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Mobile/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String password = request.getParameter("password");
		String username = request.getParameter("username");
		DBConfiguration db = new DBConfiguration(); 
		Connection conn = db.getConnection();
		String unexist = "";
		String pswrong = "";
		String type="";
		String Fullname = "";
		String fname = "";
		String mname = "";
		String lname = "";
		String refid = "";

		Statement stmnt = null;
		try {
			stmnt = conn.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sql = "";
		
		sql = "SELECT count(*) as cou from r_user_account where User_Account_Username = '"+ec.encrypt(ec.key, ec.initVector, username)+"'  ";
		
		JSONArray arr = new JSONArray();
		
		PrintWriter out = response.getWriter();	

		
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				unexist = rs.getString("cou");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		sql = "SELECT count(*) as cou from r_user_account where User_Account_Username = '"+ec.encrypt(ec.key, ec.initVector, username)+"' and User_Account_Password = '"+ec.encrypt(ec.key, ec.initVector, password)+"'  ";
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				pswrong = rs.getString("cou");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sql = "SELECT User_Account_Type,User_Account_Reference from r_user_account where User_Account_Username = '"+ec.encrypt(ec.key, ec.initVector, username)+"' and User_Account_Password = '"+ec.encrypt(ec.key, ec.initVector, password)+"'  ";
		try {
			ResultSet rs = stmnt.executeQuery(sql);
			while(rs.next()){
				type = rs.getString("User_Account_Type");
				refid = rs.getString("User_Account_Reference");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(!type.equals("")) {
			if(type.equals("Guard")) {
//				sql = "SELECT * FROM `r_student_profile` inner join t_student_account on Student_Profile_ID = Student_Account_Student_Profile_ID where Student_Account_ID = '"+refid+"' ";
//				try {
//					ResultSet rs = stmnt.executeQuery(sql);
//					while(rs.next()){
//						fname = rs.getString("Student_Profile_First_Name");
//						mname = rs.getString("Student_Profile_Middle_Name");
//						lname = rs.getString("Student_Profile_Last_Name");
//						if(mname.equals("")){
//							Fullname = ec.decrypt(ec.key, ec.initVector, lname)  + ", " + ec.decrypt(ec.key, ec.initVector, fname);
//							
//						}
//						else {
//							Fullname = ec.decrypt(ec.key, ec.initVector, lname) + ", " + ec.decrypt(ec.key, ec.initVector, fname) + " " + ec.decrypt(ec.key, ec.initVector, mname);
//							
//						}
//					}
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				
				
			}
			
			
		}

		
		 JSONObject obj = new JSONObject();
		 
		 
		 obj.put("type", type);
		 obj.put("unexist", unexist);
		 obj.put("pswrong", pswrong);	
		 arr.add(obj);
		 
		 String res = "";
		 if(unexist.equals("0"))
			 res = "Account doesn't exist";
		 else if(pswrong.equals("0"))
			 res = "Incorrect Password";
		 else 
			 res = "Successful";
		 out.print(type);	
	}

}
