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
	String subjectDrp = drp.fillsubjectDrp();
	String semesterDrp = drp.fillsemesterDrp();
	String feeDrp = drp.fillfeeDrp();
	String courseDrp = drp.fillcourseDrp();
	String yearlvlDrp = drp.fillyearlvldrp();
	String groupsubject = drp.fillgroupsubjectDrp();
	String curyearDrp = drp.fillcuryearDrp();
	
	String groupfirstCol = "";
	String firstCol = "";
	String firstCol2 = "";
	String feefirstCol = "";
	String feefirstCol2 = "";
	String secCol = "";
	String thirdCol = "";
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_Curriculum inner join r_semester on Curriculum_SemesterID = Semester_ID inner join r_course on Curriculum_CourseID = Course_ID ");
		while(rs.next()){ 
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Curriculum_Code"))+ "</td><td>"+rs.getString("Curriculum_YearLevel")+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Description"))+"</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Description"))+"</td><td>"; 
			if(rs.getString("Curriculum_Display_Status").equals("Active"))
//				tablebody += "<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a> <a class='btn btn-success edit' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
//				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info fee' data-toggle='modal' href='#FeeEdit'><i class='fa fa-money'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
				tablebody += "<center> <a class='btn btn-success edit' data-yearlevel='"+rs.getString("Curriculum_YearLevel")+"' data-course='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Course_Code")) +"' data-semester='"+ ec.decrypt(ec.key, ec.initVector, rs.getString("Semester_Code"))+"' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	
	firstCol =  "<select class='populate SubjectDrp fee' style='width: 290px'><option value='default' >Select Subject</option>"+subjectDrp+"</select>" ;
	groupfirstCol =  "<select class='populate SubjectDrp grpfee' style='width: 290px'><option value='default' >Select Subject</option>"+groupsubject+"</select>" ;
	firstCol2 =  "<select class='populate SubjectDrp fee' style='width: 290px'>"+subjectDrp+"</select>";
	feefirstCol =  "<select class='form-control FeeDrp'><option value='default' selected='selected' disabled='disabled' data-description='' data-amount=''>Select a Fee</option>"+feeDrp+"</select>";
	feefirstCol2 =  "<select class='form-control FeeDrp'>"+feeDrp+"</select>";

	secCol = "<center class='unitText'></center>";
	thirdCol = "<center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center>";
	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("subjectDrp", subjectDrp);
	pageContext.setAttribute("feeDrp", feeDrp);
	pageContext.setAttribute("courseDrp",courseDrp);
	pageContext.setAttribute("semesterDrp", semesterDrp);
	pageContext.setAttribute("yearlvlDrp", yearlvlDrp);
	pageContext.setAttribute("curyearDrp", curyearDrp);
	pageContext.setAttribute("firstCol", firstCol);
	pageContext.setAttribute("groupfirstCol", groupfirstCol);
	pageContext.setAttribute("firstCol2", firstCol2);
	pageContext.setAttribute("feefirstCol", feefirstCol);
	pageContext.setAttribute("feefirstCol2", feefirstCol2);
	pageContext.setAttribute("secCol", secCol);
	pageContext.setAttribute("thirdCol", thirdCol);
	


%>    

<t:Admin title="Curriculum" from="Curriculum Setup" to="Curriculum">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
				EditableTable.init();
				var latestcode = '';
				var body = $('#duplicate').html()
				var befcode = '';
				var groupbody = $('#groupduplicate').html()
				$("select.fee").select2();
				
				$('.addItem').on('click',function(){
					$("#mainBody").append(body);
					$("#mainBody select.fee").select2();
					
				});
				
				$('.addGroupItem').on('click',function(){
					$("#mainBody").append(groupbody);
					$("#mainBody select.grpfee").select2();
					
				});
				
				
				$('#mainBody').on('change','select.grpfee',function(){
                	var unit = $(this).find('option:selected').data("cred-unit");
                	var val = $(this).find('option:selected').val()
                	$('#mainBody tr').each(function(){
	                	if($(this).data("code") == befcode)
	                		$(this).remove();

					})
                	befcode = val;
                	
                	$(this).closest('tr').find('.unitText').html(unit)
                	getTotal()
                	$.ajax({
    					type:'POST',
    					data:{groupname: val},
    					url:'Controller/Admin/Curriculum/GroupItems',
    					success: function(result){
    						var items = $.parseJSON(result)
    						$.each(items,function(index,val){
    							$('#mainBody').append(appendtable(val.grp,val.code,val.desc))
    							
    						})

    					},
                        error: function (response) {
                            swal("Error encountered while adding data", "Please try again", "error");
                            
                        }
    				});
                	
                	
                	
				});
				
				
				$('#mainBody').on('change','select.fee',function(){
					var unit = $(this).find('option:selected').data("cred-unit");
                	$(this).closest('tr').find('.unitText').html(unit)
                	getTotal()
					
				});
				
				$('#mainBody').on('click','a.delete',function(r){
					var getcode = $(this).closest('tr').find('option:selected').val();
					$(this).closest('tr').remove();
					$('#mainBody tr').each(function(){
	                	if($(this).data("code") == getcode)
	                		$(this).remove();

					})
					
					getTotal()

					
				});
				
				//--
				
				
				$('.addItemEdit').on('click',function(){
					$("#viewmainBody").append(body);
					$("#viewmainBody select.fee").select2();
					
				});
				
				$('.addGroupItemEdit').on('click',function(){
					$("#viewmainBody").append(groupbody);
					$("#viewmainBody select.grpfee").select2();
					
				});
				
				
				$('#viewmainBody').on('change','select.grpfee',function(){
                	var unit = $(this).find('option:selected').data("cred-unit");
                	var val = $(this).find('option:selected').val()
                	$('#viewmainBody tr').each(function(){
	                	if($(this).data("code") == befcode)
	                		$(this).remove();

					})
                	befcode = val;
                	
                	$(this).closest('tr').find('.unitText').html(unit)
                	getTotal()
                	$.ajax({
    					type:'POST',
    					data:{groupname: val},
    					url:'Controller/Admin/Curriculum/GroupItems',
    					success: function(result){
    						var items = $.parseJSON(result)
    						$.each(items,function(index,val){
    							$('#viewmainBody').append(appendtable(val.grp,val.code,val.desc))
    							
    						})

    					},
                        error: function (response) {
                            swal("Error encountered while adding data", "Please try again", "error");
                            
                        }
    				});
                	
                	
                	
				});
				
				
				$('#viewmainBody').on('change','select.fee',function(){
					var unit = $(this).find('option:selected').data("cred-unit");
                	$(this).closest('tr').find('.unitText').html(unit)
                	getTotal()
					
				});
				
				$('#viewmainBody').on('click','a.delete',function(r){
					var getcode = $(this).closest('tr').find('option:selected').val();
					$(this).closest('tr').remove();
					$('#mainBody tr').each(function(){
	                	if($(this).data("code") == getcode)
	                		$(this).remove();

					})
					
					getTotal()

					
				});
				
				
				var totunit = 0;
				function getTotal(){
					totunit = 0
					$('#mainBody tr').each(function(){
	                	var unit = $(this).find('.unitText').html();
	                	if(unit == '' || typeof unit === "undefined")
	                		unit = 0

                		totunit = parseFloat(totunit) + (parseFloat(unit)) ;	                	

					})
					$('#totunits').html(totunit)
					
					
					
				}
				
				function appendtable(grp,code,desc){
					var row = '<tr class="getcode" data-code="'+grp+'"><td colspan="3"  style="text-align:center">'+code+ ' - '+ desc+'</td></tr>';
					
					return row
				}
				
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Admin/CurriculumSetup/Curriculum.js"></script>
    
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
                                          <th style="width: 20%">Code</th>
                                          <th style="width: 20%">Year Level</th>
                                          <th style="width: 20%">Course</th>
                                          <th style="width: 25$">Semester</th>
                                          <th style="width: 20%">Action</th>  
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
				<tbody id="duplicate">    
					<td>
         				${firstCol}
		            </td>
		            <td style="font-size:20px" ><center class="unitText"></center></td>
		            <td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
				<tbody id="groupduplicate">    
					<td>
         				${groupfirstCol}
		            </td>
		            <td style="font-size:20px" ><center class="unitText"></center></td>
		            <td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
				<tbody id="updateduplicate">    
					<td>
         				${firstCol}
		            </td>
		            <td style="font-size:20px" ><center class="unitText"></center></td>
		            <td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
				<tbody id="groupupdateduplicate">    
					<td>
         				${groupfirstCol}
		            </td>
		            <td style="font-size:20px" ><center class="unitText"></center></td>
		            <td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
				<tbody id="feeduplicate">    
					<td>
         				${feefirstCol}
		            </td>
			   		<td style="font-size:13px" ><center class="descriptionText"></center></td>
			   		<td style="font-size:13px" ><center class="amountText"></center></td> 
			   		<td style="font-size:13px" ><input type="number" min="1" class="form-control quantityText" value="1"></td>
			   		<td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>
				</tbody>
			</table>
         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Curriculum</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
		                            <div class="col-lg-6">
	                        			Course
	                        			<select id="courseDrp" class="populate fee" style="width: 290px">
                                      	  ${courseDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-6">
	                        			Semester
	                        			<select id="SemesterDrp" class="populate fee" style="width: 290px">
                                      	  ${semesterDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-6" style="padding-top:10px">
	                        			Year Level
	                        			<select id="yearlvlDrp" class="populate fee" style="width: 290px">
                                      	  ${yearlvlDrp} 
                                    	</select>       			
		                            </div>
		                            <div class="col-lg-6" style="padding-top:10px">
	                        			Curriculum Year
	                        			<select id="curyearDrp" class="populate fee" style="width: 290px">
                                      	  ${curyearDrp} 
                                    	</select>       			
		                            </div>
		                            <div class="col-lg-12" style="padding-top:10px">
		                            	Item/s:
		                                <table class="table table-striped table-hover table-bordered" id="itemsTbl">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 200px">Subject</th>
		                                            <th style="width: 100px">Credited Units</th>
		                                            <th style="width: 120px">Action</th>  
		                                        </tr>
		                                    </thead>
		                                    <tbody id="mainBody">    
											   <tr>
											   		<td>
					                        			<select class="populate SubjectDrp fee" style="width: 290px">
					                        			<option value='default' >Select Subject</option>
				                                      	  ${subjectDrp} 
				                                    	</select>       			
						                            </td>
											   		<td style="font-size:20px" ><center class="unitText"></center></td>
											   		<td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>											   		
											   </tr>
		                                    </tbody>
		                                    <tfoot>
	                                    		<tr>
	                                    			<td colspan="3">Total Credited Units: <label id="totunits">0</label></td>
		                                    	</tr>
		                                    </tfoot>
		                            	</table>
		                            	<a class='btn btn-success addItem' title="Add Subject" href='javascript:;'><i class='fa fa fa-plus'></i></a>
		                            	<a class='btn btn-info addGroupItem' title="Add Group Subject" href='javascript:;'><i class='fa fa fa-plus'></i></a>
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="CurriculumEdit" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="curriculumCode" >Sample</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                     	<div class="row" style="padding-left:15px;padding-top:10px">
	                            <div class="col-lg-12" style="padding-top:10px">
	                            	<div class="col-lg-6">
	                        			Course
	                        			<select id="updcourseDrp" class="populate fee" style="width: 290px">
                                      	  ${courseDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-6">
	                        			Semester
	                        			<select id="updSemesterDrp" class="populate fee" style="width: 290px">
                                      	  ${semesterDrp} 
                                    	</select>                      			
		                            </div>
		                            <div class="col-lg-6" style="padding-top:10px">
	                        			Year Level
	                        			<select id="updyearlvlDrp" class="populate fee" style="width: 290px">
                                      	  ${yearlvlDrp} 
                                    	</select>       			
		                            </div>
		                            <div class="col-lg-12" style="padding-top:10px">
		                            	Item/s:
		                                <table class="table table-striped table-hover table-bordered" id="itemsTblEdit">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 200px">Code</th>
		                                            <th style="width: 100px">Credited Units</th>
		                                            <th style="width: 120px">Action</th>  
		                                        </tr>
		                                    </thead>
		                                    <tbody id="viewmainBody">   
		                                    	<tr>
												   	<td>
						                        		<select class="populate SubjectDrp fee" style="width: 290px">
						                        			<option value='default' >Select Subject</option>
				                                      	 	 ${subjectDrp} 
				                                    	</select>       			
							               			</td>
											   		<td style="font-size:20px" ><center class="unitText"></center></td>
											   		<td><center><a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-trash-o'></i></a></center></td>											   		
												</tr> 
		                                    </tbody>
		                            	</table>
		                            	<a class='btn btn-success addItemEdit' href='javascript:;'><i class='fa fa fa-plus'></i></a>
		                            	<a class='btn btn-info addGroupItemEdit' title="Add Group Subject" href='javascript:;'><i class='fa fa fa-plus'></i></a>
		                            </div>	                        
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
	                            	Item/s:
	                                <table class="table table-striped table-hover table-bordered" id="itemsTblFee">
		                            	<thead>
	                                        <tr>
	                                            <th style="width:25%">Fee Code</th>
	                                            <th style="width:30%">Description</th>
	                                            <th style="width:25%">Amount</th>
	                                            <th style="width:10%" >Quantity</th>
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
										   		<td style="font-size:13px" ><input type="number" min="1" class="form-control quantityText" value="1"></td>
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
