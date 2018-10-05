<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.*" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags/Admin" %>
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
	String campusDrp = drp.fillcampusDrp();
	String courseDrp = drp.fillcourseDrp();
	String yearlvlDrp = drp.fillyearlvl();
	String firstCol = "";
	String firstCol2 = "";

	String feefirstCol = "";
	String feefirstCol2 = "";
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_section` INNER JOIN r_campus ON Section_CampusID = Campus_ID INNER JOIN r_course ON Section_CourseID = Course_ID");
		while(rs.next()){
			tablebody += "<tr><td>" + rs.getString("Section_Code")+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</td><td>"+rs.getString("Section_Year")+"</td><td>"+rs.getString("Section_Section")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Campus_Name"))+"</td><td>"; 
			if(rs.getString("Section_Display_Status").equals("Active"))
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#SectionEdit'><i class='fa fa-edit'></i></a>  <a class='btn btn-info fee' data-toggle='modal' href='#FeeEdit'><i class='fa fa-money'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	

	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("yearlvlDrp", yearlvlDrp);


%>    

<t:Admin title="Section" from="Student Setup" to="Section">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
				EditableTable.init();
				$("select.fee").select2();
				
				$('#campusDrp').on('change',function(){
					var camp = $(this).val()
					$.ajax({
    					type:'POST',
    					data:{Campus: camp},
    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillCourse',
    					success: function(result){
    						var item = $.parseJSON(result)
			        		$("#courseDrp").select2("val","default");

    						$('#courseDrp').val('')

    						$('#courseDrp').html('<option value="default" selected="selected" disabled="disabled" >Select a Course</option>');
    						$.each(item, function (key, val) {
    							$('#courseDrp').append('<option value="'+val.code+'" >'+val.code + ' - ' +val.desc+'</option>');
                    			
                    			
                    		})
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
				})
				
			
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Admin/StudentSetup/Section.js"></script>
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#CurriculumAdd">
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
	                                            <th style="width: 15%">Code</th>
	                                            <th style="width: 20%x">Course</th>  
	                                            <th style="width: 15%x">Year Level</th>  
	                                            <th style="width: 20%x">Section</th>  
	                                            <th style="width: 15%">Campus</th>
	                                            <th style="width: 15%">Action</th>  
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
         	<table class="hidden">
				<tbody id="feeduplicate">    
					<td>
         				${feefirstCol}
		            </td>
			   		<td style="font-size:13px" ><center class="descriptionText"></center></td>
			   		<td style="font-size:13px" ><center class="amountText"></center></td> 
			   		<td style="font-size:13px"  class="hidden" ><input type="number" min="1" class="form-control quantityText" value="1"></td>
			   		<td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
			</table>
         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:50%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Section</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
                        		<div class="row">
                        			<div class="col-lg-6">
										Campus
	                        			<select class="populate fee" style="width: 290px" id="campusDrp">
	                        				 <option selected="selected" disabled="disable" value="default">Select a Campus</option>
	                                      	 ${campusDrp} 
                                    	</select>     	                        		
		                            </div>
	                        		<div class="col-lg-6">
										Course
	                        			<select class="populate " style="width: 290px" id="courseDrp">
	                        				 <option selected="selected" disabled="disable" value="default">Select a Course</option>
	                                      	  ${courseDrp} 
                                    	</select>     	                        		
		                            </div>
                        		</div>
	                        	<div class="row" style="margin-top:10px">
	                        		<div class="col-lg-6">
										Year Level
	                        			<select class="populate fee" style="width: 290px" id="yearDrp">
	                                      	  ${yearlvlDrp} 
                                    	</select>     	                        		
		                            </div>
	                        		<div class="col-lg-6">
		                                Section <input type="text" class="form-control" placeholder="ex. 1" id="sectionTxt" >
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="SectionEdit" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Code" >Sample</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-6">
	                                Year Level
	                                <select class="form-control" style="width: 300px" id="UpdyearTxt">
						   				<option value="default" selected="selected" disabled="disabled" >Select Year Level</option>
						   				<option value="1" >First Year</option>
						   				<option value="2" >Second Year</option>
						   				<option value="3" >Third Year</option>
						   				<option value="4" >Fourth Year</option>
                                    </select>
	                            </div>
                        		<div class="col-lg-6">
	                                Section <input type="text" class="form-control" placeholder="ex. 1" id="UpdsectionTxt" >
	                            </div>
                       		</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Course
                             		<select class="form-control" style="width: 300px" id="UpdCourseDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Course</option>
						   				${courseDrp}											   				
                                    </select>
	                            </div>
	                            <div class="col-lg-6" style="padding-top:10px">
	                                Curriculum
                             			<select class="form-control" style="width: 300px" id="UpdCurriculumDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Curriculum</option>
						   				${curDrp}											   				
                                    </select>
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-12" style="padding-top:10px">
	                                Section Description<textarea class="form-control" placeholder="ex. For BSIT First Year" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="UpddescTxt"></textarea>
	                            </div>	    
                        	</div>           
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="updateBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	       </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="FeeEdit" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="feeCode" >Sample</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                             <h3>Total Amount</h3>
	                             <h4 id="totalAmount">0.00</h4>
	                        </div>
	                        <div class="row">
		                        <div class="col-lg-12" style="padding-top:10px">
	                            	Miscellaneous / Other Fees:
	                                <table class="table table-striped table-hover table-bordered" id="itemsTblFee">
		                            	<thead>
	                                        <tr>
	                                            <th style="width:25%">Fee Code</th>
	                                            <th style="width:30%">Description</th>
	                                            <th style="width:25%">Amount</th>
	                                            <th style="width:10%" class="hidden">Quantity</th>
	                                            <th style="width:10%" >Action</th>  
	                                        </tr>
	                                    </thead>	                                    
	                                    <tbody id="viewmainBodyFee">    
										   <tr>
										   		<td>
										   			<select class="form-control FeeDrp" >
										   				<option value="default" selected="selected" disabled="disabled" data-description="" data-amount="">Select a Fee</option>
										   				${feeDrp}											   				
				                                    </select>
					                            </td>
										   		<td style="font-size:13px" ><center class="descriptionText"></center></td>
										   		<td style="font-size:13px" ><center class="amountText"></center></td> 
										   		<td style="font-size:13px" class="hidden" ><input type="number" min="1" class="form-control  quantityText " value="1"></td>
										   		<td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
										   </tr>
	                                    </tbody>
	                            	</table>
	                            	<a class='btn btn-success addItemFee' href='javascript:;'><i class='fa fa fa-plus'></i></a>
	                            </div>	                        
                            </div>	
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="FeecloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="FeesaveBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	       </div>
	    </div>	
	        
	    </jsp:body>


</t:Admin>
