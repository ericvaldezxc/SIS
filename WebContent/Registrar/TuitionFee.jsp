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


	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select Unit_Fee_Description,FORMAT(Unit_Fee_Amount,2) AS AMOU from r_unit_fee ");
		while(rs.next()){
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Unit_Fee_Description"))+ "</td><td>"+rs.getString("AMOU")+"</td><td>"; 
			tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a><center></td></tr>";
			
		}

		
		
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("courseDrp", courseDrp);
	pageContext.setAttribute("yearDrp", yearDrp);



%>    

<t:Registrar title="Tuition Fee" from="Pre-Enrollment" to="Tuition Fee">

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
    	<script src="../Assets/Registrar/Pre-Enrollment/TuitionFee.js"></script>
    
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
	                                            <th style="width: 50%">Description</th>
	                                            <th style="width: 45%">Amount</th>
	                                            <th style="width: 5%">Action</th>  
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="FeeAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Tuition Fee</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                    
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-6">
		                                Academic Year 
		                                <select class='populate' style='width: 290px;' id="yearDrp" >
	                                		 ${yearDrp} 
	                                	 </select>
		                            </div>
	                        		<div class="col-lg-6">
	                        			Course
	                        			<select id="courseDrp" class="populate " style="width: 290px">
                                      	  ${courseDrp} 
                                    	</select>                      			
		                            </div>
		                        	<div class="col-lg-6" style="padding-top:10px">
		                        		Year Level 
		                        			<select class='form-control ' style='width: 300px;' id="lvlDrp" >
		                                		<option value='1' selected='selected' >First Year</option>
		                                		<option value='2' >Second Year</option>
		                                		<option value='3' >Third Year</option>
		                                		<option value='4' >Fourth Year</option>
		                                	 </select>
		                            </div>	
		                            <div class="col-lg-6" style="padding-top:10px">
		                        		Amount <input type="number" min="0.00" max="10000.00" step="0.01" class="form-control" placeholder="ex. 8" id="amountTxt" >
		                            </div>		                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="FeeEdit" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Tuition Fee</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
		                            <div class="col-lg-6" style="padding-top:10px">
		                        		Description <input type="text" class="form-control" placeholder="ex. Tuition Unit" id="upddescTxt" >
		                            </div>		                   
		                            <div class="col-lg-6" style="padding-top:10px">
		                        		Amount <input type="number" min="0.00" max="10000.00" step="0.01" class="form-control" placeholder="ex. 8" id="updamountTxt" >
		                            </div>		                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updateBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Registrar>
