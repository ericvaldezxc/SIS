var getcode = '';
var getname = '';
var codeTxt = '';
var descTxt = '';
var unitTxt = '';
var latcode = '';
var lattitle = '';
var lattype = '';
var latsub = '';
var daycol = '<td><select class="populate dayDrp" ><option value="default" selected="selected" disabled="disabled" >Select a Day</option><option value="M" >Monday</option><option value="T"  >Tuesday</option><option value="W" >Wednesday</option><option value="TH" >Thursday</option><option value="F"  >Friday</option><option value="S" >Saturday</option><option value="SU" >Sunday</option></select></td>'
var startcol = '<td><input type="time" class="form-control timeStart" value="07:30:00" ></td>'
var endcol = '<td><input type="time" class="form-control timeEnd" value="07:30:00" ></td>'
var delcol = '<td><a class="btn btn-danger delBtn" type="button"><i class="fa fa-trash-o"></i></a></td>'
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
            
            $('#addItem').on('click',function(){
            	var camp = $('#campusDrp').val()
            	var room = '<td><select class="populate roomDrp"  ><option value="default" selected="selected" >TBA</option> '  
            	$.ajax({
					type:'POST',
					data:{Campus: camp},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillRoom',
					success: function(result){
						var item = $.parseJSON(result)
						$.each(item, function (key, val) {
							room += '<option value="'+val.code+'">'+val.desc+'</option>';
                			
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

            $('#loadBtn').click(function(e){
            	e.preventDefault();
            	var campus = $('#campusDrp').val()
            	var semester = $('#semesterDrp').val()
            	var course = $('#courseDrp').val()
            	var year = $('#yearDrp').val()
            	var section = $('#sectionDrp').val()
            	lattitle = $('#sectionDrp option:selected').text() + ' ' + $('#semesterDrp option:selected').text()
            	$('#loadTitle').html(lattitle)
            	fillcurriculum()
            	
								
			});
            
            $('#addBtn').click(function(e){
            	e.preventDefault();
            	var campus = $('#campusDrp').val()
            	var semester = $('#semesterDrp').val()
            	var course = $('#courseDrp').val()
            	var year = $('#yearDrp').val()
            	var section = $('#sectionDrp').val()
            	var curriculumDrp = $('#curriculumDrp').val()
            	var professorDrp = $('#professorDrp').val()
            	var professorDrp = $('#professorDrp').val()
            	
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
         					data:{curriculumDrp:curriculumDrp,section:section,year:year,lattype:lattype,subject:latsub},
         					url:'Controller/Registrar/PreEnrollment/TimeandRoomUpdate',
         					async: true,
         					success: function(result2){

         					},
                             error: function (response) {
                                 swal("Error encountered while adding data", "Please try again", "error");
                                 
                             }
             			});
							 
                		$.ajax({	
        					type:'POST',
        					data:{subject:latsub,curriculumDrp:curriculumDrp,section:section,year:year,course:course,semester:semester,campus:campus,lattype:lattype,professorDrp:professorDrp},
        					url:'Controller/Registrar/PreEnrollment/Schedule',
        					success: function(result){
	    						 $('#schedmainBody tr').each(function(){
	    							 var _day = $(this).find('.dayDrp option:selected').val() 
	    							 var _timestart = $(this).find('.timeStart').val()
	    							 var _timeend = $(this).find('.timeEnd').val()
	    							 var _room = $(this).find('.roomDrp option:selected').val() 
	    							
	    							 
	    							 $.ajax({
		                					type:'POST',
		                					data:{day:_day,timestart:_timestart,timeend:_timeend,room:_room,subject:latsub,curriculumDrp:curriculumDrp,section:section,year:year,course:course,semester:semester,campus:campus,lattype:lattype,professorDrp:professorDrp},
		                					url:'Controller/Registrar/PreEnrollment/TimeandRoom',
		                					async: true,
		                					success: function(result2){
		                						 $('#loadBtn').click()
		                					},
		                                    error: function (response) {
		                                        swal("Error encountered while adding data", "Please try again", "error");
		                                        
		                                    }
		                				});
	    							

	    						 })
        						
        						
        						
	                            $("#addcloseBtn").click();	                             
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
            
            
            function fillcurriculum(){
            	if( $('#courseDrp').val() != 'default'){
            		var campus = $('#campusDrp').val()
	            	var semester = $('#semesterDrp').val()
	            	var course = $('#courseDrp').val()
	            	var yearlvl = $('#yearDrp').val()
	            	var section = $('#sectionDrp').val()
	            	var curi = $('#curriculumDrp').val()
            		$.ajax({
    					type:'POST',
    					data:{curcode:course,section:section,yearlvl:yearlvl,semester:semester,curi:curi},
    					async:true,
    					url:'Controller/Registrar/Preenrollment/CurriculumItems',
    					success: function(result){
    						var item = $.parseJSON(result)
							$('#mainBody').html('')
    						$.each(item, function (key, val) {
    							var sched = ''
    							if(jQuery.isEmptyObject(val.group) == true){
        							$.each(val.schedule, function (key2, val2) {
        								if( val2.timesched == 'TBA')
        									sched += 'TBA' + '</br>';
        								else
            								sched += val2.timesched + ' - ' + val2.room + '</br>';

                                    });
        							$('#mainBody').append('<tr><td style="font-size:12px"><label class="codeText"  data-type="solo" data-curriculum-id="'+val.id+'" data-tuition="'+val.tuition+'">'+val.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val.units+'</label></td><td class="proffesor" data-code="'+val.profcode+'">'+val.prof+'</td><td class="schedule">'+sched+'</td><td><a class="btn btn-success scheduleBtn" data-toggle="modal" href="#Schedule"><i class="fa fa-calendar"></i></a></td></tr>')
        							
    							}
        						else{
        							$('#mainBody').append('<tr><td colspan="7"  class="codeText" style="font-size:12px;font-weight:bold" data-type="parent" data-curriculum-id="'+val.id+'" >'+val.code+'</td></tr>')
        							$.each(val.group, function (key2, val2) {
        								sched=''
        								$.each(val2.schedule, function (key3, val3) {
            								if( val3.timesched == 'TBA')
            									sched += 'TBA' + '</br>';
            								else
                								sched += val3.timesched + ' - ' + val3.room + '</br>';

                                        });
            							$('#mainBody').append('<tr><td style="font-size:12px;padding-left: 25px;font-style:italic"  ><label class="codeText" data-subject-id="'+val2.id+'" data-type="child" data-tuition="'+val2.tuition+'">'+val2.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val2.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val2.units+'</label></td><td class="proffesor"  data-code="'+val2.profcode+'">'+val2.prof+'</td><td class="schedule">'+sched+'</td><td><a class="btn btn-success scheduleBtn"  data-toggle="modal" href="#Schedule"><i class="fa fa-calendar"></i></a></td></tr>')
                                   });
        							
        						}
    							
                            });
    						if($('#mainBody').html() == ''){
    							$('#mainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
    							
    						}
    						else{
//    							$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="4" id="totunit">Total: '+totunit+' Units'+'</td></tr>')
    						}
    						    						
    					},
                        error: function (response) {
                            swal("Error encountered while adding data"+response, "Please try again", "error");
                        }
    				});
            	}
            	
            }
            
            function fillfaculty(){
            	$('#mainBody tr').each(function(){
            		var type = $(this).find('.codeText').data("type")
            		if(type == "solo"){
            			
            			
            		}
            	})
           
            	
            	
            }
            
            $('#schedmainBody').on('click','a.delBtn',function(r){
				$(this).closest('tr').remove();
				
			});

            $('#mainBody').on('click','a.scheduleBtn',function(){
            	var courcode = $(this).closest('tr').children('td:eq(0)').text()
            	var courdesc = $(this).closest('tr').children('td:eq(1)').text()
            	var name = $(this).closest('tr').children('td:eq(3)').text()
            	var profcode = $(this).closest('tr').find('.proffesor').data('code')
            	var camp = $('#campusDrp').val()
				var room = '<td><select class="populate roomDrp"  ><option value="default" selected="selected" >TBA</option> '  
				
            	lattype = $(this).closest('tr').find('.codeText').data('type')
            	latsub = courcode
            	$('#Schedule .modal-title').html(courcode + ' - ' + courdesc)
            	latcode = courcode
            	
        		if(profcode == 'Not Set')
        			$("#professorDrp").select2("val", "default");
        		else
        			$("#professorDrp").select2("val", profcode);
            	
            	$.ajax({
					type:'POST',
					data:{subject: courcode},
					url: "Controller/Registrar/Preenrollment/GetFacultyPerSubject",
					success: function(result){
						var item = $.parseJSON(result)
						console.log(item)
						$('#professorDrp').html('')
						$('#professorDrp').append('<option value="default" disabled >Select a Faculty</option>') 
						$.each(item, function (key, val) {
							$('#professorDrp').append('<option value='+val.code+' >'+val.name+'</option>') 
                			
                		})
	            		
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
        		
            	
            	
        		$('#schedmainBody').html('')
        		var campus = $('#campusDrp').val()
            	var course = $('#courseDrp').val()
            	var yearlvl = $('#yearDrp').val()
            	var section = $('#sectionDrp').val()
            	var curi = $('#curriculumDrp').val()
        		$.ajax({
					type:'POST',
					data:{Campus: camp},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'FillRoom',
					success: function(result){
						var item = $.parseJSON(result)
						$.each(item, function (key, val) {
							room += '<option value="'+val.code+'">'+val.desc+'</option>';
                			
                		})
                		room += '</select></td>'	                    		
	            		$.ajax({
							type:'POST',
							data:{section:section,year:yearlvl,curriculumDrp:curi,lattype:lattype,subject:courcode},
							url: 'Controller/Registrar/PreEnrollment/FillSchedule',
							success: function(result2){
								var item2 = $.parseJSON(result2)
								$.each(item2, function (key, val) {
									$('#schedmainBody').append('<tr>'+daycol+startcol+endcol+room+delcol+'</tr>')
									$('#schedmainBody tr:last').find('.dayDrp').val(val.day)
									$('#schedmainBody tr:last').find('.timeStart').val(val.tstart)
									$('#schedmainBody tr:last').find('.timeEnd').val(val.tend)
									if(val.room != "TBA")
										$('#schedmainBody tr:last').find('.roomDrp').val(val.room)
									else
										$('#schedmainBody tr:last').find('.roomDrp').val("default")
		                			
		                		})
		                		
				            	if($('#schedmainBody').html() == ''){
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
				            		
				            	}
				            	else{
				            		$("select.dayDrp").select2( {width: '100%' });
					        		$("select.roomDrp").select2( {width: '100%' });
				            	}
								
				        		
							},
		                    error: function (response) {
		                        swal("Error encountered while accessing the data", "Please try again", "error");
		                    }
						});

                		
                		
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});


            	
            	
            })
            
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
