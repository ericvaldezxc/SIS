<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Report" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	DBConfiguration db = new DBConfiguration();
	Connection conn = db.getConnection();
	if(conn == null)
		out.print("failasded");
	
	EncryptandDecrypt ec = new EncryptandDecrypt();
	Dropdowns drp = new Dropdowns();
	
	String tablebody = "";
	String curDrp = "";
	String campusDrp = drp.fillcampusDrp();
	String courseDrp = drp.fillcourseDrp();
	
	String firstCol = "";
	String firstCol2 = "";
	
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String status = "";	
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_student_profile` where Student_Profile_ID not in (SELECT Student_Account_Student_Profile_ID from t_student_account WHERE Student_Account_Display_Status = 'Active') ");
		while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			
			tablebody += "<tr><td>" + fullname +"</td><td>Ready for Admission</td><td>"; 
			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
					tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info admission' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' href='#Admission'><i class='fa fa-briefcase'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}



	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	

%>    

<t:Report title="Voucher" from="" to="">

    
    <jsp:body>
	    	
		<body>
	    <div class="invoice-box">
	        <table cellpadding="0" cellspacing="0">
	            <tr class="top">
	                <td colspan="2">
	                    <table>
	                        <tr>
	                            <td>
	                            	<label style="font-weight:bold;font-size:18px">Eric Kristopher P. Valdez</label>
	                            	<br/>
	                            	<label style="font-style:italic;font-size:16px">19-10293</label>	          
	                            	<label style="font-style:italic;font-size:16px">BACHELOR OF SCIENCE IN INFORMATION TECHNOLOGY (QUEZON CITY CAMPUS)</label>	                    	
	                            </td>
	                        </tr>
	                    </table>
	                </td>
	            </tr>
	            <tr >
	            	<td colspan="2"></td>
	            </tr>
	            <tr class="heading" >
	                <td style="font-weight:bold;font-size:16px" colspan="2">Enrolled Subject:</td>	                
	            </tr>
	            <tr >
	            </tr>
	            <tr>
	            	<td colspan="2">
	                    <table>
	                    	<thead>
	                    		<tr>
		                    		<td class="emphasize" style="text-align:left;width:50%">Subject Code</td>
		                    		<td class="emphasize" style="text-align:left;width:50%">Subject Description</td>
	                    		</tr>
	                    	</thead>
	                        <tbody>
		                        <tr>
		                            <td style="text-align:left;">COMP 3033</td>
		                            <td style="text-align:left;">Software Engineering</td>
		                        </tr>
		                        <tr>
		                            <td style="text-align:left;">COMP 3033</td>
		                            <td style="text-align:left;">Software Engineering</td>
		                        </tr>
		                        <tr>
		                            <td style="text-align:left;">COMP 3033</td>
		                            <td style="text-align:left;">Software Engineering</td>
		                        </tr>
		                        <tr>
		                            <td style="text-align:left;">COMP 3033</td>
		                            <td style="text-align:left;">Software Engineering</td>
		                        </tr>
		                        <tr>
		                            <td style="text-align:left;">COMP 3033</td>
		                            <td style="text-align:left;">Software Engineering</td>
		                        </tr>
	                        </tbody>
	                    </table>
	                </td>
	            </tr>
	            <tr class="heading">
	                <td colspan="2">
	                    Breakdown of Tuition and Miscellaneous Fees
	                </td>
	            </tr>
	            
	            <tr class="details">
	                <td class="emphasize"  style="text-align:left;">
	                    Description
	                </td>
	                <td class="emphasize"  style="text-align:left;">
	                    Amount
	                </td>
	            </tr>
	            
	            <tr class="heading">
	                <td>
	                    Item
	                </td>
	                
	                <td>
	                    Price
	                </td>
	            </tr>
	            
	            <tr class="item">
	                <td>
	                    Website design
	                </td>
	                
	                <td>
	                    $300.00
	                </td>
	            </tr>
	            
	            <tr class="item">
	                <td>
	                    Hosting (3 months)
	                </td>
	                
	                <td>
	                    $75.00
	                </td>
	            </tr>
	            
	            <tr class="item last">
	                <td>
	                    Domain name (1 year)
	                </td>
	                
	                <td>
	                    $10.00
	                </td>
	            </tr>
	            
	            <tr class="total">
	                <td></td>
	                
	                <td>
	                   Total: $385.00
	                </td>
	            </tr>
	        </table>
	    </div>
	</body>
        
	        
	</jsp:body>


</t:Report>
