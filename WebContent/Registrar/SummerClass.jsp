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
	
	String firstCol = "";
	String firstCol2 = "";
	
	String fullname = "";	
	String fname = "";	
	String mname = "";	
	String lname = "";	
	String status = "";	
	String subjectDrp = "";
	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `r_student_profile` inner join r_student_application on Student_Profile_ID = Student_Application_StudentProfileID where Student_Profile_ID not in (SELECT Student_Account_Student_Profile_ID from t_student_account WHERE Student_Account_Display_Status = 'Active') ");
	while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			
			tablebody += "<tr><td>" + rs.getString("Student_Application_Application_Number") +"</td><td>" + fullname +"</td><td>For Assessment</td><td>"; 
//			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
//					tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-info admission' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' href='#Admission'><i class='fa fa-briefcase'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
//			else
//				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#AdmissionEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
	}


	

	
	pageContext.setAttribute("tablebody", "");
	pageContext.setAttribute("subjectDrp", drp.fillsubjectDrp());
	pageContext.setAttribute("studentDrp", drp.fillstudentDrp());
	pageContext.setAttribute("camDrp", drp.fillcampusDrp());
	
	
%>    

<t:Registrar title="Summer Class" from="Summer Class" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				var daycol = '<td><select class="populate dayDrp" ><option value="default" selected="selected" disabled="disabled" >Select a Day</option><option value="M" >Monday</option><option value="T"  >Tuesday</option><option value="W" >Wednesday</option><option value="TH" >Thursday</option><option value="F"  >Friday</option><option value="S" >Saturday</option><option value="SU" >Sunday</option></select></td>'
				var startcol = '<td><input type="time" class="form-control timeStart" value="07:30:00" ></td>'
				var endcol = '<td><input type="time" class="form-control timeEnd" value="07:30:00" ></td>'
				var delcol = '<td><a class="btn btn-danger delBtn" type="button"><i class="fa fa-trash-o"></i></a></td>'

				$("select#subDrp").select2({width: '100%'});
				$("select#facDrp").select2({width: '100%'});
				$("select#camDrp").select2({width: '100%'});
				
				$('#studDrp').multiSelect({
					
				    selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    afterInit: function (ms) {
				        var that = this,
				            $selectableSearch = that.$selectableUl.prev(),
				            $selectionSearch = that.$selectionUl.prev(),
				            selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)',
				            selectionSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selection.ms-selected';

				        that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
				            .on('keydown', function (e) {
				                if (e.which === 40) {
				                    that.$selectableUl.focus();
				                    return false;
				                }
				            });

				        that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
				            .on('keydown', function (e) {
				                if (e.which == 40) {
				                    that.$selectionUl.focus();
				                    return false;
				                }
				            });
				    },
				    afterSelect: function () {
				        this.qs1.cache();
				        this.qs2.cache();
				    },
				    afterDeselect: function () {
				        this.qs1.cache();
				        this.qs2.cache();
				    }
				});
				$('.ms-container').css("width", "100%"); 
				$('#subDrp').change(function(){
					var sub = $(this).val()
			    	$.ajax({
						type:'POST',
						data:{subject: sub},
						url: "Controller/Registrar/Summer/GetFacultyPerSubject",
						success: function(result){
							var item = $.parseJSON(result)
							console.log(item)
							$('#facDrp').html('')
							$('#facDrp').append('<option value="default" disabled >Select a Faculty</option>') 
							$.each(item, function (key, val) {
								$('#facDrp').append('<option value='+val.code+' >'+val.name+'</option>') 
	                			
	                		})
	                		$('#facDrp').val('default')
		            		
						},
	                    error: function (response) {
	                        swal("Error encountered while accessing the data", "Please try again", "error");
	                    }
					});
				})
				var i = 0 
	            $('#addItem').on('click',function(){
	            	if(i == 0)
	            		$('#schedmainBody').html('')
		            i++
	            	var camp = $('#camDrp').val()
	            	var room = '<td><select class="populate roomDrp"  ><option value="default" selected="selected" >TBA</option> '  
	            	$.ajax({
						type:'POST',
						data:{Campus: camp},
						url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillRoom',
						success: function(result){
							var item = $.parseJSON(result)
							$.each(item, function (key, val) {
								room += '<option value="'+val.code+'" >'+val.desc+'</option>';
	                			
	                		})
	                		room += '</select></td>'	                    		
	                		$('#schedmainBody').append('<tr>'+daycol+startcol+endcol+room+delcol+'</tr>')
	                		$("select.dayDrp").select2( {width: '100%' });
	                		$("select.roomDrp").select2( {width: '100%' });
	 					},
	                    error: function (response) {
	                        swal("Error encountered while accessing the data", "Please try again", "error");
	                    }
					});
	            	
	            })
	            
	            $('#schedmainBody').on('click','a.delBtn',function(r){
					$(this).closest('tr').remove();
					
				});
				
				$('#addBtn').on('click',function(){
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
	                        	var subDrp = $('#subDrp').val()	
	        					var facDrp = $('#facDrp').val()	
	        					var studDrp = $('#studDrp').val()	
	        					var schedule = []
	        					$($('#schedmainBody tr')).each(function(){
	        						var day = $(this).find('.dayDrp option:selected').val() 
	        						var start = $(this).find('.timeStart').val()
	        						var end = $(this).find('.timeEnd').val()
	        						var room = $(this).find('.roomDrp option:selected').val()
	        						schedule.push({room:room,tend:end,tstart:start,day:day})
	        						
	        					})
	        					console.log(schedule)
	        					
	        	            	$.ajax({
	        						type:'POST',
	        						data:{
	        							subject: subDrp,faculty: facDrp,student:JSON.stringify(studDrp),schedule:JSON.stringify(schedule)
	        							},
	        						url: "Controller/Registrar/Summer/Summer",
	        						success: function(result){
	        							 swal({

	                                            title: "Record Added!",
	                                            text: "The data is successfully added!",
	                                            type: "success",
	                                            confirmButtonColor: '#86CCEB',
	                                            confirmButtonText: 'Okay',
	                                            closeOnConfirm: false
	                                        },
	                                        function (isConfirm) {
	                                            if (isConfirm) {
	                                                window.location.reload();

	                                            } else
	                                                swal("Cancelled", "The transaction is cancelled", "error");

	                                        });
	        	 					},
	        	                    error: function (response) {
	        	                        swal("Error encountered while accessing the data", "Please try again", "error");
	        	                    }
	        					});
	                     

	                        } else
	                            swal("Cancelled", "The transaction is cancelled", "error");

	                    });
						
				});
				
				

				
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
	                                            <th style="width: 20%">Subject</th>
	                                            <th style="width: 20%">Professor</th>
	                                            <th style="width: 30%">Schedule</th>
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Summer Class</h4>
	                </div>
	                <div class="modal-body">
	               		<div class="row">
					    	<div class="col-lg-6">
						    	Subject
			               		<select class="populate" style="width: 300px" id="subDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Subject</option>
						   			${subjectDrp}											   				
                                </select>
							</div>
						</div>
						<div class="row" style="margin-top:10px">
							<div class="col-lg-6">
						    	Faculty
			               		<select class="populate" style="width: 300px" id="facDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>
						   			${facultyDrp}											   				
                                </select>
							</div>
					    	<div class="col-lg-6">
		                		Campus
			               		<select class="populate" style="width: 300px" id="camDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
						   			${camDrp}											   				
                                </select>
					        </div>
					    </div>
                        <div class="row" style="margin-top:10px">
					    	<div class="col-lg-12">
		                		Student 
					        	<select class="multi-select" multiple="" id="studDrp">
					            	${studentDrp}
					            </select>
					        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px">
                        	<div class="col-lg-12">
	                        		<table class="table table-hover" id="curTbl">
				                		<thead>
				                    		<tr>
				                        		<th style="width: 20%"">Day</th>
				                            	<th style="width: 20%"">Time Start</th>
				                         	    <th style="width: 20%">Time End</th>
				                            	<th style="width: 25%">Room</th>
				                            	<th style="width: 5%">Action</th>
				                       	</tr>
				                    </thead>
				                    <tbody id="schedmainBody">   
				                    	<tr>
				                    		<td colspan="5" style="text-align:center;font-weight:bold;font-style:italic;">No Data Available</td>
				                    	</tr>
				                    </tbody>
				               </table>	                        	
				               <a class="btn btn-success " id="addItem" href="javascript:;"><i class="fa fa fa-plus"></i></a>
                        	</div>
                        </div>
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
