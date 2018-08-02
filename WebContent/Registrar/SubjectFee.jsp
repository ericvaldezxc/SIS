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
	String feeDrp = drp.fillfeeDrp();
	String yearDrp = drp.fillacadyearDrp();
	String subjectDrp = drp.fillsubjectDrp();
	String firstCol = "";
	String updfirstCol = "";
	
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select *,(select ifnull(sum(Subject_Fee_Items_Amount),0) from r_subject_fee_items where Subject_Fee_ID = Subject_Fee_Items_SubjectFeeID and Subject_Fee_Items_Display_Status = 'Active') as amo from r_subject_fee inner join r_subject on Subject_Fee_SubjectID = Subject_ID inner join r_academic_year on Academic_Year_ID = Subject_Fee_AcademicYearID");
		while(rs.next()){
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Description"))+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Description"))+"</td><td>"+rs.getString("amo")+"</td><td>"; 
			if(rs.getString("Subject_Fee_Display_Status").equals("Active"))
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit' data-id='"+rs.getString("Subject_Fee_ID")+"' data-acadyear='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Academic_Year_Code"))+"' data-subject='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
		}
		firstCol =  "<select class='populate fee' style='width: 200px'><option data-description='' disabled='disabled' selected='selected'>Select Fee</option>"+feeDrp+"</select>";
		updfirstCol =  "<select class='populate updfee' style='width: 200px'><option data-description='' disabled='disabled' selected='selected'>Select Fee</option>"+feeDrp+"</select>";

	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("feeDrp", feeDrp);
	pageContext.setAttribute("yearDrp", yearDrp);
	pageContext.setAttribute("subjectDrp", subjectDrp);
	pageContext.setAttribute("firstCol", firstCol);
	pageContext.setAttribute("updfirstCol", updfirstCol);
	
%>    

<t:Registrar title="Subject Fee" from="Pre-Enrollment" to="Subject Fee">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				var body = $('#duplicate').html()
				var updbody = $('#updduplicate').html()
				$("#mainBody").append(body);
				$("#updmainBody").append(body);
		//		$("#mainBody select.fee").select2();
	//			$("#updyearDrp select.fee").select2();
//				$("#updsubjectDrp select.fee").select2();
				$("select.fee").select2();
				$('#itemsTbl').on('click','a.delete',function(r){
					$(this).closest('tr').remove();
					
				});
				
				$('#mainBody').on('change','select.fee',function(){
					getTotalAmount()
				});
				
				$('.addItem').on('click',function(){
					$("#mainBody").append(body);
					$("#mainBody select.fee").select2();
				});
				
				$('#mainBody').on('keyup','input.amountTxt',function(r){
					getTotalAmount()
					
				});
				$('#mainBody').on('click','a.delete',function(r){
					$(this).closest('tr').remove();
					getTotalAmount()
				});
				
				var amountTotal = 0;
				function getTotalAmount(){
					amountTotal = 0;
					$('#mainBody tr').each(function(){
	                	var amount = $(this).find('.amountTxt').val();
	           
	                	if(amount != '' )	
		                	amountTotal = parseFloat(amountTotal) + (parseFloat(amount) ) ;
					})
					
            		$.ajax({
    					type:'POST',
    					data:{Amount: amountTotal},
    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
    					success: function(result){
    	                	$('#totamount').html(result)
    	                	
 
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					
				}
				
				$('#updmainBody').on('change','select.updfee',function(){
					updgetTotalAmount()
				});
				
				$('.updaddItem').on('click',function(){
					$("#updmainBody").append(updbody);
					$("#updmainBody select.updfee").select2();
				});
				
				$('#updmainBody').on('keyup','input.amountTxt',function(r){
					updgetTotalAmount()
					
				});
				$('#updmainBody').on('click','a.delete',function(r){
					$(this).closest('tr').remove();
					updgetTotalAmount()
				});
				
				var updamountTotal = 0;
				function updgetTotalAmount(){
					updamountTotal = 0;
					$('#updmainBody tr').each(function(){
	                	var amount = $(this).find('.amountTxt').val();
	           
	                	if(amount != '' )	
	                		updamountTotal = parseFloat(updamountTotal) + (parseFloat(amount) ) ;
					})
					

					
            		$.ajax({
    					type:'POST',
    					data:{Amount: updamountTotal},
    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
    					success: function(result){
    	                	$('#updtotamount').html(result)
    	                	
 
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					
				}
				
				
				

				
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Pre-Enrollment/SubjectFee.js"></script>
    	<table class="hidden">
				<tbody id="duplicate">    
					<td  style="width: 40%">
         				${firstCol}
		            </td>
		            <td style="width: 35%"> <input type="number" value="0" min="0.00" max="10000.00" step="0.01" class="form-control amountTxt" placeholder="ex. 8" id="" ></td>
		            <td style="width: 25%"><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
				<tbody id="updduplicate">    
					<td  style="width: 40%">
         				${updfirstCol}
		            </td>
		            <td style="width: 35%"> <input type="number" value="0" min="0.00" max="10000.00" step="0.01" class="form-control amountTxt" placeholder="ex. 8" id="" ></td>
		            <td style="width: 25%"><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
			</table>
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
	                                            <th style="width: 100px">Subject</th>
	                                            <th style="width: 100px">Total Amount</th>
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
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Subject Fee</h4>
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
	                        			Subject
	                        			<select id="subjectDrp" class="populate " style="width: 290px">
                                      	  ${subjectDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-12" style="padding-top:10px">
		                            	Item/s:
		                                <table class="table table-striped table-hover table-bordered" id="itemsTbl">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 40%">Fee</th>
		                                            <th style="width: 35">Amount</th>
		                                            <th style="width: 25%">Action</th>  
		                                        </tr>
		                                    </thead>
		                                    <tbody id="mainBody">    
											
		                                    </tbody>
		                                    <tfoot><th colspan='3'> Total Amount: <label id="totamount">0.00</label></th></tfoot>
		                            	</table>
		                            	<a class='btn btn-success addItem' href='javascript:;'><i class='fa fa fa-plus'></i></a>
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
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Subject Fee</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                    
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-6">
		                                Academic Year 
		                                <select class='populate fee' style='width: 290px;' id="updyearDrp" >
	                                		 ${yearDrp} 
	                                	 </select>
		                            </div>
		                            <div class="col-lg-6">
	                        			Subject
	                        			<select id="updsubjectDrp" class="populate fee" style="width: 290px">
                                      	  ${subjectDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-12" style="padding-top:10px">
		                            	Item/s:
		                                <table class="table table-striped table-hover table-bordered" id="upditemsTbl">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 40%">Fee</th>
		                                            <th style="width: 35">Amount</th>
		                                            <th style="width: 25%">Action</th>  
		                                        </tr>
		                                    </thead>
		                                    <tbody id="updmainBody">    
											
		                                    </tbody>
		                                    <tfoot><th colspan='3'> Total Amount: <label id="updtotamount">0.00</label></th></tfoot>
		                            	</table>
		                            	<a class='btn btn-success updaddItem' href='javascript:;'><i class='fa fa fa-plus'></i></a>
		                            </div>			                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    </jsp:body>


</t:Registrar>
