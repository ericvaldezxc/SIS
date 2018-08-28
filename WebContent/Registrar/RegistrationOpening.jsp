<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Registrar" %>
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
	String courseDrp = drp.fillcourseDrp();
	String yearDrp = drp.fillacadyearDrp();

	String acadyear = "";
	String sem = "";

	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_course where Course_Display_Status = 'Active' ");
	while(rs.next()){
		tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code"))+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</td><td>"; 
		tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#Opening'><i class='fa fa-bolt'></i></a><center></td></tr>";
		
	}
	rs = stmnt.executeQuery("SELECT Academic_Year_Description FROM `r_academic_year` where Academic_Year_Active_Flag = 'Present'");
	while(rs.next()){
		acadyear = ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"));
		
	}
	rs = stmnt.executeQuery("SELECT Semester_Description FROM `r_semester` where Semester_Active_Flag = 'Active'");
	while(rs.next()){
		sem = ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"));
		
	}
		
		
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("courseDrp", courseDrp);
	pageContext.setAttribute("yearDrp", yearDrp);
	pageContext.setAttribute("acadyear", acadyear);
	pageContext.setAttribute("sem", sem);


%>    

<t:Registrar title="Registration Opening" from="Pre-Enrollment" to="Registration Opening">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Pre-Enrollment/RegistrationOpening.js"></script>
    
        <div class="row">
       		<div class="col-md-6">
		        <div class="mini-stat clearfix">
		            <span class="mini-stat-icon orange"></span>	        
		            <div class="mini-stat-info">
		                <span id="academicyear">${acadyear}</span>
		                Active Academic Year
		            </div>
		        </div>
	    	</div>
	    	<div class="col-md-6">
		        <div class="mini-stat clearfix">
			        <span class="mini-stat-icon tar"></span>
		            <div class="mini-stat-info">
		                <span id="semester">${sem}</span>
		                Active Semester
		            </div>
		        </div>
	    	</div>
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
                                            <th style="width: 40%">Code</th>
                                            <th style="width: 50%">Description</th>
                                            <th style="width: 10%">Action</th>  
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Opening" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Registration Opening</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
		                            <div class="col-lg-6" style="padding-top:10px">
		                        		<h4 id="coucode" >EKPV</h4>
		                        		<h6 id="coudesc" style="font-style:italic">EKPV</h6>
		                            </div>		                       	
	                        	</div>
	                        	<div class="col-lg-12">
		                            <table class="table table-hover" id="curTbl">
			                			<thead>
					                    	<tr>
					                        	<th style="width: 90%">Year Level</th>
					                            <th style="width: 10%">Status</th>
					                       	</tr>
			                    		</thead>
			                    		<tbody id="mainBody">		
			                    			<tr>
			                    				<td></td>
			                    				<td></td>
			                    			</tr>	                    			
			                    		</tbody>
			               			</table>	                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="SaveBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Registrar>
