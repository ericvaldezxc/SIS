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
	Statement stmnt2 = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("SELECT * FROM `t_summer_class` inner join r_professor on Summer_Class_ProfessorID = Professor_ID inner join r_academic_year on Summer_Class_Academic_Year = Academic_Year_ID  inner join r_subject on Summer_Class_Subject_ID = Subject_ID where Summer_Class_Display_Status = 'Active' ");
	while(rs.next()){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_FirstName"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_MiddleName"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
			String sub = ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			ResultSet rs2 = stmnt2.executeQuery("SELECT IFNULL(CONCAT(Summer_Class_Schedule_Day,' ',TIME_FORMAT(Summer_Class_Schedule_Time_Start, '%h:%i %p'),'-',TIME_FORMAT(Summer_Class_Schedule_Time_End, '%h:%i %p'),' '),'TBA') AS SCHED,IFNULL(Room_Description,'TBA') AS ROOM FROM `t_summer_class_schedule` left join r_room on Summer_Class_Schedule_RoomID = Room_ID where Summer_Class_Schedule_SummerClassID = '"+rs.getString("Summer_Class_ID")+"' and Summer_Class_Schedule_Display_Status = 'Active'");
			String sched = "";
			int i = 0 ;
			while(rs2.next()){
				String room = rs2.getString("ROOM");
				if(!room.equals("TBA")){
					room = ec.decrypt(ec.key, ec.initVector, rs2.getString("ROOM"));
				}
				sched += rs2.getString("SCHED") + "-"+ room +"<br/>";
				i++;
			}
			if(i == 0){
				sched = "TBA";
			}
			
			
			
			
			tablebody += "<tr><td>" + rs.getString("Summer_Class_Code") +"</td><td>"+sub+"</td><td>" + fullname +"</td><td>"+sched+"</td><td style='text-align:center;'><a class='btn btn-success edit'  data-toggle='modal'  href='#Edit' ><i class='fa fa-edit'></i></a></td></tr>"; 
			
	}


	

	
	pageContext.setAttribute("tablebody", tablebody);
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
				var fac = 'default'
				var updbody = 'tr><td colspan="5" style="text-align:center;font-weight:bold;font-style:italic;">No Data Available</td></tr>'
				var latcode = ""
				$("select#subDrp").select2({width: '100%'});
				$("select#facDrp").select2({width: '100%'});
				$("select#camDrp").select2({width: '100%'});
				$("select#updsubDrp").select2({width: '100%'});
				$("select#updfacDrp").select2({width: '100%'});
				$("select#updcamDrp").select2({width: '100%'});
				var j = 0
				$('#editable-sample').on('click','a.edit',function(){
					var code = $(this).closest('tr').children('td:eq(0)').text()
					latcode = code
					$.ajax({
    					type:'POST',
						data:{summercoode:code},        			
						url:'Controller/Registrar/Summer/GetSummerSchedule',
    					success: function(result){
    						var item = $.parseJSON(result)
    						fac = item.professor
                           	var sub = item.subject
                           	var camp = item.campus
                           	console.log(fac)
                           	$("select#updsubDrp").val(sub).trigger("change")
//                           	$("select#updsubDrp").select2("val", sub);
                           	$("select#updfacDrp").select2("val", fac);
               				$("select#updcamDrp").select2("val", camp);
               				$("select#updfacDrp").select2("val", fac);
               				$("#updstudDrp").val(item.student);
               				$('#updschedmainBody').html(updbody)
               				j = 0
               				$.each(item.schedule, function (key2, val2) {
               			
								if(j == 0)
	            					$('#updschedmainBody').html('')
					            j++
				            	camp = $('#updcamDrp').val()
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
				                		$('#updschedmainBody').append('<tr>'+daycol+startcol+endcol+room+delcol+'</tr>')
				                		$("select.dayDrp").select2( {width: '100%' });
				                		$("select.roomDrp").select2( {width: '100%' });
				                		 var lastrow = $('#updschedmainBody tr:last');
			               					console.log(val2.day)
			               					
			               					$(lastrow).find('.dayDrp').select2("val",val2.day)
			               					$(lastrow).find('.timeStart').val(val2.tstart)
			               					$(lastrow).find('.timeEnd').val(val2.tend)
			               					$(lastrow).find('.roomDrp').select2("val",val2.room)
				 					},
				                    error: function (response) {
				                        swal("Error encountered while accessing the data", "Please try again", "error");
				                    }
								});                       				
                       				
                               
	                			
	                		})
	                		
	                		$('#updstudDrp').multiSelect('refresh')
        					$('.ms-container').css("width", "100%"); 
                             
    					},
                        error: function (response) {
                            swal("Error encountered while adding data", "Please try again", "error");
                        }
    				});

					
				})
				
				$('#editable-sample_new').click(function(){
					fac = 'default'
				})
				
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
				$('#updstudDrp').multiSelect({
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
				
				$('#updsubDrp').change(function(){
					var sub = $(this).val()
			    	$.ajax({
						type:'POST',
						data:{subject: sub},
						url: "Controller/Registrar/Summer/GetFacultyPerSubject",
						success: function(result){
							var item = $.parseJSON(result)
							console.log(item)
							$('#updfacDrp').html('')
							$('#updfacDrp').append('<option value="default" disabled >Select a Faculty</option>') 
							$.each(item, function (key, val) {
								$('#updfacDrp').append('<option value='+val.code+' >'+val.name+'</option>') 
	                			
	                		})
	                		
	                		$("select#updfacDrp").select2("val", fac);
	                		//$('#updfacDrp').val(fac)
		            		
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
	            $('#updItem').on('click',function(){
	            	if(j == 0)
	            		$('#updschedmainBody').html('')
		            j++
	            	var camp = $('#updcamDrp').val()
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
	                		$('#updschedmainBody').append('<tr>'+daycol+startcol+endcol+room+delcol+'</tr>')
	                		$("select.dayDrp").select2( {width: '100%' });
	                		$("select.roomDrp").select2( {width: '100%' });
	 					},
	                    error: function (response) {
	                        swal("Error encountered while accessing the data", "Please try again", "error");
	                    }
					});
	            	
	            })
	            
	             
	            
	            $('#schedmainBody').on('click','a.delBtn',function(){
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
	        	            	var camp = $('#camDrp').val()
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
	        							subject: subDrp,faculty: facDrp,student:JSON.stringify(studDrp),schedule:JSON.stringify(schedule),campus:camp
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
				$('#updBtn').on('click',function(){
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
	                        	var subDrp = $('#updsubDrp').val()	
	        					var facDrp = $('#updfacDrp').val()	
	        					var studDrp = $('#updstudDrp').val()	
	        					var schedule = []
	        	            	var camp = $('#updcamDrp').val()
	        					$($('#updschedmainBody tr')).each(function(){
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
	        							latcode:latcode,subject: subDrp,faculty: facDrp,student:JSON.stringify(studDrp),schedule:JSON.stringify(schedule),campus:camp
	        							},
	        						url: "Controller/Registrar/Summer/UpdateSummer",
	        						success: function(result){
	        							 swal({

	                                            title: "Record Updated!",
	                                            text: "The data is successfully updated!",
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Edit" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Edit Summer Class</h4>
	                </div>
	                <div class="modal-body">
	               		<div class="row">
					    	<div class="col-lg-6">
						    	Subject
			               		<select class="populate" style="width: 300px" id="updsubDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Subject</option>
						   			${subjectDrp}											   				
                                </select>
							</div>
						</div>
						<div class="row" style="margin-top:10px">
							<div class="col-lg-6">
						    	Faculty
			               		<select class="populate" style="width: 300px" id="updfacDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>
						   			${facultyDrp}											   				
                                </select>
							</div>
					    	<div class="col-lg-6">
		                		Campus
			               		<select class="populate" style="width: 300px" id="updcamDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
						   			${camDrp}											   				
                                </select>
					        </div>
					    </div>
                        <div class="row" style="margin-top:10px">
					    	<div class="col-lg-12">
		                		Student 
					        	<select class="multi-select" multiple="" id="updstudDrp">
					            	${studentDrp}
					            </select>
					        </div>
	                	</div>
	                	<div class="row" style="margin-top:10px">
                        	<div class="col-lg-12">
	                        		<table class="table table-hover" id="">
				                		<thead>
				                    		<tr>
				                        		<th style="width: 20%"">Day</th>
				                            	<th style="width: 20%"">Time Start</th>
				                         	    <th style="width: 20%">Time End</th>
				                            	<th style="width: 25%">Room</th>
				                            	<th style="width: 5%">Action</th>
				                       	</tr>
				                    </thead>
				                    <tbody id="updschedmainBody">   
				                    	<tr>
				                    		<td colspan="5" style="text-align:center;font-weight:bold;font-style:italic;">No Data Available</td>
				                    	</tr>
				                    </tbody>
				               </table>	                        	
				               <a class="btn btn-success " id="updItem" href="javascript:;"><i class="fa fa fa-plus"></i></a>
                        	</div>
                        </div>
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
