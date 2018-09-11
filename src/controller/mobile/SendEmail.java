package controller.mobile;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SendEmail
 */
@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        String to = "ericvaldezxc@gmail.com";
	        String subject = "Confirmation";
	        String message =  "<html><body><h4>asdsdd</h4></body></html>";
	        String user = "sisbsit41@gmail.com";
	        String pass = "passwordsis";
	        SendMail.send(to,subject, message, user, pass);
	        out.println("Mail send successfully");
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out = response.getWriter();
	        
	        String to = "ericvaldezxc@gmail.com";
	        String subject = "Confirmation";
	        String message =  "<html><body><h4>asdsdd</h4></body></html>";
	        String user = "sisbsit41@gmail.com";
	        String pass = "passwordsis";
	        SendMail.send(to,subject, message, user, pass);
	        out.println("Mail send successfully");
	}

}
