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
	ResultSet rs = stmnt.executeQuery("SELECT * from r_professor ");
	while(rs.next()){
		fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_FirstName"));
		mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_MiddleName"));
		lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Professor_LastName"));
		Fullname fn = new Fullname();
		fullname = fn.fullname(fname, mname, lname);
		String profid = rs.getString("Professor_ID");
		ResultSet rs2 = stmnt2.executeQuery("SELECT * from r_faculty_degree inner join r_degree on  Faculty_Degree_DegreeID = Degree_ID  where Faculty_Degree_ProfessorID = '"+profid+"' and Faculty_Degree_Display_Status = 'Active' ");
		String degreeDrp = "";
		while(rs2.next()){
			degreeDrp += rs2.getString("Degree_Description") + " <br/>";
			
			
		}
		rs2 = stmnt2.executeQuery("SELECT * from r_faculty_subject inner join r_subject on  Faculty_Subject_SubjectID = Subject_ID  where Faculty_Subject_ProfessorID = '"+profid+"' and Faculty_Subject_Display_Status = 'Active'");
		String subjectDrp = "";
		int i = 0 ;
		while(rs2.next()){
			if(i != 0 )
				subjectDrp += " | ";
			subjectDrp += ec.decrypt(ec.key, ec.initVector, rs2.getString("Subject_Code"));
			i++;
		
			
		}
		
		
		tablebody += "<tr><td>" + rs.getString("Professor_Code")+ "</td><td>"+ fullname +"</td><td>"+degreeDrp+"</td><td>"+subjectDrp+"</td><td>"; 

		if(rs.getString("Professor_Display_Status").equals("Active"))
			tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#Edit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
		else
			tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
		
	}
	
	
	
	String degree = "";
	rs = stmnt.executeQuery("SELECT * FROM `r_degree` where Degree_Display_Status = 'Active'");
	while(rs.next()){
		degree += "<option value='"+rs.getString("Degree_Code")+"'>"+rs.getString("Degree_Code")+"</option>"; 
		
	}
	
	String Drp = "";
	rs = stmnt.executeQuery("Select Subject_Code,Subject_Description,Subject_Credited_Units from r_subject WHERE Subject_Display_Stat = 'Active' and Subject_Type = 'Academic'");
	int  i = 0 ;
	while(rs.next()){
		if(i == 0){
			Drp += "<optgroup label='Academic'>";				
			
		}
		Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"</option>";

		i++;
		
	}
	if(i != 0){
		Drp += "</optgroup>";				
		
	}
	i = 0;
	rs = stmnt.executeQuery("Select Subject_Code,Subject_Description,Subject_Credited_Units from r_subject WHERE Subject_Display_Stat = 'Active' and Subject_Type = 'Non-Academic'");
	while(rs.next()){
		if(i == 0){
			Drp += "<optgroup label='Non-Academic'>";				
			
		}
		Drp += "<option value='"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"' data-cred-unit='"+rs.getString("Subject_Credited_Units")+"'  >"+ec.decrypt(ec.key, ec.initVector, rs.getString("Subject_Code"))+"</option>";

		i++;
		
	}
	if(i != 0){
		Drp += "</optgroup>";				
		
	}
	i = 0;

	
	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	
	pageContext.setAttribute("degree", degree);	
	pageContext.setAttribute("subject", Drp);	

%>    

<t:Registrar title="Faculty" from="Faculty" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$('#updselDegree').multiSelect({
					
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
				$('#updselSubject').multiSelect({
					
					selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    afterInit: function (ms) {
				        var that = this,
				            $selectableSearch = that.$selectableUl.prev(),
				            $selectionSearch = that.$selectionUl.prev(),
				            selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)' ,
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
				$('#selDegree').multiSelect({
				
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
				$('#selSubject').multiSelect({
					
					selectableHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    selectionHeader: "<input type='text' class='form-control search-input' autocomplete='off' placeholder='search...'>",
				    afterInit: function (ms) {
				        var that = this,
				            $selectableSearch = that.$selectableUl.prev(),
				            $selectionSearch = that.$selectionUl.prev(),
				            selectableSearchString = '#' + that.$container.attr('id') + ' .ms-elem-selectable:not(.ms-selected)' ,
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
				var latcode = ''
				$('#addBtn').click(function(e){
					var degree = $('#selDegree').val()
					var subject = $('#selSubject').val()
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
					var degree = $('#selDegree').val()
					var subject = $('#selSubject').val()
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
	                                            <th style="width: 20%">Faculty Number</th>
	                                            <th style="width: 20%">Faculty Name</th>
	                                            <th style="width: 20%">Degree</th>
	                                            <th style="width: 20%">Subject</th>
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
	                    <h4 class="modal-title" id="schedule-title">Faculty</h4>
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
	                	<div class="row" style="margin-top:10px">
					            <div class="col-lg-6">
		                			Degree
					                <select name="country" class="multi-select" multiple="" id="selDegree" style="width: 100%;" >
					                    ${degree}
					                </select>
					            </div>
					            <div class="col-lg-6">
						            Subject
					                <select name="country" class="multi-select" multiple="" id="selSubject" >
					                    ${subject}
					                </select>
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
