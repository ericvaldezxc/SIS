var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var campus = '';
var unitTxt = '';
var latcode = '';
var importBtn = ''


var EditableTable = function () {

    return {

        //main function to initiate the module
        init: function () {
            function restoreRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);

                for (var i = 0, iLen = jqTds.length; i < iLen; i++) {
                    oTable.fnUpdate(aData[i], nRow, i, false);
                }

                oTable.fnDraw();

            }

            function editRow(oTable, nRow) {
                var aData = oTable.fnGetData(nRow);
                var jqTds = $('>td', nRow);
                //.substring(aData[0].indexOf("*") + 5, aData[0].length)

                jqTds[0].innerHTML = '<input type="text" class="form-control small " value="' + aData[0] + '" disabled style="width:100%" >';
                jqTds[1].innerHTML = '<input type="text" class="form-control small" value="' + aData[1] + '" style="width:100%">';
                jqTds[2].innerHTML = '<input type="text" class="form-control small" value="' + aData[2] + '" style="width:100%">';
                jqTds[3].innerHTML = '<center><a class="btn btn-success  edit" href=""><i class="fa fa-save"></i></a> <a class="btn btn-danger cancel" href=""><i class="fa fa-ban"></i></a></center>';


            }

            function saveRow(oTable, nRow) {
                var jqInputs = $('input', nRow);

                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate(jqInputs[2].value, nRow, 2, false);
                oTable.fnUpdate("<center><a class='btn btn-success edit' href='javascript:;'><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", nRow, 3, false);
                oTable.fnDraw();


            }

            function cancelEditRow(oTable, nRow) {
                var jqInputs = $('input', nRow);
                oTable.fnUpdate(jqInputs[0].value, nRow, 0, false);
                oTable.fnUpdate(jqInputs[1].value, nRow, 1, false);
                oTable.fnUpdate('<a class="btn btn-success edit" href="">Edit</a>', nRow, 2, false);
                oTable.fnDraw();
            }

            var oTable = $('#editable-sample').dataTable({
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

            jQuery('#editable-sample_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
            jQuery('#editable-sample_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown
            $('#acadyearDrp').change(function (e) {
            	fillsubject()
                
            });
            $('#semesterDrp').change(function (e) {
            	fillsubject()
                
            });
            function fillsubject(){
            	var sem = $('#semesterDrp').val()
            	var year = $('#acadyearDrp').val()
            	
            	$.ajax({
 					type:'POST',
 					data:{sem:sem,year:year},
 					url:'Controller/Faculty/Grading/GetSubject',
 					success: function(result){
 						var item = $.parseJSON(result)
						var subdrp = '<option value="default" selected="selected" disabled="disabled" >Select a Subject</option>'
						$('#subjectDrp').select2("val","default")
 						$.each(item, function (key, val) { 							
 							subdrp += '<option value="'+val.code+'" >'+val.desc+'</option>'
                        });
 						
 						$('#subjectDrp').html(subdrp)
 						    						
 					},
                     error: function (response) {
                         swal("Error encountered while adding data"+response, "Please try again", "error");
                     }
 				});
            	
            	
            }
            $('#sectionDrp').change(function (e) {
            	 var section = $(this).val()
                 var subjectDrp = $('#subjectDrp').val()
                 var table = $('#editable-sample').DataTable();
                 jQuery(table.fnGetNodes()).each(function (index,elem) {
                 	oTable.fnDeleteRow(0);
                 });
                 
                 if(section!='default'){
                	 $.ajax({
      					type:'POST',
      					data:{subjectDrp:subjectDrp,section:section},
      					url:'Controller/Faculty/Grading/GetStudents',
      					success: function(result){
      						var item = $.parseJSON(result)
      						var grade = ''
      						var finalize = 0
      						$.each(item, function (key, val) {
      							if(val.grade == 0)
      								grade = ''
      							else{
      								grade = val.grade
      								
      							}
      							
      								
                                  var aiNew = oTable.fnAddData([val.number ,val.name ,val.section , grade,val.finalgrade]);
                                  var nRow = oTable.fnGetNodes(aiNew[0]);
                              });
      						
      						    						
      					},
                          error: function (response) {
                              swal("Error encountered while adding data"+response, "Please try again", "error");
                          }
      				});
                 }
                 
                 
             });
            $('#subjectDrp').change(function (e) {
                var subjectDrp = $(this).val()
                var section = $('#sectionDrp').val()
            	$('#saveBtn').addClass('hidden')
//                alert(subjectDrp)
                var table = $('#editable-sample').DataTable();
                jQuery(table.fnGetNodes()).each(function (index,elem) {
                	oTable.fnDeleteRow(0);
                });
                
                
                if(section!='default'){
                	$.ajax({
     					type:'POST',
     					data:{subjectDrp:subjectDrp,section:section},
     					url:'Controller/Faculty/Grading/GetStudents',
     					success: function(result){
     						var item = $.parseJSON(result)
     						var grade = ''
     						var finalize = 0
     						$.each(item, function (key, val) {
     							if(val.grade == 0)
     								grade = ''
     							else{
     								grade = val.grade
     								
     							}
     							if(val.grade != 'Not S')
     								finalize = 1
     								
                                 var aiNew = oTable.fnAddData([val.number ,val.name ,val.section , grade,val.finalgrade]);
                                 var nRow = oTable.fnGetNodes(aiNew[0]);
                             });
     						if(finalize == 1)
     							$('#lblimport').slideUp();
     						else
     							$('#lblimport').slideDown();
     						    						
     					},
                         error: function (response) {
                             swal("Error encountered while adding data"+response, "Please try again", "error");
                         }
     				});
                }
                
                
                
                $.ajax({
					type:'POST',
					data:{subjectDrp:subjectDrp},
					url:'Controller/Faculty/Grading/GetSection',
					success: function(result){
						var item = $.parseJSON(result)
//						var sectionDrp = '<option value="default" selected="selected">All</option>'
						var sectionDrp = '<option value="default" disabled="disabled" selected="selected">Select a Section</option>'
						$('#sectionDrp').select2("val","default")
 						$.each(item, function (key, val) { 							
 							sectionDrp += '<option value="'+val.section+'" >'+val.section+'</option>'
                        });
 						
 						$('#sectionDrp').html(sectionDrp)
						    						
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
                if($(this).val == 'default'){
            		$('#excelBtn').slideUp()
            	}
            	else{
            		$('#excelBtn').slideDown()
            		
            	}
                
            });
            
            
            
            var student = [];
        	var finstudent = [];
        	var studentList = [];
        	

        	 $("#importBtn").on('change', function() {
             	$('#saveBtn').removeClass('hidden')
        		 handleFiles(this.files)
        	 });
        	 

             function s2ab(s) {
       
                     var buf = new ArrayBuffer(s.length);
                     var view = new Uint8Array(buf);
                     for (var i=0; i<s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
                     return buf;
                     
             }
             
             $("#exportBtn").click(function(){
            	 var wb = XLSX.utils.book_new();
	             wb.Props = {
	                     Title: "Student Grades",
	                     Subject: "Grades",
	                     Author: "EKPV",
	                     CreatedDate: new Date(2018,08,24)
	             };
	             wb.SheetNames.push("Student Grades");
	             
            	 var subjectDrp = $('#subjectDrp').val()
            	 var section = $('#sectionDrp').val()
            	 $.ajax({
					type:'POST',
					data:{subjectDrp:subjectDrp,section:section},
					url:'Controller/Faculty/Grading/ExportTable',
					success: function(result){
						var item = JSON.parse(result);
						console.log(item)
						var ws_data = item;
						var ws = XLSX.utils.aoa_to_sheet(ws_data);
				        wb.Sheets["Student Grades"] = ws;
				        var wbout = XLSX.write(wb, {bookType:'csv',  type: 'binary'});
				        saveAs(new Blob([s2ab(wbout)],{type:"application/octet-stream"}), subjectDrp+'-'+section+'.csv');
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
            	 
	           
	            
	          
            	 
             });
   
        	 
        	 $("#saveBtn").on('click', function() {
        		 var subjectDrp = $('#subjectDrp').val()
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
         					data:{subjectDrp:subjectDrp,student: JSON.stringify(student)},
         					url:'Controller/Faculty/Grading/UploadGrades',
         					success: function(result){
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
        	 });
        	
        	 
        	 
        	function handleFiles(files) {
	    		 if (window.FileReader) {
	    		   getAsText(files[0]);
	    		 } else {
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

    		function processData(csv) {
    		    var allTextLines = csv.split(/\r\n|\n/);
    		    student = []
    		    for (var i=1; i<allTextLines.length; i++) {
    		        var row = allTextLines[i].split(';');		
    		        for (var j=0; j<row.length; j++) {
    			        var col = row[j].split(',');
    			        if(col[0] != ""){
    			        	//alert(col[0])
        			        var name = col[1].substring(1, col[1].length) + col[2].substr(0, col[2].length-1)
    				        student.push({number:col[0],name:name,section:col[3],grade:col[4]} );
    			        	
    			        }
    		        }
    		    }
    		    filltable()
    		    

    		    
    		}
    		
    		function filltable (){
    			var table = $('#editable-sample').DataTable();
                jQuery(table.fnGetNodes()).each(function () {
                    oTable.fnDeleteRow(0);
                });
               
                $(student).each(function(key , val){
                	var gs = ''
                	
//                		alert("jsq"+val.grade)
                	if(val.grade == '' || val.grade == "Not S")
                        gs = 'Not S'
                    else if(parseFloat(val.grade).toFixed(2) <= 3.00)
                		gs = 'P'
                    else if(parseFloat(val.grade).toFixed(2) == 5.00)
                        gs = 'F'
                    else if(val.grade == 'I')
                        gs = 'INC'
                    else
                        gs = 'Not s'
                            
                    if(val.grade != '' && val.grade != "Not S")
                    	var aiNew = oTable.fnAddData([val.number ,val.name ,val.section ,parseFloat(val.grade).toFixed(2) ,gs ]);
                    else
                    	var aiNew = oTable.fnAddData([val.number ,val.name ,val.section, "Not S",gs ]);
                    	
                	var nRow = oTable.fnGetNodes(aiNew[0]);
    				
    			})
    			console.log(student)
    		}

    		function errorHandler(evt) {
    		  if(evt.target.error.name == "NotReadableError") {
    		      alert("Cannot read file!");
    		  }
    		}


    		
    		
            
            
            
            var nEditing = null;

            $('#editable-sample_new').click(function (e) {

            });

            $('#addBtn').click(function(e){
            	e.preventDefault();
				 codeTxt = $('#codeTxt').val();
				 descTxt = $('#descTxt').val();
				 campus =  $('#campusDrp').val();
			
				
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
        					data:{codeTxt: codeTxt, descTxt: descTxt,campus:campus,type:"Insert",latcode:latcode},
        					url:'Controller/Admin/Faculty/RoomController',
        					success: function(result){
	    						 swal("Record Added!", "The data is successfully added!", "success");
	                             var aiNew = oTable.fnAddData([codeTxt, descTxt,campus, "<center><a class='btn btn-success edit' data-toggle='modal' href='#Edit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>", '']);
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
								
			});
            $('#updateBtn').click(function(e){
            	e.preventDefault();
            	codeTxt = $('#codeUpdateTxt').val();
            	unitTxt = $('#unitsTxt').val();				 
            	descTxt = $('#descUpdateTxt').val();

				
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
        					data:{codeTxt: codeTxt, descTxt: descTxt,type:"Update",latcode:latcode,unitTxt:unitTxt},
        					url:'Controller/Admin/Curriculum/SubjectController',
        					success: function(result){
        						 $('#codeTxt').val('') ;
        						 $('#descTxt').val('');
                                 swal({
                                     title: "Record Updated!"
                                     , text: "The data is successfully Added!"
                                     , type: "success"
                                     , confirmButtonColor: '#88A755'
                                     , confirmButtonText: 'Okay'
                                     , closeOnConfirm: false
                                 }, function (isConfirm) {
                                     if (isConfirm) {
                                         window.location.reload();
                                     }
                                 });
	                             
        					},
                            error: function (response) {
                                swal("Error encountered while adding data", "Please try again", "error");
                            }
        				});

                    } else {

                        swal("Cancelled", "The transaction is cancelled", "error");
                    }

                });
								
			});

            $('#editable-sample').on('click',' a.delete', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();;
                var nRow = $(this).parents('tr')[0];


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
                                type: 'post',
                                url: 'Controller/Admin/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Delete",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Deleted!",
                                            text: "The data is successfully deleted!",
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
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });

            $('#editable-sample ').on('click','a.retrieve', function (e) {
                e.preventDefault();

                var getval = $(this).closest('tr').children('td:first').text();
                var nRow = $(this).parents('tr')[0];


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
                                type: 'post',
                                url: 'Controller/Admin/Curriculum/SubjectController',
                                data: {
                                	codeTxt: codeTxt, descTxt: descTxt,type:"Retrieve",latcode:getval
                                },
                                success: function (response) {
                                    swal({

                                            title: "Record Retrieved!",
                                            text: "The data is successfully retrieved!",
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
                                    swal("Error encountered while adding data", "Please try again", "error");
                                }

                            });

                        } else
                            swal("Cancelled", "The transaction is cancelled", "error");

                    });

            });


            $('#editable-sample').on('click','a.cancel', function (e) {
                e.preventDefault();
                if ($(this).attr("data-mode") == "new") {
                    var nRow = $(this).parents('tr')[0];
                    oTable.fnDeleteRow(nRow);
                } else {
                    restoreRow(oTable, nEditing);
                    nEditing = null;
                }
            });



            $('#editable-sample').on('click','a.edit', function (e) {
                e.preventDefault();
                
                var getcode = $(this).closest('tr').children('td:first').text();
                latcode = getcode;
                var getdesc = $(this).closest('tr').children('td:first').next().text();
                var nRow = $(this).parents('tr')[0];
                
        		$('#codeUpdateTxt').val(getcode)
        		$('#descUpdateTxt').val(getdesc)

                
            });
        }

    };

}();
