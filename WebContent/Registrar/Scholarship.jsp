<%@page import="java.sql.*"%>
<%@page import="connection.DBConfiguration" %>
<%@page import="configuration.EncryptandDecrypt" %>
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
				tablebody += "<center> <a class='btn btn-success edit' data-toggle='modal' href='#FeeEdit'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a><center></td></tr>";
			else
				tablebody += "<center><a class='btn btn-info retrieve' href='javascript:;'><i class='fa fa-rotate-left'></i></a><center></td></tr>";
			
		}
	pageContext.setAttribute("tablebody", tablebody);


%>    

<t:Registrar title="Scholarship" from="Scholarship" to="">

	<jsp:attribute name="myscript">      
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
				
				
				
			});
		</script>
    </jsp:attribute>
    
	<jsp:attribute name="customImportedScript">      
		<script type="text/javascript" src="../Assets/js/jquery-1.8.3.min.js"></script>
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
                                        <div class="btn-group pull-right">
                                            <button class="btn btn-default " id="btnprint">Print <i class="fa fa-print"></i></button>
                                        </div>
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
	        <div class="modal-dialog" style="width:700px">
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

	    </jsp:body>


</t:Registrar>
