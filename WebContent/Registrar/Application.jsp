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
	ResultSet rs = stmnt.executeQuery("SELECT distinct Student_Profile_Display_Status,Student_Profile_ID,Student_Profile_First_Name,Student_Profile_Middle_Name,Student_Profile_Last_Name,Student_Application_Application_Number,(SELECT IF((select count(*) from r_student_document as t1 inner join r_documents as t2 on t1.Student_Document_DocumentID = t2.Documents_ID where t1.Student_Document_StudentApplicationID = Student_Application_ID and Documents_Mandatory = 'Yes' and Student_Document_Display_Status = 'Active' )=(SELECT COUNT(*) FROM `r_documents` WHERE Documents_Mandatory = 'Yes'),'Cleared','Not Cleared')) as cle FROM `r_student_profile` inner join r_student_application on Student_Profile_ID = Student_Application_StudentProfileID left join r_student_document as d1 on d1.Student_Document_StudentApplicationID = Student_Application_ID where Student_Profile_ID not in (SELECT Student_Account_Student_Profile_ID from t_student_account WHERE Student_Account_Display_Status = 'Active') ");
		while(rs.next() && rs.getString("Student_Profile_First_Name") != null){
			fname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_First_Name"));
			mname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Middle_Name"));
			lname = ec.decrypt(ec.key, ec.initVector, rs.getString("Student_Profile_Last_Name"));
			if(mname.equals(""))
				fullname = lname + ", " + fname;
			else	
				fullname = lname + ", " + fname + " " +  mname;
			
			tablebody += "<tr><td>" + rs.getString("Student_Application_Application_Number") +"</td><td>" + fullname +"</td><td>"+rs.getString("cle")+"</td><td>For Assessment</td><td>"; 
//			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
//					tablebody += "<center><a class='btn btn-success application' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"' data-document='"+rs.getString("cle")+"' ><i class='fa fa-book'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
//			else
//				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			if(rs.getString("Student_Profile_Display_Status").equals("Active") )
				tablebody += "<center><a class='btn btn-success application' data-toggle='modal' data-studentid='"+rs.getString("Student_Profile_ID")+"'  data-document='"+rs.getString("cle")+"' ><i class='fa fa-book'></i></a> <a class='btn btn-info document' data-app='" + rs.getString("Student_Application_Application_Number") +"' href='javascript:;'><i class='fa fa-file-text'></i></a><center></td></tr>";
			
		}


	

	
	pageContext.setAttribute("tablebody", tablebody);
	pageContext.setAttribute("curDrp", curDrp);
	pageContext.setAttribute("courseDrp", "");	
	pageContext.setAttribute("campusDrp", campusDrp);	
	pageContext.setAttribute("documentDrp", drp.filldocumentDrp());	
	pageContext.setAttribute("subject", drp.fillsubjectDrp2());	
	pageContext.setAttribute("semDrp", drp.fillsemesterDrp());	
	pageContext.setAttribute("scholarshipDrp", drp.scholarshipDrp());	
	

	

%>    

<t:Registrar title="Application" from="Application" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
//				alert(window.location.hostname+":"+window.location.port+"/")
//				$('#yearhidden').hide()
				EditableTable.init();
				$("select.fee").select2({width: '100%'});
				$("select#courseDrp").select2({width: '100%'});
				$("select#scholarshipDrp").select2({width: '100%'});
				
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
				$('#credSub').slideUp()
				$('#semDrpRow').slideUp()
				$('#typeDrp').change(function(){
					var type = $(this).val()
					if(type == 'Transferee'){
						$('#credSub').slideDown()
						//$('#semDrpRow').slideDown()
						
					}
					else{
						$('#credSub').slideUp()
						$('#semDrpRow').slideUp()

					}


				})
				
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
				$('#downloadPdf').click(function(){
					var pdf = new jsPDF('p', 'pt', 'letter');
					var breaker = '_______________________________________________________________________'
					source = $('#feeTable')[0];
					specialElementHandlers = {
						'#bypassme': function(element, renderer){
							return true
						}
					}
					margins = {
					    top: 50,
					    left: 60,
					    width: 545
					  };
					var campus = $('#campusDrp option:selected').text()
					var address = $('#campusDrp option:selected').data('address')
					pdf.setFontType("bold");
					pdf.setFontSize(14);
					pdf.text(20,50,campus)
					

					
					pdf.setFontType("bold");
					pdf.setFontSize(14);
					pdf.text(22,80,breaker)
					
					pdf.setFontType("italic");
					pdf.setFontSize(12);
					pdf.text(25,70,address)
					
					
					
					
					$.ajax({
    					type:'POST',
    					async:false,
    					url: 'Controller/Registrar/Application/Voucher',
    					success: function(result){
    						var item = $.parseJSON(result)
    						$.each(item, function (key, val) {
    							pdf.setFontType("bold");
    							pdf.setFontSize(12);
    							pdf.text(20,95,"School Year " + val.year + " " + val.sem.toUpperCase() + " TERM")

    							pdf.setFontType("italic");
    							pdf.setFontSize(12);
    							pdf.text(20,145,"Name")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(120,145,":")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(150,145,val.name)
    							pdf.setFontType("italic");
    							pdf.setFontSize(12);
    							pdf.text(20,165,"Student Number")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(120,165,":")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(150,165,val.accnum)
    							pdf.setFontType("italic");
    							pdf.setFontSize(12);
    							pdf.text(20,185,"Course")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(120,185,":")
    							pdf.setFontType("bold");
    							pdf.setFontSize(14);
    							pdf.text(150,185,val.course)
                    			
                    		})
                    		
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					var base = 200
					
					pdf.setFontType("bold");
					pdf.setFontSize(14);
					pdf.text(20,base+10,breaker)

            		pdf.setFontType("bold");
					pdf.setFontSize(15);
					pdf.text(25,base+30,"Enrolled Subjects")
					$.ajax({
    					type:'POST',
    					async:false,
    					url: 'Controller/Registrar/Application/GetSubjects',
    					success: function(result){
    						var item = $.parseJSON(result)
    						var sbody = '<table class="table table-striped table-hover table-bordered" id="itemsTbl"><thead><tr><th style="width: 200px">Subject Code</th><th style="width: 200px">Subject Description</th><th style="width:200px">Section</th></tr></thead><tbody>'    
    						$.each(item, function (key, val) {
    							sbody += "<tr><td>"+val.code+"</td><td>"+val.desc+"</td><td>"+val.section+"</td></tr>"
    							base += 30
                    			
                    		})
                    		alert(base)
                    		sbody += "</tbody></table>"
                    		pdf.fromHTML(
							  	sbody // HTML string or DOM elem ref.
							  	, margins.left // x coord
							  	, 250 // y coord
							  	, {
							  		'width': margins.width // max width of content on PDF
							  		, 'elementHandlers': specialElementHandlers
							  	}
							)
                    		
                             
    					},
                        error: function (response) {
                            swal("Error encountered while accessing the data", "Please try again", "error");
                        }
    				});
					
					pdf.setFontType("bold");
					pdf.setFontSize(14);
					pdf.text(20,base+50,breaker)

            		pdf.setFontType("bold");
					pdf.setFontSize(15);
					pdf.text(25,base+70,"Breakdown of Tuition and Miscellaneous Fees")


					pdf.fromHTML(
					  	source // HTML string or DOM elem ref.
					  	, margins.left // x coord
					  	, base+90 // y coord
					  	, {
					  		'width': margins.width // max width of content on PDF
					  		, 'elementHandlers': specialElementHandlers
					  	}
					  	//,
					  	//function (dispose) {
					  	  // dispose: object with X, Y of the last line add to the PDF
					  	  //          this allow the insertion of new lines after html
//					  	   pdf.output('dataurlnewwindow');
					  		
					  		
//					  	   window.open(pdf.output('bloburl'))
					        //pdf.Open('Voucher.pdf');
					       
					      //}
					)
					
					var finamount = 0
					if($('#fullpayment').prop('checked') == true){
						finamount = $('#feemainBody .TotalAmount').html()
						pdf.fromHTML(
						  	"<h3> Full Payment </h3>" // HTML string or DOM elem ref.
						  	, 350 // x coord
						  	, base+220 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
							pdf.fromHTML(
						  	"<h3> "+finamount+" </h3>" // HTML string or DOM elem ref.
						  	, 450 // x coord
						  	, base+220 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
						
						pdf.fromHTML(
						  	"<h2> GRAND TOTAL </h2>" // HTML string or DOM elem ref.
						  	, 300 // x coord
						  	, base+270 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
						pdf.fromHTML(
						  	"<h2 style='font-color:green'> "+finamount+" </h2>" // HTML string or DOM elem ref.
						  	, 450 // x coord
						  	, base+270 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
			
						
					}
					else{
						finamount = parseFloat($('#feemainBody .TotalAmount').html().replace(',','')) / 2
						 $.ajax({
								type:'POST',
								async:false,
								data:{Amount: finamount},
								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
								success: function(result){
									finamount = result
									pdf.fromHTML(
									  	"<h3> Two Payment </h3>" // HTML string or DOM elem ref.
									  	, 350 // x coord
									  	, base+220 // y coord
									  	, {
									  		'width': margins.width // max width of content on PDF
									  		, 'elementHandlers': specialElementHandlers
									  	}
									)
									pdf.fromHTML(
									  	"<h3> "+finamount+" </h3>" // HTML string or DOM elem ref.
									  	, 450 // x coord
									  	, base+220 // y coord
									  	, {
									  		'width': margins.width // max width of content on PDF
									  		, 'elementHandlers': specialElementHandlers
									  	}
									)
									
									pdf.fromHTML(
									  	"<h2> GRAND TOTAL </h2>" // HTML string or DOM elem ref.
									  	, 300 // x coord
									  	, base+270 // y coord
									  	, {
									  		'width': margins.width // max width of content on PDF
									  		, 'elementHandlers': specialElementHandlers
									  	}
									)
									pdf.fromHTML(
									  	"<h2 style='font-color:green'> "+finamount+" </h2>" // HTML string or DOM elem ref.
									  	, 450 // x coord
									  	, base+270 // y coord
									  	, {
									  		'width': margins.width // max width of content on PDF
									  		, 'elementHandlers': specialElementHandlers
									  	}
									)
		       						
								},
			                    error: function (response) {
			                        swal("Error encountered while accessing the data", "Please try again", "error");
			                    }
							});
					}
					
					pdf.fromHTML(
						  	"<h2> AMOUNT DUE </h2>" // HTML string or DOM elem ref.
						  	, 310 // x coord
						  	, base+250 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
						pdf.fromHTML(
						  	"<h2> "+finamount+" </h2>" // HTML string or DOM elem ref.
						  	, 450 // x coord
						  	, base+250 // y coord
						  	, {
						  		'width': margins.width // max width of content on PDF
						  		, 'elementHandlers': specialElementHandlers
						  	}
						)
					
					  

					var myImage = new Image();
					myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
					myImage.onload = function(){
						pdf.addImage(myImage , 'png', 520, 30, 50, 50);
						 var uri = pdf.output('dataurlstring');
				  	   	 openDataUriWindow(uri);
				  	};
					 //working 
					
				
					
				})
				
				function openDataUriWindow(url) {
				    var html = '<html>' +
				        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
				        '<body>' +
				        '<iframe src="' + url + '"></iframe>' +
				        '</body></html>';
				    a = window.open();
				    a.document.write(html);
				}
				
				
				$('#subjectBody').on('change','.subject2',function(){
					$(this).closest('tr').find('.desc').html($(this).closest('tr').find('.subject2 option:selected').data('desc'))
					$(this).closest('tr').find('.cred').html($(this).closest('tr').find('.subject2 option:selected').data('cred-unit'))
					
				})
				
				var sbody = $('#subjectRow').html()
				$('#subjectBody').append(sbody)
				$("select.grade").select2({width: '100%'});
				$("select.subject2").select2({width: '100%'});
				$('.addItemEdit').on('click',function(){
					$('#subjectBody').append(sbody)
					$("select.subject2").select2({width: '100%'});
					$("select.grade").select2({width: '100%'});
				})
		
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Application/Application.js"></script>
    
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
	                                            <th style="width: 20%">Application ID</th>
	                                            <th style="width: 25%">Name</th>
	                                            <th style="width: 20%">Documents</th>
	                                            <th style="width: 20%">Status</th>
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
         <div class="hidden">
         <table>
         	<tbody id="subjectRow">
	         	<tr>
		         	<td>
			            <select class="populate subject2">
			         		<option selected disabled value="default">Select a subject</option>
			         		${subject}
			         	</select>
		         	</td>
		         	<td class="desc"></td>
	       		 	<td class="cred" style="text-align:center;"></td>
	       		 	<td>
			            <select class="populate grade">
			         		<option selected disabled value="default">Select a Grade</option>
			         		<option value="1.00" >1.00</option>
			         		<option value="1.25" >1.25</option>
			         		<option value="1.50" >1.50</option>
			         		<option value="1.75" >1.75</option>
			         		<option value="2.00" >2.00</option>
			         		<option value="2.25" >2.25</option>
			         		<option value="2.50" >2.50</option>
			         		<option value="2.75" >2.75</option>
			         		<option value="3.00" >3.00</option>
			         	</select>
	       		 	</td>
		         </tr>
         	</tbody>
         </table>
         	
         </div>

         <!-- Modal -->
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="CurriculumAdd" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Student Profile</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-4">
	                                Firstname <input type="text" class="form-control" placeholder="ex. Juan" id="firstNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Middlename <input type="text" class="form-control" placeholder="ex. Protacio" id="middleNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Lastname <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="lastNameTxt" >
	                            </div>
                       		</div>
                   		    <div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Contact Number<input type="text" maxlength="11" class="form-control" placeholder="ex. 09xxxxxxxxx"  id="conTxt" >
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Email Address  <input type="text" class="form-control" placeholder="ex. juandelacruz@domain.com" id="emailTxt" >
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Date of Birth <input type="date" class="form-control"  id="dobTxt" >
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Place of Birth <input type="text" class="form-control" placeholder="ex. Quezon City" id="pobTxt" >
	                            </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                        		Gender
	                                <select class="form-control" style="width: 300px" id="genderDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Gender</option>
						   				<option value="Male">Male</option>
						   				<option value="Female">Female</option>
                                    </select>
	                            </div>
	                        	<div class="col-lg-6" style="padding-top:10px">
	                        		Civil Status
	                                <select class="form-control" style="width: 300px" id="civilDrp">
						   				<option value="default" selected="selected" disabled="disabled" >Select a Civil Status</option>
						   				<option value="Single">Single</option>
						   				<option value="Married">Married</option>
						   				<option value="Widowed">Widowed</option>
						   				<option value="Divorced">Divorced</option>
                                    </select>	                            
                                </div>
                        	</div>
                        	<div class="row">
	                        	<div class="col-lg-12" style="padding-top:10px">
	                                Address <textarea class="form-control" placeholder="ex. Don fabian st. Commonwealth Quezon City" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="addressTxt"></textarea>
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="SectionEdit" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Code" >Edit Student Profile</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-4">
	                                Firstname <input type="text" class="form-control" placeholder="ex. Juan" id="updfirstNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Middlename <input type="text" class="form-control" placeholder="ex. Protacio" id="updmiddleNameTxt" >
	                            </div>
                        		<div class="col-lg-4">
	                                Lastname <input type="text" class="form-control" placeholder="ex. Dela Cruz" id="updlastNameTxt" >
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
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Document" class="modal fade">
	        <div class="modal-dialog" style="width:700px">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" id="Code" >Document</h4>
	                </div>
	                <div class="modal-body">
	                   <div class="row">
                            <div class="col-lg-6" style="padding-top:10px">
                            	Document
                            	</br>
                            	<select multiple name="e9" id="e9" style="width:300px" class="populate ">
                                       ${documentDrp} 
                                </select>
                            </div>	
                       	</div> 
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="documentClose" type="button">Close</button>
	                    <button class="btn btn-success " id="documentSave" type="button">Save</button>
	                </div>
	            </div>
	       </div>
	    </div>
	    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" id="Application" class="modal fade">
	        <div class="modal-dialog" style="width:50%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title" >Application</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row">
                        		<div class="col-lg-6">
	                                <h5>Name</h5>  
	                                <h4 id="studentName">Eric valdez</h4>  
	                                
	                            </div>
	                            <div class="col-lg-6">
	                                <h5 style="text-align:right">Status</h5>  
	                                <h4 style="text-align:right" id="studentStatus">Not Enrolled</h4>  
	                                
	                            </div>
                        		
                       		</div>
                        	<div class="row">
	                            <div class="col-lg-6" style="padding-top:10px">
                        			Campus
                        			<select id="campusDrp" class="populate fee" style="width: 290px">
                        				<option value="default" selected="selected" disabled="disabled" >Select a Campus</option>
                                     	  ${campusDrp} 
                                   	</select>          
	                            </div>	                              	                            
	                        	<div class="col-lg-6" style="padding-top:10px">
                        			Course
                        			<select id="courseDrp" class="populate " style="width: 290px">
                        				<option value="default" selected="selected" disabled="disabled" >Select a Course</option>
                                     	  ${courseDrp} 
                                   	</select>          
	                            </div>	
                        	</div> 
                        	<div class="row">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Section
                        			<select id="sectionDrp" class="populate fee" style="width: 290px">
                                     	 <option value="default" selected="selected" disabled="disabled" >Select a Section</option>			
                                   	</select> 
	                            </div>
	                            <div class="col-lg-6" style="padding-top:10px">
	                                Type
                        			<select id="typeDrp" class="populate fee" style="width: 290px">
                                     	 <option value="default" selected="selected" disabled="disabled" >Select a Type</option>			
                                     	 <option value="New Enrollee"  >New Enrollee</option>			
                                     	 <option value="Transferee"  >Transferee</option>			
                                   	</select> 
	                            </div>
                        	</div>  
                        	<div class="row" id="semDrpRow">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Semester
                        			<select id="semDrp" class="populate fee" style="width: 290px">
                                     	 <option value="default" selected="selected" disabled="disabled" >Select a Semester</option>		
                                     	  ${semDrp} 	
                                   	</select> 
	                            </div>
                        	</div> 
                        	<div class="row" id="">
	                        	<div class="col-lg-6" style="padding-top:10px">
	                                Semester
                        			<select id="scholarshipDrp" class="populate fee" style="width: 290px">
                                     	  ${scholarshipDrp} 	
                                   	</select> 
	                            </div>
                        	</div>                       	
                        	<div class="row">
                            	<section class="panel">
				            	<header class="panel-heading" style="background-color:#F1F2F7;margin-top:10px">
				               	 Curriculum Subjects <span class="tools pull-right">
						            <a href="javascript:;" class="fa fa-chevron-down"></a>
						            </span>
						            </header>
						            <div class="panel-body" >
	 								<table class="table table-striped table-hover table-bordered" id="itemsTbl">
			                            	<thead>
		                                        <tr>
		                                            <th style="width: 20%">Code</th>
								                	<th style="width: 30%">Description</th>
								                	<th style="width: 5%">Lec. Hours</th>
								                	<th style="width: 5%">Lab. Hours	</th>
								                	<th style="width: 5%">Cred. Units</th>
								                	<th style="width: 30%">Schedule</th>
								                	<th style="width: 5%">Action</th> 
		                                        </tr>
		                                    </thead>
		                                    <tbody id="mainBody">    
											   <tr>
											   		<td style="font-size:15px"  colspan="7" ><center class="codeText"></center></td>
											   		
											   </tr>
		                                    </tbody>
		                            	</table>
						            </div>
						        </section>
                        	</div>       
	                    </form>
	                    <div class="row" id="feeDiv">
                           	<section class="panel">
			            		<header class="panel-heading" style="background-color:#F1F2F7;margin-top:10px">
			               	 		Breakdown of Tuition and Miscellaneous Fees <span class="tools pull-right">
					            <a href="javascript:;" class="fa fa-chevron-down"></a>
					            </span>
					            </header>
					            <div class="panel-body" id="feeTable" >
					            	<table class="table table-striped table-hover table-bordered" id="itemsTbl">
		                            	<thead>
	                                        <tr>
	                                            <th style="width: 200px">Fee</th>
	                                            <th style="width: 100px">Amount</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="feemainBody">   
	                                   		 <tr>
	                                   		 	<td></td>
	                                   		 	<td></td>
                                   		 	 </tr> 
	                                    </tbody>
		                            </table>
					            </div>
	           <!--  <button type="button" class="btn btn-info " style="margin-left:10px" id="downloadPdf"><i class="fa fa-download"></i> Download PDF</button> -->	
	            			<div class="row" style="margin-left:10px">
		            			<div class="col-lg-12">
		            				<label>Full Payment</label> <input type="radio" id="fullpayment" checked name="payment" >	
		            				<label>Two Payment</label>  <input type="radio" id="twopayment"  name="payment" >
		            			</div>
	            			</div>
					        </section>
                       	</div>
	                    <div class="row" id="credSub">
                           	<section class="panel">
			            		<header class="panel-heading" style="background-color:#F1F2F7;margin-top:10px">
			            		Credited Subjects <span class="tools pull-right">
					            <a href="javascript:;" class="fa fa-chevron-down"></a>
					            </span>
					            </header>
					            <div class="panel-body" >
					            	<table class="table table-striped table-hover table-bordered" >
		                            	<thead>
	                                        <tr>
	                                            <th style="width: 25%">Code</th>
	                                            <th style="width: 35%">Description</th>
	                                            <th style="width: 20%">Cred. Units</th>
	                                            <th style="width: 20%">Grade</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="subjectBody">   
	                                   		 
	                                    </tbody>
		                            </table>
									<a class="btn btn-success addItemEdit" href="javascript:;"><i class="fa fa fa-plus"></i></a>									<!--
									<div class="col-lg-12">
							            Subject
						                <select name="country" class="multi-select" multiple="" id="selSubject" >
						                    ${subject}
						                </select>
					           		</div>
					           		-->
					            </div>
					        </section>
                       	</div>
                    </div>
	                <div class="modal-footer">
	                	 <button data-dismiss="modal" class="btn btn-default" id="updatecloseBtn" type="button"><u>C</u>lose</button>
	                     <button class="btn btn-success " id="EnrollBtn" type="button"><u>E</u>nroll</button>	                
	                </div>
	            </div>
	       </div>
	    </div>
	        
	    </jsp:body>


</t:Registrar>
