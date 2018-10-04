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
	String campusDrp = drp.fillcampusDrp();
	String curyearDrp = drp.fillcuryearDrp();
	String tablebody = "";

	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_room");
		while(rs.next()){
			tablebody += "<tr><td>" + ec.decrypt(ec.key, ec.initVector, rs.getString("Room_Code"))+ "</td><td>"+ec.decrypt(ec.key, ec.initVector, rs.getString("Room_Description"))+"</td><td>"; 
			if(rs.getString("Room_Display_Status").equals("Active"))
//				tablebody += "<center> <a class='btn btn-info view' href='javascript:;'><i class='fa fa-eye'></i></a> <a class='btn btn-success edit' data-toggle='modal' href='#CurriculumEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("campusDrp", campusDrp);
	pageContext.setAttribute("curyearDrp", curyearDrp);
	pageContext.setAttribute("yearDrp", drp.fillyearlvldrp());
	pageContext.setAttribute("semDrp", drp.fillsemesterDrp2());	
	pageContext.setAttribute("dayDrp", drp.filldayDrp());
	pageContext.setAttribute("professorDrp", drp.fillprofessor());
	pageContext.setAttribute("curriculumDrp", drp.fillcuryearDrp());

%>    

<t:Registrar title="Section Offering" from="Pre-Enrollment" to="Section Offering">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("#typeDrp").select2( {width: '50%' });
				$("#campusDrp").select2( {width: '80%' });
				$("#sectionDrp").select2( {width: '80%' });
				$("#courseDrp").select2( {width: '80%' });
				$("#curyearDrp").select2( {width: '80%' });
				$("#yearDrp").select2( {width: '80%' });
				$("#semesterDrp").select2( {width: '80%' });
				$("#professorDrp").select2( {width: '80%' });
				$("#curriculumDrp").select2( {width: '80%' });
				$(".roomDrp").select2( {width: '80%' });
				$(".dayDrp").select2( {width: '80%' });
				$('#typeDrp').hide();
				
				$('#campusDrp').on('change',function(){
					var camp = $(this).val()
					$.ajax({
    					type:'POST',
    					data:{Campus: camp},
    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillCourse',
    					success: function(result){
    						var item = $.parseJSON(result)
			        		$("#courseDrp").select2("val","default");
    						$('#courseDrp').html('<option value="default" selected="selected" disabled="disabled" >Select a Course</option>');
    						$.each(item, function (key, val) {
    							$('#courseDrp').append('<option value="'+val.code+'" >'+val.code + ' - ' +val.desc+'</option>');
                    			
                    			
                    		})
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					fillsec()
				})
				$('#courseDrp').on('change',function(){
					fillsec()
				})
				$('#yearDrp').on('change',function(){
					fillsec()
				})
				
				$('#schedmainBody').on('change','.roomDrp',function(){
					var timestart = $(this).closest('tr').find('.timeStart').val()
					var timeend = $(this).closest('tr').find('.timeEnd').val()
					var room = $(this).closest('tr').find('.roomDrp option:selected').val()
					var day = $(this).closest('tr').find('.dayDrp option:selected').val()
					timestart = timestart.replace(':','')
					timeend = timeend.replace(':','')
					timestart = timestart.substring(0,4)
					timeend = timeend.substring(0,4)
					var timedif = parseFloat(timeend) - parseFloat(timestart)
					if(timedif > 0){
						if(room!= 'default'){
							timestart = $(this).closest('tr').find('.timeStart').val()
							timeend = $(this).closest('tr').find('.timeEnd').val()
							timestart = timestart.substring(0,5)
							timeend = timeend.substring(0,5)
							
							$.ajax({
		    					type:'POST',
		    					data:{day: day,room:room,start:timestart,end:timeend},
		    					url: "Controller/Registrar/Preenrollment/CheckSchedule",
		    					success: function(result){
		    						var item = $.parseJSON(result);
		    						if(item.message == "Valid"){
		    							swal("Theres no conflict in the schedule", "Okay", "success");
		    						}
		    						else{
		    							var conflict = ""
		    							$.each(item.sched,function(key,val){
		    								conflict += val.day + " " + val.tstart + " " + val.tend + " " + val.room + "\n"
		    								
		    								
		    		                		
		    		                	})
		    							swal("Seems theres a conflict in the time youre trying to use", conflict, "error");
		    							
		    						}
		    						
		                             
		    					},
		                        error: function (response) {
		                            swal("Error encountered while accessing the data", "Please try again", "error");
		                        }
		    				});
							
							
						}
						
					}
					else
						swal("The time difference seems to be invalid", "Please check the time schedule again", "error");
					//alert(timedif +  " - " + timestart + " - " + timeend)
					
					
					
				})
				
				
				function fillsec(){
	        		var course = $('#courseDrp').val()
					var campus = $('#campusDrp').val()
					var year = $('#yearDrp').val()
					
					$.ajax({
						type:'POST',
						data:{course: course,campus:campus,year:year},
						url: 'Controller/Registrar/Preenrollment/GetSection',
						success: function(result){
							var item = $.parseJSON(result);
			        		$("#sectionDrp").select2("val","default");
	                		$('#sectionDrp').html('<option value="default" disabled="disabled">Select a Section</option>')
		                	$.each(item,function(key,val){
		                		$('#sectionDrp').append('<option value="'+val.sectioncode+'">'+val.sectioncode+'</option>')
		                		
		                	})
		                	

	                         
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
    	<script src="../Assets/Registrar/Pre-Enrollment/SectionOffering.js"></script>
    
	    <section class="panel">
            <header class="panel-heading">
                Section Offering Form <span class="tools pull-right">
            <a href="javascript:;" class="fa fa-chevron-down"></a>
            </span>
            </header>
            <div class="panel-body" style="align:center">
            	<div class="row">
            		<div class="col-lg-6">
                   		<h5 style="">Type</h5>
                    	<select class="populate" id="typeDrp" >
                           	<option value="For Block Section" selected="selected">For Block Section</option>
                           	<option value="Open" >Open</option>
                        </select>   
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-lg-6">
                   		<h5 style="">Campus</h5>
                    	<select class="populate" id="campusDrp" >
                  	        <option value="default" selected="selected" disabled="disabled" >Select a Campus</option>                  	
                           	${campusDrp}
                        </select>   
            		</div>
            		<div class="col-lg-6">
                   		<h5 style="">Course</h5>
                    	<select class="populate" id="courseDrp" >
                  	        <option value="default" selected="selected" disabled="disabled" >Select a Course</option>                  	
                           	${courseDrp}
                        </select>   
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-lg-6">
                   		<h5 style="">Year Level</h5>
                    	<select class="populate" id="yearDrp" >
                  	        <option value="default" selected="selected" disabled="disabled" >Select a Year Level</option>                  	
                           	${yearDrp}
                        </select>   
            		</div>
            		<div class="col-lg-6">
                   		<h5 style="">Section</h5>
                    	<select class="populate" id="sectionDrp" >
                    		<option value="default" selected="selected" disabled="disabled" >Select a Section</option>                  	                  	
                           	${sectionDrp}
                        </select>   
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-lg-6">
                   		<h5 style="">Curriculum Year</h5>
                    	<select class="populate" id="curriculumDrp" >
                  	        <option value="default" selected="selected" disabled="disabled" >Select a Curriculum</option>                            	       	
                  	       	 ${curriculumDrp}      	
                        </select>   
            		</div>
            		<div class="col-lg-6">
                   		<h5 style="">Semester</h5>
                    	<select class="populate" id="semesterDrp" >
                  	        <option value="default" selected="selected" disabled="disabled" >Select a Semester</option>                            	       	
                  	       	 ${semDrp}      	
                        </select>   
            		</div>
            	</div>
            	<div class="row">
            		<div class="col-lg-6" style="margin-top:10px">
                   		 <button class="btn btn-success " id="loadBtn" type="button">Load</button>
            		</div>
            	</div>
            </div>
        </section>
        <section class="panel">
          	<header class="panel-heading" >
             	 		<label id="loadTitle">Section Schedule</label><span class="tools pull-right">
            <a href="javascript:;" class="fa fa-chevron-down"></a>
            </span>
            </header>
            <div class="panel-body" >
            	<table class="table table-hover" id="curTbl">
                	<thead>
                    	<tr>
                        	<th style="width: 15%">Code</th>
                            <th style="width: 25%">Description</th>
                            <th style="width: 10%">Units</th>
                            <th style="width: 20%">Faculty Name</th>
                            <th style="width: 20%">Schedule</th>
                            <th style="width: 10%">Action</th>
                       	</tr>
                    </thead>
                    <tbody id="mainBody">   
                    	<tr>
                        	<td colspan="5" style="text-align:center;font-weight:bold;font-style:italic">No Avaliable Data to show</td>
                        </tr> 
                    </tbody>
               </table>
            </div>
        </section>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="Schedule" class="modal fade">
	        <div class="modal-dialog" style="width:70%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Schedule</h4>
	                </div>
	                <div class="modal-body">
                    	<div class="row">
                    		<div class="col-lg-8">
                        		<h5 style="">Professor Name</h5>
			                   	<select class="populate" id="professorDrp" >
			                  	    <option value="default" selected="selected" disabled>Select a Faculty</option>                            	       	
		                  			${professorDrp}      	
		                		</select>  	                        		
                            </div>
                    	</div>
                        <div class="row">
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
				                    	
				                    </tbody>
				               </table>	                        	
				                    <a class="btn btn-success " id="addItem" href="javascript:;"><i class="fa fa fa-plus"></i></a>
				               
                        	</div>
                        </div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button">Close</button>
	                    <button class="btn btn-success " id="addBtn" type="button">Save</button>
	                </div>
	            </div>
	        </div>
	    </div>	

	    </jsp:body>


</t:Registrar>
