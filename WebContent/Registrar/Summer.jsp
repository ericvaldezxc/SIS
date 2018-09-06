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
	

//	pageContext.setAttribute("subjectDrp", drp.fillsubjectDrp());
//	pageContext.setAttribute("studentDrp", drp.fillstudentDrp());
	
%>    

<t:Registrar title="Summer Class" from="Summer Class" to="">

	<jsp:attribute name="myscript">      
      	<script>
			$(document).ready(function (){
				EditableTable.init();
				$("select#subDrp").select2({width: '100%'});
				$("select#facDrp").select2({width: '100%'});
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
					    	<div class="col-lg-6">
						    	Faculty
			               		<select class="populate" style="width: 300px" id="facDrp">
						   			<option value="default" selected="selected" disabled="disabled" >Select a Faculty</option>
						   			${facultyDrp}											   				
                                </select>
							</div>
						</div>
                        <div class="row" style="margin-top:10px">
					    	<div class="col-lg-12">
		                		Student 
					        	<select class="multi-select" multiple="" id="studDrp">
					            </select>
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
