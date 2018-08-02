var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var unitTxt = '';
var latcode = '';
var firstNameTxt =  '';
var middleNameTxt = '';
var lastNameTxt = '';
var dobTxt = '';
var pobTxt = '';
var genderDrp = '';
var civilDrp = '';
var addressTxt = '';
var conTxt = '';
var emailTxt = '';
var latid='';

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
                }
            });

            jQuery('#editable-sample_wrapper .dataTables_filter input').addClass("form-control medium"); // modify table search input
            jQuery('#editable-sample_wrapper .dataTables_length select').addClass("form-control xsmall"); // modify table per page dropdown

            var nEditing = null;

            $('#editable-sample_new').click(function (e) {

            });
            $('#CourseDrp').on('change',function(){
            	totunit = 0
				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')

            	var curcode = $(this).val();
				$('#feeDiv').addClass('hidden')

            	fillsection();
            	
            });
            $('#YearDrp').on('change',function(){
            	totunit = 0
				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
				$('#feeDiv').addClass('hidden')

            	fillsection();
            	
            });
            $('#SectionDrp').on('change',function(){
            	totunit = 0
				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
				$('#feeDiv').addClass('hidden')

            	fillcurriculum();
            	
            	
            });
            var totunit = 0;
            function fillcurriculum(){
            	if( $('#SectionDrp option:selected').val() != 'default' && $('#CourseDrp option:selected').val() != 'default'){
            		var curcode =  $('#SectionDrp option:selected').data('curriculum') 
            		$.ajax({
    					type:'POST',
    					data:{curcode:curcode},
    					url:'Controller/Admin/Student/AdmissionCurriculumItemViewController',
    					success: function(result){
    						var item = $.parseJSON(result)
							$('#mainBody').html('')
    						$.each(item, function (key, val) {
    							$('#mainBody').append('<tr><td style="font-size:15px" ><center class="codeText">'+val.code+'</center></td><td style="font-size:15px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:15px" ><center class="unitText">'+val.units+'</center></td><td><center><input type="checkbox" class="form-control ckbox" id="ckbox" style="width:20px;height:20px;" checked="checked"></center></td></tr>')
    							totunit += parseInt(val.units);
                            });
    						if($('#mainBody').html() == ''){
    							$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
    							$('#feeDiv').addClass('hidden')
    							
    						}
    						else{
    							$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;" colspan="4" id="totunit">Total: '+totunit+' Units'+'</td></tr>')
    							$('#feeDiv').removeClass('hidden')
    							$('#feeTxt').html($('#SectionDrp option:selected').data("fee"))
    						}
    					},
                        error: function (response) {
                            swal("Error encountered while adding data"+response, "Please try again", "error");
                        }
    				});
            	}
            	
            }
            
            
            
            function fillsection(){
            	var course = $('#CourseDrp').val();
            	var year = $('#YearDrp').val();
            	if($('#CourseDrp option:selected').val() != 'default' ){

        			$.ajax({
    					type:'POST',
    					data:{course:course,year:year},
    					url:'Controller/Admin/Student/AdmissionSectionViewController',
    					success: function(result){
    		            	var section = '<option value="1" selected="selected" disabled="disabled">Select a Section</option>';
    						var item = $.parseJSON(result);
    						$.each(item, function (key, val) {
    							section =  section + "<option value='"+val.section+"' data-fee='"+val.fee+"' data-curriculum='"+val.curcode+"'>"+val.section+"</option>";
                            });
    						
    						$('#SectionDrp').html(section)
    					},
                        error: function (response) {
                            swal("Error encountered while adding data"+response, "Please try again", "error");
                        }
    				});       
            		
            	}
            	
            }

            $('#addBtn').click(function(e){
            	e.preventDefault();
            	firstNameTxt = $('#firstNameTxt').val();
            	middleNameTxt = $('#middleNameTxt').val();
            	lastNameTxt = $('#lastNameTxt').val();
            	dobTxt = $('#dobTxt').val();
            	pobTxt = $('#pobTxt').val();
            	genderDrp = $('#genderDrp').val();
            	civilDrp = $('#civilDrp').val();
            	addressTxt = $('#addressTxt').val();
            	conTxt = $('#conTxt').val();
            	emailTxt = $('#emailTxt').val();

				
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
        					data:{
        						firstNameTxt: firstNameTxt, 
        						middleNameTxt: middleNameTxt, 
        						lastNameTxt: lastNameTxt, 
        						dobTxt: dobTxt, 
        						pobTxt: pobTxt, 
        						genderDrp: genderDrp, 
        						civilDrp: civilDrp, 
        						addressTxt: addressTxt,
        						latcode:latcode,
        						conTxt:conTxt,
        						emailTxt:emailTxt,
        						type:"Insert"
        						
        						},
        					url:'Controller/Admin/Student/AdmissionController',
        					success: function(result){
	    						 swal("Record Added!", "The data is successfully added!", "success");
	                             var aiNew = oTable.fnAddData([codeTxt, descTxt, "<center><a class='btn btn-success edit' data-toggle='modal' href='#CourseEdit' ><i class='fa fa-edit'></i></a> <a class='btn btn-danger delete' href='javascript:;'><i class='fa fa-rotate-right'></i></a></center>"]);
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
            $('#editable-sample').on('click','a.admission', function (e) {
                e.preventDefault();
                
                $('#studentName').html($(this).closest('tr').children('td:first').text());
                latid = $(this).data('studentid');
                $('#studentStatus').html($(this).closest('tr').children('td:first').next().text());
                
                
                
            
            });
            $('#mainBody').on('change','.ckbox',function(){
            	totunit = 0;
            	$('#mainBody tr').each(function(){
            		if($(this).find('.unitText').html() != undefined){
            			if($(this).find('input:checkbox').prop("checked") == true)
            				totunit += parseInt($(this).find('.unitText').html())
            		}
            		
            	});
            	$('#totunit').html('Total: ' + totunit + ' Units')
            });
            $('#EnrollBtn').on('click',function(){
            	var CourseDrp = $('#CourseDrp option:selected').val();
                var YearDrp = $('#YearDrp option:selected').val();
                var SectionDrp = $('#SectionDrp option:selected').val();
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
        					data:{
        						studentid: latid, 
        						CourseDrp:CourseDrp,
        						YearDrp: YearDrp,        
        						SectionDrp:SectionDrp
        						},
        					url:'Controller/Admin/Student/AdmissionEnrollController',
        					success: function(result){
        						$('#mainBody tr').each(function(key,val){
        							var sub = $(this).find('.codeText').html();
        							var taken = $(this).find('input:checkbox').prop("checked");
            						$.ajax({
                    					type:'POST',
                    					data:{
                    							sub:sub,
                    							taken:taken
                    						
                    						},
                    					url:'Controller/Admin/Student/AdmissionTakenSubjectController',
                    					success: function(result2){
                    						
        	                             
                    					},
                                        error: function (response2) {
                                            swal("Error encountered while adding data", "Please try again", "error");
                                            $("#editable-sample_new").click();
                                        }
                    				});
            						
            						
        							
        						});
        						swal({
                                    title: "Record Enrolled!"
                                    , text: "The data is successfully enrolled!"
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
            
            
        }
    
    

    };

}();
