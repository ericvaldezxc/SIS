<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Cashier" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	
	String tablebody = "";
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	

	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT *,format(Payment_Log_Paymount_Amount+Payment_Log_Remaining_Balance,2) as amountdue,format(Payment_Log_Paymount_Amount,2) as payment,format(Payment_Log_Remaining_Balance,2) as rem,TIME_FORMAT(Payment_Log_Date_Added, '%Y-%m-%d %h:%i %p') as mdate from t_payment_log inner join t_student_account on Student_Account_ID = Payment_Log_StudentAccountID inner join r_student_profile on Student_Account_Student_Profile_ID =  Student_Profile_ID where Payment_Log_Display_Status = 'Active'");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			tablebody += "<tr><td>" + rs.getString("Payment_Log_OR_Number")+ "</td><td>" + rs.getString("Student_Account_Student_Number")+ "</td><td>"+fullname+"</td><td>"+rs.getString("amountdue")+"</td><td>"+rs.getString("payment")+"</td><td>"+rs.getString("rem")+"</td><td>"+rs.getString("mdate")+"</td></tr>";			
		}
	pageContext.setAttribute("tablebody", tablebody);


%>    

<t:Cashier title="Payment History" from="Payment History" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Cashier/Accounts/Accounts.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
    	                                        <th style="width: 200px">OR Number</th>
		                                        <th style="width: 200px">Student Number</th>
	                                            <th style="width: 200px">Name</th>
	                                            <th style="width: 150px">Amount Due</th>
	                                            <th style="width: 150px">Payment</th>
	                                            <th style="width: 100px">Remaining Balance</th>  
	                                            <th style="width: 100px">Date</th>  
	                                        </tr>
	                                    </thead>
	                                    <tbody>    
										    	${tablebody}
	                                    </tbody>
                                    </table>
                                </div>
                            </div>
                        </section>

                </div>
         </div>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Payment" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Payment<br/>Note that we only accept php currency*</h4>
	                    
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
                        	<div class="row">
                        		<div class="col-lg-6" style="">
	                                <label style="font-size:20px;font-weight:bold" id="student-name">Valdez, Eric Kristopher P.</label>
	                            	<br/>
	                                <label style="font-size:14px;font-style: italic;" id="student-number">2015-00194-NOVA-0</label>
	                            </div>		                               	
                        		<div class="col-lg-6"  style="font-size:14px;text-align:right;" >
                        			<label  style="text-align:left;">Balance : </label><label style="font-style: italic" id="student-balance">6,999.00</label>
                  					<br/>                  					
                  					Payment
                  					<input type="number" style="text-align:right;" min="0.00" max="10000.00" step="0.01" class="form-control" placeholder="ex. 100.00" id="amountTxt" >
                        			<label  style="text-align:left;">Remaining Balance : </label><label style="font-style: italic" id="remaining-balance">0.00</label>
	                            </div>		                        	
                        	</div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Assess</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Cashier>
