var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var unitTxt = '';
var latcode = '';
var subject =''
var lecunit =''
var labunit =''
var credunit =''
var lechrs =''
var type = ''
var labhrs =''
var tuihrs =''

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
            
            $('#editable-sample').on('click','a.prof',function(){
            	var pcode = $(this).closest('tr').children('td:first').text();
            	var pdesc = $(this).closest('tr').children('td:first').next().text();
            	$('#profiletitle').html(pcode + ' - ' + pdesc)
            	$.ajax({
					type:'POST',
					data:{latcode:pcode},
					url:'Controller/Registrar/Curriculum/SubjectProfileViewController',
					success: function(result){
						var item = $.parseJSON(result);
						 $.each(item, function (key, val) {
							 $('#lectunit').html(val.lecunit)
							 $('#labounit').html(val.labunit)
							 $('#credunit').html(val.credunit)
							 $('#lecthrs').html(val.lechrs)
							 $('#labohrs').html(val.labhrs)
							 $('#tuithrs').html(val.tuihrs)
							 $('#acadtype').html(val.type)
							 $('#grp').html(val.group)


                         });

                         
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
            	$.ajax({
					type:'POST',
					data:{latcode:pcode},
					url:'Controller/Registrar/Curriculum/SubjectProfilePrereqViewController',
					success: function(result){
						var item = $.parseJSON(result);
						 $('#prereqbody').html('')
						 var i= 0;
						 $.each(item, function (key, val) {
							 $('#prereqbody').append('<tr><td>'+val.code+'</td><td>'+val.desc+'</td></tr>')
							 i++;

                         });
						 if(i == 0)
							 $('#prereqbody').append('<tr><td colspan="2" style="text-align:center"> No data to show</td></tr>')

                         
					},
                    error: function (response) {
                        swal("Error encountered while adding data"+response, "Please try again", "error");
                    }
				});
            	
            	
            })

            $('#addBtn').click(function(e){
            	e.preventDefault();
            			
				 codeTxt = $('#codeTxt').val();
				 descTxt = $('#descTxt').val();
				 
				 subject = $('#subjectDrp').val();
				 
				 lecunit = $('#lectureunitTxt').val();
				 labunit = $('#laboratoryunitTxt').val();
				 credunit = $('#creditedunitTxt').val();
				 lechrs = $('#lecturehourTxt').val();
				 labhrs = $('#laboratoryhourTxt').val();
				 tuihrs = $('#creditedhourTxt').val();
				 type = $('#academictype').prop('checked');
				 
				 if(type == true)
					 type = 'Academic'
				 else
					 type = 'Non-Academic'
				
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
        					data:{
        						codeTxt: codeTxt, descTxt: descTxt,type:"Insert",latcode:latcode,subject:subject,lecunit:lecunit,labunit:labunit,
        						credunit:credunit,lechrs:lechrs,labhrs:labhrs,tuihrs:tuihrs,acadtype:type
        						},
        					url:'Controller/Registrar/Curriculum/SubjectController',
        					success: function(result){
        						var count = 0 ;
        						$('#e9 option:selected').each(function (index, val) {
	            					 $.ajax({
			        					type:'POST',
			        					data:{main: codeTxt, prereq:val.value,count:count},
			        					url:'Controller/Registrar/Curriculum/PrerequisiteController',
			        					success: function(result){
			        						
			        					},
			                            error: function (response) {
			                                swal("Error encountered while adding data", "Please try again", "error");
			                                $("#editable-sample_new").click();
			                            }
			        				});
	                                 count++;
	            				 });
        						
        						if(count == 0){
        							$.ajax({
			        					type:'POST',
			        					data:{main: codeTxt, prereq:'',count:count},
			        					url:'Controller/Registrar/Curriculum/PrerequisiteController',
			        					success: function(result){
			        						
			        					},
			                            error: function (response) {
			                                swal("Error encountered while adding data", "Please try again", "error");
			                                $("#editable-sample_new").click();
			                            }
			        				});
        						}
	                             
	                             swal({
                                     title: "Record Added!"
                                     , text: "The data is successfully Addedadded!"
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
            	codeTxt = $('#updcodeTxt').val();
				 descTxt = $('#upddescTxt').val();
				 
				 subject = $('#updsubjectDrp').val();
				 
				 lecunit = $('#updlectureunitTxt').val();
				 labunit = $('#updlaboratoryunitTxt').val();
				 credunit = $('#updcreditedunitTxt').val();
				 lechrs = $('#updlecturehourTxt').val();
				 labhrs = $('#updlaboratoryhourTxt').val();
				 tuihrs = $('#updtuitionhourTxt').val();
				 type = $('#updacademictype').prop('checked');
				 if(type == true)
					 type = 'Academic'
				 else
					 type = 'Non-Academic'
				
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
        					data:{
        						codeTxt: codeTxt, descTxt: descTxt,type:"Update",latcode:latcode,subject:subject,lecunit:lecunit,labunit:labunit,
        						credunit:credunit,lechrs:lechrs,labhrs:labhrs,tuihrs:tuihrs,acadtype:type
        						},
        					url:'Controller/Registrar/Curriculum/SubjectController',
        					success: function(result){
        						var count = 0 ;
        						$('#updprereq option:selected').each(function (index, val) {
	            					 $.ajax({
			        					type:'POST',
			        					data:{main: codeTxt, prereq:val.value,count:count},
			        					url:'Controller/Registrar/Curriculum/PrerequisiteController',
			        					success: function(result){
			        						
			        					},
			                            error: function (response) {
			                                swal("Error encountered while adding data", "Please try again", "error");
			                                $("#editable-sample_new").click();
			                            }
			        				});
	                                 count++;
	            				 });
        						

        						if(count == 0){
        							$.ajax({
			        					type:'POST',
			        					data:{main: codeTxt, prereq:'',count:count},
			        					url:'Controller/Registrar/Curriculum/PrerequisiteController',
			        					success: function(result){
			        						
			        					},
			                            error: function (response) {
			                                swal("Error encountered while adding data", "Please try again", "error");
			                                $("#editable-sample_new").click();
			                            }
			        				});
        						}
        						
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
                        confirmButtonColor: '#228B22',
                        confirmButtonText: 'Yes!',
                        cancelButtonText: "No!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                            $.ajax({
                                type: 'post',
                                url: 'Controller/Registrar/Curriculum/SubjectController',
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
                        confirmButtonColor: '#228B22',
                        confirmButtonText: 'Yes!',
                        cancelButtonText: "No!",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                    function (isConfirm) {
                        if (isConfirm) {
                        	$.ajax({
                                type: 'post',
                                url: 'Controller/Registrar/Curriculum/SubjectController',
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
                
        		$('#updcodeTxt').val(getcode)
        		$('#upddescTxt').val(getdesc)
        		$.ajax({
                    type: 'post',
                    url: 'Controller/Registrar/Curriculum/GetSubject',
                    data: {
                    	latcode:latcode
                    },
                    success: function (result) {
                    	var item = JSON.parse(result)
                    	$.each(item,function(key,val){
                    		$('#updlectureunitTxt').val(val.lecunit)
                    		$('#updlaboratoryunitTxt').val(val.labunit)
                    		$('#updcreditedunitTxt').val(val.credunit)
                    		$('#updlecturehourTxt').val(val.lechrs)
                    		$('#updlaboratoryhourTxt').val(val.labhrs)
                    		$('#updtuitionhourTxt').val(val.tuihrs)
                    		if(val.type=="Academic"){
                    			$('#updacademictype').prop('checked',true)
                    		}
                    		else
                    			$('#updacademictype2').prop('checked',true)
                    		
                    		if(val.group == "No Group"){
                    			$('#updsubjectDrp').select2("val","0")
                    		}
                    		else
                    			$('#updsubjectDrp').select2("val",val.group)
                    		console.log(val.prereq)
                    		$('#updprereq').select2('val',val.prereq)

                    			
                    	})
//                    	[{"labunit":"0","tuihrs":"3","lechrs":"3","lecunit":"3","labhrs":"0","type":"Academic","credunit":"3","group":"No Group"}]
                       
                    },
                    error: function (response) {
                        swal("Error encountered while adding data", "Please try again", "error");
                    }

                });

        		

                
            });
        }

    };

}();
