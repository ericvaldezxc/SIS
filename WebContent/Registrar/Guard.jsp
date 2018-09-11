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
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * from r_school_guard ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("School_Guard_First_Name"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("School_Guard_Middl_Name"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("School_Guard_Last_Name"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		
		
		
		tablebody += "<tr><td>" + rs.getString("School_Guard_Number")+ "</td><td>"+ fullname +"</td><td>"+rs.getString("School_Guard_Access")+"</td><td>"; 

		if(rs.getString("School_Guard_Display_Status").equals("Active"))
			tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#Edit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
		else
			tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
		
	}
	
	
	pageContext.setAttribute("tablebody", tablebody);

%>    

<t:Registrar title="Guard" from="Guard" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				
				var latcode = ''
				$('#addBtn').click(function(e){
					var fname = $('#fnameTxt').val()
					var mname = $('#mnameTxt').val()
					var lname = $('#lnameTxt').val()
					
	            	e.preventDefault();
					 swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#DD6B55',
	                    confirmButtonText: 'Yes, do it!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
	                function (isConfirm) {
	                    if (isConfirm) {
	                		$.ajax({
	        					type:'POST',
	        					data:{degree:JSON.stringify(degree),subject:JSON.stringify(subject),fname:fname,mname:mname,lname:lname,type:'Insert',latcode:latcode},
	        					url:'Controller/Registrar/Faculty/Faculty',
	        					success: function(result){
	         						swal("Record Added!", "The data is successfully added!", "success");
		                             
	        					},
	                            error: function (response) {
	                                swal("Error encountered while adding data", "Please try again", "error");
	                                $("#editable-sample_new").click();
	                            }
	        				});

	                    } else {

	                        swal("Cancelled", "The transaction is cancelled", "error");
	                        $("#editable-sample_new").click();
	                    }

	                });
									
				});
				
				$('#addBtn').click(function(e){
					var fname = $('#fnameTxt').val()
					var mname = $('#mnameTxt').val()
					var lname = $('#lnameTxt').val()
					var access = $('#accChk').prop('checked')
					if(access == true)
						access = 'Yes'
					else
						access = 'No'
					
	            	e.preventDefault();
					 swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#DD6B55',
	                    confirmButtonText: 'Yes, do it!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
	                function (isConfirm) {
	                    if (isConfirm) {
	                		$.ajax({
	        					type:'POST',
	        					data:{access:access,fname:fname,mname:mname,lname:lname,type:'Insert',latcode:latcode},
	        					url:'Controller/Registrar/Faculty/Guard',
	        					success: function(result){
	         						swal("Record Added!", "The data is successfully added!", "success");
		                             
	        					},
	                            error: function (response) {
	                                swal("Error encountered while adding data", "Please try again", "error");
	                                $("#editable-sample_new").click();
	                            }
	        				});

	                    } else {

	                        swal("Cancelled", "The transaction is cancelled", "error");
	                        $("#editable-sample_new").click();
	                    }

	                });
									
				});
				$('#updBtn').click(function(e){
					var degree = $('#updselDegree').val()
					var subject = $('#updselSubject').val()
					var fname = $('#updfnameTxt').val()
					var mname = $('#updmnameTxt').val()
					var lname = $('#updlnameTxt').val()
					
	            	e.preventDefault();
					 swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#DD6B55',
	                    confirmButtonText: 'Yes, do it!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
	                function (isConfirm) {
	                    if (isConfirm) {
	                		$.ajax({
	        					type:'POST',
	        					data:{degree:JSON.stringify(degree),subject:JSON.stringify(subject),fname:fname,mname:mname,lname:lname,type:'Update',latcode:latcode},
	        					url:'Controller/Registrar/Faculty/Faculty',
	        					success: function(result){
	         						swal("Record Added!", "The data is successfully added!", "success");
		                             
	        					},
	                            error: function (response) {
	                                swal("Error encountered while adding data", "Please try again", "error");
	                                $("#editable-sample_new").click();
	                            }
	        				});

	                    } else {

	                        swal("Cancelled", "The transaction is cancelled", "error");
	                        $("#editable-sample_new").click();
	                    }

	                });
									
				});
				
				
				$('#editable-sample').on('click','a.edit',function(){
					var cod = $(this).closest('tr').children('td:first').text()
					latcode = cod
					$.ajax({
    					type:'POST',
    					data:{facnum:cod},
    					url:'Controller/Registrar/Faculty/GetFaculty',
    					success: function(result){
    						var item = JSON.parse(result)
    						$.each(item,function(key,val){
        						$.each(val.name,function(key2,val2){
            						$('#updfnameTxt').val(val2.fname)
            						$('#updmnameTxt').val(val2.mname)
            						$('#updlnameTxt').val(val2.lname)
        							
        						})
        						console.log(val.degree)
           						$('#updselDegree').val(val.degree)
            					$('#updselSubject').val(val.subject)
            					$('#updselDegree').multiSelect('refresh')
            					$('#updselSubject').multiSelect('refresh')
            					$('.ms-container').css("width", "100%"); 
    						})
    					},
                        error: function (response) {
                            swal("Error encountered while adding data", "Please try again", "error");
                            $("#editable-sample_new").click();
                        }
    				});
					
				})				

			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
		<script type="text/javascript" src="../Assets/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.multi-select.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-multi-select/js/jquery.quicksearch.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Student/Student.js"></script>
    	
    
        <div class="row">
                <div class="col-sm-12">
                	<section class="panel">
                            <div class="panel-body">
                                <div class="adv-table editable-table ">
                                    <div class="clearfix">
                                        <div class="btn-group">
                                            <button id="editable-sample_new" class="btn btn-success add" data-toggle="modal" href="#Faculty">
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
	                                            <th style="width: 30%">Guard Number</th>
	                                            <th style="width: 30%">Guard Name</th>
	                                            <th style="width: 30%">Access</th>
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
          <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Faculty" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="schedule-title">Guard</h4>
	                </div>
	                <div class="modal-body">
	                	<div class="row">
		                	<div class="col-lg-4">
	                        	First Name <input type="text" class="form-control" placeholder="ex. Juan" id="fnameTxt" >
	                        </div>
		                	<div class="col-lg-4">
	                        	Middle Name <input type="text" class="form-control" placeholder="ex. Ponce" id="mnameTxt" >
	                        </div>
		                	<div class="col-lg-4">
	                        	Last Name <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="lnameTxt" >
	                        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px;">
				            <div class="col-lg-6" >
	                			Mobile Access
				                <input type="checkbox" class="form-control ckbox" id="accChk" checked style="width:20px;height:20px;">
				            </div>
	                	</div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="closeBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Edit" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="schedule-title">Faculty</h4>
	                </div>
	                <div class="modal-body">
	                	<div class="row">
		                	<div class="col-lg-4">
	                        	First Name <input type="text" class="form-control" placeholder="ex. Juan" id="updfnameTxt" >
	                        </div>
		                	<div class="col-lg-4">
	                        	Middle Name <input type="text" class="form-control" placeholder="ex. Ponce" id="updmnameTxt" >
	                        </div>
		                	<div class="col-lg-4">
	                        	Last Name <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="updlnameTxt" >
	                        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px">
					            <div class="col-lg-6">
		                			Degree
					                <select name="country" class="multi-select" multiple="" id="updselDegree" style="width: 100%;" >
					                    ${degree}
					                </select>
					            </div>
					            <div class="col-lg-6">
						            Subject
					                <select name="country" class="multi-select" multiple="" id="updselSubject" >
					                    ${subject}
					                </select>
					            </div> 
	                	</div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="closeBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="updBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	    
	        
	    </jsp:body>


</t:Registrar>
