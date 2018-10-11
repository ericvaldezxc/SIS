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
            
           
//            $('#CourseDrp').on('change',function(){
//            	totunit = 0
//				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
//
//            	var curcode = $(this).val();
//				$('#feeDiv').addClass('hidden')
//
//            	fillsection();
//            	
//            });
//            $('#YearDrp').on('change',function(){
//            	totunit = 0
//				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
//				$('#feeDiv').addClass('hidden')
//
//            	fillsection();
//            	
//            });
//            $('#SectionDrp').on('change',function(){
//            	totunit = 0
//				$('#mainBody').html('<tr><td style="font-size:15px" ><center class="codeText"></center></td><td style="font-size:15px" ><center class="descText"></center></td><td style="font-size:15px" ><center class="unitText"></center></td><td><center></center></td></tr>')
//				$('#feeDiv').addClass('hidden')
//
//            	fillcurriculum();
//            	
//            	
//            });
            var totunit = 0;
            var tottuitionunit = 0;
            
            
        	
            
            
            function fillcurriculum(){
            	totunit = 0
            	if( $('#courseDrp').val() != 'default'){
            		var curcode =  $('#courseDrp').val()
            		$.ajax({
    					type:'POST',
    					data:{curcode:curcode},
    					async:true,
    					url:'Controller/Registrar/Admission/CurriculumItems',
    					success: function(result){
    						var item = $.parseJSON(result)
							$('#mainBody').html('')
    						$.each(item, function (key, val) {
//    							$('#mainBody').append('<tr><td style="font-size:12px" ><center class="codeText">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.units+'</center></td><td><center><input type="checkbox" class="form-control ckbox" id="ckbox" style="width:20px;height:20px;" checked="checked"></center></td></tr>')
    							if(val.group == ''){
        							$('#mainBody').append('<tr><td style="font-size:12px" ><center class="codeText" data-tuition="'+val.tuition+'">'+val.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val.units+'</center></td><td><center><input type="checkbox" class="form-control ckbox" id="ckbox" style="width:20px;height:20px;" checked="checked"></center></td></tr>')
        							totunit += parseInt(val.units);
        							tottuitionunit  += parseInt(val.tuition);
    							}
        						else{
        							$('#mainBody').append('<tr><td colspan="4" style="font-size:12px" ><center class="codeText" style="text-align:right;font-weight:bold">'+val.code+'</center></td></tr>')
        							$.each(val.group, function (key2, val2) {
            							$('#mainBody').append('<tr><td style="font-size:12px" ><center class="codeText" data-tuition="'+val2.tuition+'">'+val2.code+'</center></td><td style="font-size:12px" ><center class="descText">'+val2.desc+'</center></td><td style="font-size:12px" ><center class="unitText">'+val2.units+'</center></td><td><center><input type="checkbox" class="form-control grpckbox ckbox" id="ckbox" style="width:20px;height:20px;" ></center></td></tr>')
                                    });
        							
        							
        						}
    							
                            });
    						if($('#mainBody').html() == ''){
    							$('#mainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
    							$('#feeDiv').addClass('hidden')
    							
    						}
    						else{
    							$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="4" id="totunit">Total: '+totunit+' Units'+'</td></tr>')
    							$('#feeDiv').removeClass('hidden')
//    							$('#feeTxt').html($('#SectionDrp option:selected').data("fee"))
    						}

    	            		fillsubjectfee()
    						
    						
    					},
                        error: function (response) {
                            swal("Error encountered while adding data"+response, "Please try again", "error");
                        }
    				});
            	}
            	
            }
            
            //$('#courseDrp').trigger()
           
        	$('#courseDrp').on('change',function(){
        		fillsec()
        		fillcurriculum()
        		$('#feemainBody').html('')
        		fillmandatoryfee()
        		
        		
        		
        		
        	
			})
			$('#campusDrp').on('change',function(){
        		fillsec()
				
			})
			
			
			//mandataory fee
			//sub fee
		
        	
			function fillcoursefee(){
				var cou = $('#courseDrp').val()
    			$.ajax({
					type:'POST',
					data:{course:cou},
					url: 'Controller/Registrar/Admission/FillCourseFee',
					success: function(result){
						var item = $.parseJSON(result);
	                	$.each(item,function(key,val){
							$('#feemainBody').append('<tr data-type="fee"><td>'+val.fee+'</td><td class="amount">'+val.amount+'</td></tr>')
	                		
	                	})
	                	
	                	

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }

				});
				
        	}
			
			
			function fillsubjectfee(){
				$('#feemainBody  tr.subj').each(function(key,val){
					$(this).remove();
					
				})
				
				$('#feemainBody  tr.totamount').each(function(key,val){
					$(this).remove();
					
				})
				
				$('#feemainBody  tr.discount').each(function(key,val){
					$(this).remove();
					
				})
				
				$('#mainBody  tr ').each(function(key,val){
					var sub = $(this).find('.codeText').html()
					var stat = $(this).find('.ckbox').is(':checked');
					var count = $(this).children('td').length
					if(stat == true && sub != undefined || count == 1){
						$.ajax({
							type:'POST',
							data:{subj:sub},
							url: 'Controller/Student/Registration/FillSubjectFee',
							success: function(result){
								var item = $.parseJSON(result);
			                	$.each(item,function(key,val){
									$('#feemainBody').append('<tr data-type="fee" class="subj"><td>'+val.fee+'</td><td class="amount">'+val.amount+'</td></tr>')	                		
			                		
			                	})

		                         
							},
		                    error: function (response) {
		                        swal("Error encountered while accessing the data", "Please try again", "error");
		                    }

						});
					}

						
				})
				setTimeout( function(){ 
					$.ajax({
						type:'POST',
						data:{},
						url: 'Controller/Student/Registration/GetTuitionUnit',
						success: function(result){
							var acadamo = parseFloat(tottuitionunit) * parseFloat(result);
							$.ajax({
		    					type:'POST',
		    					data:{Amount: acadamo},
		    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
		    					success: function(result2){
									$('#feemainBody').append('<tr data-type="fee" class="subj"><td>Academic ('+tottuitionunit+' Tuition Unit)</td><td class="amount">'+result2+'</td></tr>')	   
									gettotamountfee()
		 
		                             
		    					},
		                        error: function (response2) {
		                            swal("Error encountered while accessing the data", "Please try again", "error");
		                        }
		    				});
	                         
						},
	                    error: function (response) {
	                        swal("Error encountered while accessing the data", "Please try again", "error");
	                    }

					});
			    }  , 500 )
				
        	}
			function gettotamountfee(){
				
				var totamo = 0;
				$('#feemainBody  tr ').each(function(key,val){
					var amo = $(this).find('.amount').html()
					if(amo != '' || amo != undefined )	{
						amo = amo.replace(",", "");
						totamo = parseFloat(totamo) + parseFloat(amo);

					}
					
				})
				
				$.ajax({
					type:'POST',
					data:{Amount: totamo},
					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
					success: function(result){
						$('#feemainBody').append('<tr class="totamount" data-type="total" style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px;"><td  >Total Amount: </td><td style="text-align:left;font-weight: bold" class="TotalAmount">'+result+'</td></tr>')
	                	

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
				
        	}

			
			function fillsec(){
        		var course = $('#courseDrp').val()
				var campus = $('#campusDrp').val()
				$.ajax({
					type:'POST',
					data:{course: course,campus:campus},
					url: 'Controller/Registrar/Admission/GetSection',
					success: function(result){
						var item = $.parseJSON(result);
                		$('#sectionDrp').html('<option value="default" disabled="disabled">Select a Section</option>')
	                	$.each(item,function(key,val){
	                		$('#sectionDrp').append('<option value="'+val.id+'">'+val.sectioncode+'</option>')
	                		
	                	})
	                	

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }
				});
        	}
			
            $('#mainBody').on('change','.ckbox',function(){
        		
            	totunit = 0;
				tottuitionunit = 0
            	$('#mainBody tr').each(function(){
            		if($(this).find('.unitText').html() != undefined){
            			if($(this).find('input:checkbox').prop("checked") == true){            				
            				totunit += parseInt($(this).find('.unitText').html())
            				tottuitionunit += parseInt($(this).find('.codeText').data("tuition"))
            				
            			}
            		}
            		
            	});
            	$('#totunit').html('Total: ' + totunit + ' Units')
            });
            
            
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
        					url:'Controller/Registrar/Admission/StudentProfile',
        					success: function(result){
	        						swal({
	                                    title: "Record Added!"
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

            $('#editable-sample').on('click','a.schedule', function (e) {
                e.preventDefault();
                $.ajax({
                    type: 'post',
                    url: 'Controller/Student/Schedule/StudentSchedule',
                    success: function (result) {
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
    							$('#mainBody').append('<tr><td style="font-size:12px"><label class="codeText"  data-type="solo" data-curriculum-id="'+val.id+'" data-tuition="'+val.tuition+'">'+val.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val.units+'</label></td><td class="proffesor" data-code="'+val.profcode+'">'+val.prof+'</td><td class="schedule">'+sched+'</td></tr>')
    							
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
        							$('#mainBody').append('<tr><td style="font-size:12px;padding-left: 25px;font-style:italic"  ><label class="codeText" data-subject-id="'+val2.id+'" data-type="child" data-tuition="'+val2.tuition+'">'+val2.code+'</label></td><td style="font-size:12px" ><label class="descText">'+val2.desc+'</label></td><td style="font-size:12px" ><label class="unitText">'+val2.units+'</label></td><td class="proffesor"  data-code="'+val2.profcode+'">'+val2.prof+'</td><td class="schedule">'+sched+'</td></tr>')
                               });
    							
    						}
							
                        });
						if($('#mainBody').html() == ''){
							$('#mainBody').html('<tr><td style="font-size:12px" ><center class="codeText"></center></td><td style="font-size:12px" ><center class="descText"></center></td><td style="font-size:12px" ><center class="unitText"></center></td><td><center></center></td></tr>')
							
						}
						else{
//							$('#mainBody').append('<tr><td style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px" colspan="4" id="totunit">Total: '+totunit+' Units'+'</td></tr>')
						}
                    },
                    error: function (response) {
                        swal("Error encountered while adding data", "Please try again", "error");
                    }

                });
                
            });
        }
    };

}();
