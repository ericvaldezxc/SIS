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
			//tui 
			function fillmandatoryfee(){
    			$.ajax({
					type:'POST',
					data:{},
					url: 'Controller/Registrar/Admission/FillMandatoryFee',
					async:true,
					success: function(result){
						var item = $.parseJSON(result);
	                	$.each(item,function(key,val){
							$('#feemainBody').append('<tr><td>'+val.fee+'</td><td class="amount">'+val.amount+'</td></tr>')	                		
	                	
	                	})
	                	fillcoursefee()
	                	

                         
					},
                    error: function (response) {
                        swal("Error encountered while accessing the data", "Please try again", "error");
                    }

				});
        	}
        	
			function fillcoursefee(){
				var cou = $('#courseDrp').val()
    			$.ajax({
					type:'POST',
					data:{course:cou},
					url: 'Controller/Registrar/Admission/FillCourseFee',
					success: function(result){
						var item = $.parseJSON(result);
	                	$.each(item,function(key,val){
							$('#feemainBody').append('<tr><td>'+val.fee+'</td><td class="amount">'+val.amount+'</td></tr>')
	                		
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
				
				$('#mainBody  tr ').each(function(key,val){
					var sub = $(this).find('.codeText').html()
					var stat = $(this).find('.ckbox').is(':checked');
					var count = $(this).children('td').length
					if(stat == true && sub != undefined || count == 1){
						$.ajax({
							type:'POST',
							data:{subj:sub},
							url: 'Controller/Registrar/Admission/FillSubjectFee',
							success: function(result){
								var item = $.parseJSON(result);
			                	$.each(item,function(key,val){
									$('#feemainBody').append('<tr class="subj"><td>'+val.fee+'</td><td class="amount">'+val.amount+'</td></tr>')	                		
			                		
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
						url: 'Controller/Registrar/Admission/GetTuitionUnit',
						success: function(result){
							var acadamo = parseFloat(tottuitionunit) * parseFloat(result);
							$.ajax({
		    					type:'POST',
		    					data:{Amount: acadamo},
		    					url: "http://"+window.location.hostname+":"+window.location.port+"/SIS/" +'MoneyConvertion',
		    					success: function(result2){
									$('#feemainBody').append('<tr class="subj"><td>Academic ('+tottuitionunit+' Tuition Unit)</td><td class="amount">'+result2+'</td></tr>')	   
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
						$('#feemainBody').append('<tr class="totamount" style="text-align:right;font-weight: bold;padding-top:10px;padding-bottom:10px;"><td  >Total Amount: </td><td style="text-align:left;font-weight: bold" class="TotalAmount">'+result+'</td></tr>')
	                	

                         
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
            	fillsubjectfee()
            	
        		
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
            $('#editable-sample').on('click','a.application', function (e) {
                e.preventDefault();
                if($(this).data('document') == 'Cleared'){
                	$("#Application").modal('show');
                    $('#studentName').html($(this).closest('tr').children('td:eq(1)').text());
                    latid = $(this).data('studentid');
                    $('#studentStatus').html($(this).closest('tr').children('td:eq(3)').text());
                
                }else{
                	swal("Please check the documents needed", "Make sure that all document needed is provided", "error");
                }   
                
            
            });
            $('#editable-sample').on('click','a.document', function (e) {
                e.preventDefault();
                var app = $(this).data('app')
                latcode =  app
                $.ajax({
					type:'POST',
					data:{
						app:app
						
						},
					url:'Controller/Registrar/Application/GetDocument',
					success: function(result){
						var item = $.parseJSON(result)
						var list = []
						$('#e9').select2("val",item);
						$(item).each(function(key,val){
							list.push(val.id)
						})
						$('#e9').select2("val", list);
						
                     
					},
                    error: function (response) {
                        swal("Error encountered while adding data", "Please try again", "error");
                    }
				});
				$("#Document").modal('show');
           
                
            
            });
            $('#documentSave').on('click',function(){
            	var docu = [];
            	$('#e9 option:selected').each(function(){
            		docu.push($(this).val())
            		
            	})
            	$.ajax({
 					type:'POST',
 					data:{latcode:latcode,docu: JSON.stringify(docu)},
 					url:'Controller/Registrar/Application/Document',
 					success: function(result){
// 						swal("Document/s Added", "The document is successfully added", "success");
 						swal({
                            title: "Document/s Added"
                            , text: "The document is successfully added"
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
            	
            })
            
            function getpdf(){
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
//                		alert(base)
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
//				  	   pdf.output('dataurlnewwindow');
				  		
				  		
//				  	   window.open(pdf.output('bloburl'))
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
					  	"<h2> "+$('#feemainBody .TotalAmount').html()+" </h2>" // HTML string or DOM elem ref.
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
				
			
            	
            }
            function openDataUriWindow(url) {
			    var html = '<html>' +
			        '<style>html, body { padding: 0; margin: 0; } iframe { width: 100%; height: 100%; border: 0;}  </style>' +
			        '<body>' +
			        '<iframe src="' + url + '"></iframe>' +
			        '</body></html>';
			    a = window.open();
			    a.document.write(html);
			}

            $('#EnrollBtn').on('click',function(){
            	var CourseDrp = $('#courseDrp').val();
                var SectionDrp = $('#sectionDrp').val();
                var campus = $('#campusDrp').val();
                var typeDrp = $('#typeDrp').val();
                var amount = $('#feemainBody tr td.TotalAmount').html();
                if(amount != '' || amount != undefined )	{
                	amount = amount.replace(",", "");
                }
//                alert(amount)
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
        						SectionDrp:SectionDrp,
        						campus:campus,
        						typeDrp:typeDrp,
        						amount:amount
        						},
        					url:'Controller/Registrar/Admission/Enroll',
        					success: function(result){
        						$('#mainBody tr').each(function(key,val){
        							var sub = $(this).find('.codeText').html();
        							var taken = $(this).find('input:checkbox').prop("checked");
            						$.ajax({
            							async:false,
                    					type:'POST',
                    					data:{
                    							sub:sub,
                    							CourseDrp:CourseDrp, 
                    							taken:taken,
                    							SectionDrp:SectionDrp
                    						
                    						},
                    					url:'Controller/Registrar/Admission/AdmissionTakenSubjectController',
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
        						getpdf();
        						
	                             
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
