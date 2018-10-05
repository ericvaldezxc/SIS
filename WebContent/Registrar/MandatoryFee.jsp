<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
<%@page import="configuration.Dropdowns" %>
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
	String feeDrp = drp.fillfeeDrp();
	String yearDrp = drp.fillacadyearDrp();


	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select Academic_Year_Description,Fee_Description,FORMAT(Mandatory_Fee_Amount,2) AS AMOU,Mandatory_Fee_Display_Status from r_mandatory_fee inner join r_academic_year on Mandatory_Fee_AcademicYearID = Academic_Year_ID inner join r_fee on Mandatory_Fee_FeeID = Fee_ID where Fee_Display_Status = 'Active' and  Academic_Year_Display_Status = 'Active' ");
		while(rs.next()){
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Fee_Description"))+"</td><td>"+rs.getString("AMOU")+"</td><td>"; 
			if(rs.getString("Mandatory_Fee_Display_Status").equals("Active"))
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
		
		

		
		
		
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("feeDrp", feeDrp);
	pageContext.setAttribute("yearDrp", yearDrp);



%>    

<t:Registrar title="Mandatory Fee" from="Pre-Enrollment" to="Mandatory Fee">

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
    	<script src="../Assets/Registrar/Pre-Enrollment/MandatoryFee.js"></script>
    
        <div class="row">
        
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#FeeAdd">
                                        Add New <i class="fa fa-plus"></i>
                                    </button>
                                        </div>
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 200px">Academic Year</th>
	                                            <th style="width: 100px">Fee</th>
	                                            <th style="width: 150px">Amount</th>
	                                            <th style="width: 120px">Action</th>  
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
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Mandatory Fee</h4>
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
	                        			Fee
	                        			<select class="populate " style="width: 290px" id="feeDrp">
	                                      	  ${feeDrp} 
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

	    </jsp:body>


</t:Registrar>
