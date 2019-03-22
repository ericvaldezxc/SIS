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
	
	String tablebody = "";

	Statement stmnt = conn.createStatement();
	ResultSet rs = stmnt.executeQuery("Select * from r_scholarship");
		while(rs.next()){
			
			tablebody += "<tr><td>" + rs.getString("Scholarship_Code")+ "</td><td>"+rs.getString("Scholarship_Description")+"</td><td>"+rs.getString("Scholarship_Percentage")+"%</td><td>"; 
			if(rs.getString("Scholarship_Display_Status").equals("Active") )
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit' title='Edit Profile'><i class='fa fa-edit'></i></a> <a class='btn btn-info scholars' data-toggle='modal' href='#scholarship' title='Scholars'><i class='fa fa-upload'></i></a> <a class='btn btn-warning scholarhistory' data-toggle='modal' href='#scholarshiphistory' title='Transaction History'><i class='fa fa-book'></i></a> <a class='btn genex' style='background-color:#33cc33;color:white' title='Generate Excel' ><i class='fa fa-th-list'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	pageContext.setAttribute("tablebody", tablebody);
	Dropdowns drp = new Dropdowns();
	pageContext.setAttribute("acadyearDrp", drp.fillacadyearDrp2());
	pageContext.setAttribute("semesterDrp", drp.fillsemesterDrp());


%>    

<t:Registrar title="Scholarship" from="Scholarship" to="">

	<jsp:attribute name="myscript">      
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
	
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$('#addScholarshipBtn').click(function(){
					 var codeTxt = $('#codeTxt').val();
					 var descTxt = $('#descTxt').val();
					 var discountTxt = $('#discountTxt').val();
					

					
	                swal({
	                    title: "Are you sure?",
	                    text: "The record will be save and will be use for further transaction",
	                    type: "warning",
	                    showCancelButton: true,
	                    confirmButtonColor: '#228B22',
	                    confirmButtonText: 'Yes!',
	                    cancelButtonText: "No!",
	                    closeOnConfirm: false,
	                    closeOnCancel: false
	                },
	                function (isConfirm) {
	                    if (isConfirm) {
		             		$.ajax({
		    					type:'POST',
		    					data:{code: codeTxt, desc: descTxt, discount: discountTxt},
		    					url:'Controller/Registrar/Scholarship/Scholarship',
		    					success: function(result){
		    						 swal("Record Added!", "The data is successfully added!", "success");
		                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center><a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
		                             var nRow = oTable.fnGetNodes(aiNew[0]);
		                             document.getElementById("form-data").reset();
		                             $("#addcloseBtn").click();
		                             
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
					
				})
				
				$('#editable-sample').on('click','a.genex',function(){
					var wb = XLSX.utils.book_new();
		             wb.Props = {
		                     Title: "Student Grades",
		                     Subject: "Grades",
		                     Author: "EKPV",
		                     CreatedDate: new Date(2018,08,24)
		             };
		             wb.SheetNames.push("Student Grades");
		             
	            	 var code = $(this).closest('tr').children('td:eq(0)').text()
	            	 var desc = $(this).closest('tr').children('td:eq(1)').text()
	            	 $.ajax({
						type:'POST',
	 					data:{scholar:code},
						url:'Controller/Registrar/Scholarship/GetStudent',
						success: function(result){
							var item = JSON.parse(result);
							console.log(item)
							var ws_data = item;
							var ws = XLSX.utils.aoa_to_sheet(ws_data);
					        wb.Sheets["Student Grades"] = ws;
					        var wbout = XLSX.write(wb, {bookType:'csv',  type: 'binary'});
					        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), code+'.csv');
						},
	                    error: function (response) {
	                        swal("Error encountered while adding data"+response, "Please try again", "error");
	                    }
					});
				})
				
				
	             function s2ab(s) {
	       
	                     var buf = new ArrayBuffer(s.length);
	                     var view = new Uint8Array(buf);
	                     for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
	                     return buf;
	                     
	             }
             
				
				var latscode = ''
				$('#editable-sample').on('click','a.scholars',function(){
					var table = $('#studentscholarship').DataTable();
					jQuery(table.fnGetNodes()).each(function (index,elem) {
	                	table.fnDeleteRow(0);
	                });
					latscode = $(this).closest('tr').children('td:eq(0)').text()
					//alert(latscode)					
				})
				$('#editable-sample').on('click','a.scholarhistory',function(){
					var table = $('#paymenthistory').DataTable();
					jQuery(table.fnGetNodes()).each(function (index,elem) {
	                	table.fnDeleteRow(0);
	                });
					scholarcode = $(this).closest('tr').children('td:eq(0)').text()
					//alert(scholarcode)					
				})
	    		
	    		var oTable = $('#studentscholarship').dataTable({
	                 "aLengthMenu": [
	                     [5, 15, 20, -1],
	                     [5, 15, 20, "All"] // change per page values here
	                 ],
	                 // set the initial value
	                 "iDisplayLength": 5,
	                 "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
	                 "sPaginationType": "bootstrap",
	                 "oLanguage": {
	                     "sLengthMenu": "_MENU_ records per page",
	                     "oPaginate": {
	                         "sPrevious": "Prev",
	                         "sNext": "Next"
	                     }
	                 },
	                 "columnDefs": [
	                     { "bSortable": false, "aTargets": [ 0 ] }
	                 ], 
	             });

	             jQuery('#studentscholarship_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
	             jQuery('#studentscholarship_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown
	             
	             var latscode = ''
 			
 	    		
 	    		var oTable = $('#paymenthistory').dataTable({
 	                 "aLengthMenu": [
 	                     [5, 15, 20, -1],
 	                     [5, 15, 20, "All"] // change per page values here
 	                 ],
 	                 // set the initial value
 	                 "iDisplayLength": 5,
 	                 "sDom": "<'row'<'col-lg-6'l><'col-lg-6'f>r>t<'row'<'col-lg-6'i><'col-lg-6'p>>",
 	                 "sPaginationType": "bootstrap",
 	                 "oLanguage": {
 	                     "sLengthMenu": "_MENU_ records per page",
 	                     "oPaginate": {
 	                         "sPrevious": "Prev",
 	                         "sNext": "Next"
 	                     }
 	                 },
 	                 "columnDefs": [
 	                     { "bSortable": false, "aTargets": [ 0 ] }
 	                 ], 
 	             });

 	             jQuery('#paymenthistory_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
 	             jQuery('#paymenthistory_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown
	             
				
				 $('#totalAmount').hide()
	             $('#importBtn').on('change', function() {
						var table = $('#studentscholarship').DataTable();
						jQuery(table.fnGetNodes()).each(function (index,elem) {
		                	table.fnDeleteRow(0);
		                });
						$('#totalAmount').slideDown()
						
					 	handleFiles(this.files)

						
				})
				
				
					
				function handleFiles(files) {
		    		if (window.FileReader) {
		    		   getAsText(files[0]);
		    		}else {
		    			alert('FileReader are not supported in this browser.');
		    		}
    			}
				

	    		function getAsText(fileToRead) {
	    		  var reader = new FileReader();
	    		  reader.readAsText(fileToRead);
	    		  reader.onload = loadHandler;
	    		  reader.onerror = errorHandler;
	    		}

	    		function loadHandler(event) {
	    		  var csv = event.target.result;
	    		  processData(csv);
	    		}
	    		function errorHandler(evt) {
	      		  if(evt.target.error.name == "NotReadableError") {
	      		      alert("Cannot read file!");
	      		  }
	      		}
	    		
	    		var student = []
	    		var studentnumber = []
	    		var totalamounttopay = "0";
	    		function processData(csv) {
	    			studentnumber = []
	    			var table = $('#studentscholarship').DataTable();
	    		    var allTextLines = csv.split(/\r\n|\n/);
	    		    console.log(allTextLines)
	    		    for (var i=1; i<allTextLines.length; i++) {
	    		        var row = allTextLines[i].split(';');		
	    		        for (var j=0; j<row.length; j++) {
	    			        var col = row[j].split(',');
	    			        if(col[0] != "" && col[2] != undefined){
	    			        	//var aiNew = table.fnAddData([col[0],col[1].replace('"','') + col[2].replace('"',''),col[3]]);
	    	                    //var nRow = table.fnGetNodes(aiNew[0]);
	    	                    studentnumber.push(col[0])
	    				        student.push({number:col[0],name:col[1].replace('"','') + col[2].replace('"',''),section:col[3]} );
	    			        	
	    			        }
	    		        }
	    		    }
	    		    console.log(studentnumber)
	    		    
	    		    $.ajax({
     					type:'POST',
     					data:{student: JSON.stringify(studentnumber)},
     					url:'Controller/Scholarship/Scholarship/GetStudentPayment',
     					success: function(result){
     						var item =  $.parseJSON(result)
     						totalamounttopay = "0"
     						$.each(item, function (key, val) {
     							totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
     							
         						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount]);
        	                    var nRow = table.fnGetNodes(aiNew[0]);
        	                    $.ajax({
    								type:'POST',
    								data:{Amount: totalamounttopay},
    								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
    								success: function(result2){
    									totalamounttopay = result2
    									console.log(result2)
    									$('#totalAmount').html("Total Amount: "+result2)
    								},
    			                    error: function (response) {
    			                        swal("Error encountered while accessing the data", "Please try again", "error");
    			                    }
    							});
     						})
//     						
     					},
                         error: function (response) {
                             swal("Error encountered while adding data", "Please try again", "error");
                         }
     				});
	    		    

	    		}
	    		$('#uploadstudentScholarshipBtn').click(function(){
	        		 swal({
	                     title: "Are you sure?",
	                     text: "The record will be save and will be use for further transaction",
	                     type: "warning",
	                     showCancelButton: true,
	                     confirmButtonColor: '#228B22',
	                     confirmButtonText: 'Yes!',
	                     cancelButtonText: "No!",
	                     closeOnConfirm: false,
	                     closeOnCancel: false
	                 },
	                 function (isConfirm) {
	                     if (isConfirm) {
	                 		$.ajax({
	         					type:'POST',
	         					data:{scholarship:latscode,student: JSON.stringify(student)},
	         					url:'Controller/Scholarship/Scholarship/UploadStudent',
	         					success: function(result){
//	         						$('#lblimport').slideUp();
	 	    						 swal("Record Added!", "The data is successfully added!", "success");
	         					},
	                             error: function (response) {
	                                 swal("Error encountered while adding data", "Please try again", "error");
	                             }
	         				});

	                     } else {

	                         swal("Cancelled", "The transaction is cancelled", "error");
	                         $("#editable-sample_new").click();
	                     }

	                 });
	    		})
	    		var scholarcode = ""
	    		$("select#acadyearDrp").select2({width: '100%' });
	    		$("select#semesterDrp").select2({width: '100%' });
	    		$("#semesterDrp").on('change',function(){
	    			var sem = $('#semesterDrp option:selected').val()
	    			var acadyear = $('#acadyearDrp option:selected').val()
	    			if(sem != 'default' && sem != 'default'){
	    				var table = $('#paymenthistory').DataTable();
	    				jQuery(table.fnGetNodes()).each(function (index,elem) {
		                	table.fnDeleteRow(0);
		                })
	    				$.ajax({
         					type:'POST',
         					data:{scholar:scholarcode,semester:sem,acadyear:acadyear},
         					url:'Controller/Scholarship/Scholarship/GetPaymentHistory',
         					success: function(result){
         						var item =  $.parseJSON(result)
         						totalamounttopay = "0"
            					$.each(item, function (key, val) {
            	                    
            						totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
             						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount,val.date]);
            	                    var nRow = table.fnGetNodes(aiNew[0]);

         						})
         						$.ajax({
     								type:'POST',
     								data:{Amount: totalamounttopay},
     								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
     								success: function(result2){
     									totalamounttopay = result2
     									console.log(result2)
     									$('#paymenttotalAmount').html("Total Amount: "+result2)
     								},
     			                    error: function (response) {
     			                        swal("Error encountered while accessing the data", "Please try again", "error");
     			                    }
     							});
         						
         					},
                             error: function (response) {
                                 swal("Error encountered while adding data", "Please try again", "error");
                             }
         				});
	    			}
	    			
	    		})
	    		$('#printList').click(function(){
	    			var items = [];
                   	var code = $('#drporg option:selected').val();
                  	var rows = $('#paymenthistory').dataTable()
                       .$('tr', {
                           "filter": "applied"
                       });
                  	var studbody = ""
	                $(rows).each(function(index, el) {
	                	var studnum = $(this).closest('tr').children('td:eq(0)').text();
	                	var name = $(this).closest('tr').children('td:eq(1)').text();
	                	var cas = $(this).closest('tr').children('td:eq(2)').text();
	                	var amount = $(this).closest('tr').children('td:eq(3)').text();
	                	var date = $(this).closest('tr').children('td:eq(4)').text();
	                    items.push({studnum:studnum,name:name,cas:cas,amount:amount,date:date});
	                    studbody += "<tr><td>"+studnum+"</td><td>"+name+"</td><td>"+cas+"</td><td>"+amount+"</td><td>"+date+"</td></tr>"
	                    
	
	                })
	                console.log(items)
	               
	                
	                
	                var pdf = new jsPDF('p', 'pt', 'letter');
	                var breaker = '_______________________________________________________________________'

	                pdf.setFontType("normal");
					pdf.setFontSize(14.5);
					pdf.text(15,15,breaker)

					pdf.setFontType("bold");
					pdf.setFontSize(13);
					pdf.text(15,40,"Quezon City Polytechnic University")

					pdf.setFontType("italic");
					pdf.setFontSize(7);
					var addre = pdf.splitTextToSize("QCPU Technical & Vocational Building, 673 Quirino Hway, Novaliches, Quezon City, 1116 Metro Manila", 230);
					pdf.text(15,55,addre)
					
					pdf.setFontType("normal");
					pdf.setFontSize(14.5);
					pdf.text(15,70,breaker)
					
					pdf.setFontType("italic");
					pdf.setFontSize(14);
					pdf.text(270,110,"Scholarship Payment")
					
					
					specialElementHandlers = {
						'#bypassme': function(element, renderer){
							return true
						}
					}
					
					studbody = "<thead><th>Student Number</th><th>Student Name</th><th>Course and Section</th><th>Curriculum</th><th>Status</th></thead><tbody>"+studbody+"</tbody>"
					$('#myHiddenTable').html(studbody)
					console.log(studbody)
					var res = pdf.autoTableHtmlToJson(document.getElementById("myHiddenTable"),true);
				    pdf.autoTable(res.columns, res.data, {
				      startY: 170
				    });

				   	
					
	                
	                
	                var myImage = new Image();
					myImage.src = "http://"+window.location.hostname+":"+window.location.port+"/SIS/Assets/images/PUPLogo.png";
					myImage.onload = function(){
						pdf.addImage(myImage , 'png', 520, 20, 50, 50);
						 var uri = pdf.output('dataurlstring');
				  	   	 openDataUriWindow(uri);
				  	};
					
	    			
	    		})
	    		
	    		$("#acadyearDrp").on('change',function(){
	    			var sem = $('#semesterDrp option:selected').val()
	    			var acadyear = $('#acadyearDrp option:selected').val()
	    			if(sem != 'default' && sem != 'default'){
	    				$.ajax({
         					type:'POST',
         					data:{scholar:scholarcode,semester:sem,acadyear:acadyear},
         					url:'Controller/Scholarship/Scholarship/GetPaymentHistory',
         					success: function(result){
         						var item =  $.parseJSON(result)
         						totalamounttopay = "0"
                					$.each(item, function (key, val) {
                						totalamounttopay = parseFloat(totalamounttopay)  +  parseFloat(val.amount.replace(',',''))
                 						var aiNew = table.fnAddData([val.studnum,val.name,val.section,val.amount,val.date]);
                	                    var nRow = table.fnGetNodes(aiNew[0]);
                	                    
             						})
             						$.ajax({
         								type:'POST',
         								data:{Amount: totalamounttopay},
         								url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
         								success: function(result2){
         									totalamounttopay = result2
         									console.log(result2)
         									$('#paymenttotalAmount').html("Total Amount: "+result2)
         								},
         			                    error: function (response) {
         			                        swal("Error encountered while accessing the data", "Please try again", "error");
         			                    }
         							});
        	                   

         					},
                             error: function (response) {
                                 swal("Error encountered while adding data", "Please try again", "error");
                             }
         				});
	    			}
	    			
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
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script src="../Assets/js/html2canvas.js"></script>
		<script src="../Assets/js/jspdf.js"></script>
		<script src="../Assets/js/jspdf.debug.js"></script>
		<script src="../Assets/js/jspdf.plugin.autotable.js"></script>
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
		
		<script lang="javascript" src="../Assets/js/xlsx.full.min.js"></script>
		<script lang="javascript" src="../Assets/js/FileSaver.min.js"></script>
		
    </jsp:attribute>    
    
    <jsp:body>
    	<script src="../Assets/Registrar/Pre-Enrollment/AcademicYear.js"></script>
    
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
                                        <!--  <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
                                        -->
                                    </div>
                                    <div class="space15"></div>
                                    <table class="table table-striped table-hover table-bordered" id="editable-sample">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 200px">Code</th>
	                                            <th style="width: 100px">Description</th>
	                                            <th style="width: 100px">Discount</th>
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
         <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="FeeAdd" class="modal fade">
	        <div class="modal-dialog" style="width:55%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Add Scholarhip</h4>
	                </div>
	                <div class="modal-body">
	                    <form method="post" id="form-data">
	                        <div class="row" style="padding-left:15px;padding-top:10px">
	                        	<div class="col-lg-12">
	                        		<div class="col-lg-6">
		                                Code <input type="text" class="form-control" placeholder="ex. SYDP" id="codeTxt" >
		                            </div>
		                            <div class="col-lg-6">
		                                Discount in percentage<input type="number" min="0.00" max="100.00" step="0.01" class="form-control" placeholder="ex. 100" id="discountTxt">
		                            </div>
		                            
		                        	<div class="col-lg-12" style="padding-top:10px">
		                                Description<textarea class="form-control" placeholder="ex. Scholarship and Youth Development Program" rows="3" style="margin: 0px 202.5px 0px 0px;resize:none" id="descTxt"></textarea>
		                            </div>		                        	
	                        	</div>
	                        </div>
	                    </form>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="addcloseBtn" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="addScholarshipBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="scholarship" class="modal fade">
	        <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Scholarhip</h4>
	                </div>
	                <div class="modal-body">
	                	<div class="row">
	                		<div class="col-lg-12">
	                			<label class="btn btn-info" id="totalAmount"  >
					            	Total Amount:
						        </label>
	                			<div class="adv-table editable-table ">
                                    <table class="table table-striped table-hover table-bordered" id="studentscholarship">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 200px">Student Number</th>
	                                            <th style="width: 100px">Name</th>
	                                            <th style="width: 100px">Section</th>
	                                            <th style="width: 100px">Amount</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>    
	                                    </tbody>
                                    </table>
                                </div>
	                		
	                			<label class="btn btn-info" id="lblimport" for="importBtn" >
					            	<input id="importBtn" type="file" accept=".csv" style="display:none;">
					                <i class="fa fa-upload"></i> Import
						        </label>
						        
	                		</div>
	                	</div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="uploadstudentScholarshipBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>	
	     <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="scholarshiphistory" class="modal fade">
	        <div class="modal-dialog" style="width:60%">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Scholarhip Payment History</h4>
	                </div>
	                <div class="modal-body">
	                	<div class="row">
			            	<div class="col-lg-6" >
		                    	Academic Year
		                    	<br/>
		                        <select class="populate " id="acadyearDrp">
			                  	    <option value="default" selected="selected" disabled="disabled" >Select a Academic Year</option>                            	       	
		                  			${acadyearDrp}      	
		                		</select>
			                </div>
			            	<div class="col-lg-6">
		                    	Semester
		                    	<br/>
		                        <select class="populate " id="semesterDrp">
			                  	    <option value="default" selected="selected" disabled="disabled" >Select a Semester</option>                            	       	
		                  			${semesterDrp}      	
		                		</select>
		                    </div>
		                      
                            <table class="hidden" id="myHiddenTable">
                            </table>
		                    
	                		<div class="col-lg-12">
	                			
	                			<div class="adv-table editable-table ">
                                    <table class="table table-striped table-hover table-bordered" id="paymenthistory">
	                                    <thead>
	                                        <tr>
	                                            <th style="width: 200px">Student Number</th>
	                                            <th style="width: 100px">Name</th>
	                                            <th style="width: 100px">Section</th>
	                                            <th style="width: 100px">Amount</th>
	                                            <th style="width: 100px">Date</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody>    
	                                    </tbody>
                                    </table>
                                </div>
                                <a class="btn btn-info" id="paymenttotalAmount"  >
					            	Total Amount:
						        </a>
						        <a class="btn btn-info" id="printList" style="float:right;background-color:#33cc33;color:white" ><i class="fa fa-print"></i></a>
						        
						        
	                		</div>
	                	</div>
	                </div>
	                <div class="modal-footer">
	                    <button data-dismiss="modal" class="btn btn-default" id="" type="button"><u>C</u>lose</button>
	                    <button class="btn btn-success " id="uploadstudentScholarshipBtn" type="button"><u>S</u>ave</button>
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    </jsp:body>


</t:Registrar>
