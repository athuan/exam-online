<%@ include file="/jsp/common/includetags.jsp"%>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Schedule Exam - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/test/scheduletest.js?dt=25jan2014"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />	
<script type="text/javascript">
	function doPageSubmit()
	{
		var frm=document.forms["ScheduleTestForm"];
		frm.perpageRecord.value=document.getElementById("perpageRecord").value;
		frm.operation.value="SEARCH";
		
		frm.submit();

	}
	
	function getAjaxUserResponse(){
		var oTable = $('#example').dataTable( {
				"aLengthMenu": [
								[20, 50, 100, 200, -1],
				                [20, 50, 100, 200, "All"]
				            ],
			    "iDisplayLength": 20,
				//"aaSorting": [ [0,'asc'], [1,'asc'] ],
				//"aoColumnDefs": [
				//	{ "sType": 'string-case', "aTargets": [ 2 ] }
				//],
				 "bProcessing": true,
				 "bDestroy": true, 
			     "bServerSide": true,
			     "sAjaxSource": contextPath+"/ScheduleTest.do?fromAjax=1&search=1&examId="+document.forms["ScheduleTestForm"].examID.value+"&testId="+document.forms["ScheduleTestForm"].testId.value+"&groupId="+document.forms["ScheduleTestForm"].groupid.value,
		         "aoColumnDefs": [
									{
 									 aTargets: [0],    // Column number which needs to be modified
 									 mRender: function (data,userId) {   // o, v contains the object and value for the column
    										  return '<input type="checkbox" id="userId" name="userId" value="'+data+'"/>';
  								},
  								sClass: 'tableCell'    // Optional - class to be applied to this table cell
					}],
				    "bSort": false,
            	    "bStateSave":false,
            	    "bSearchable":true,
            	    "bRegex":true
			});
		
		$('#example_filter input').unbind();
		$('#example_filter input').bind('keyup', function(e) {
		      /* if(e.keyCode == 13) {*/
		        oTable.fnFilter(this.value);   
		   /* }*/
		  }); 
	}
	
	function getTestDetails(type)
	{	
		var frm = document.forms["ScheduleTestForm"];
		if(document.forms["ScheduleTestForm"].examName.value=='' && type == 'test'){
			alert("Enter exam name!");
			document.forms["ScheduleTestForm"].testId.value = "0";
			document.forms["ScheduleTestForm"].examName.focus();
			return false;
		}else{		
			/*frm.operation.value="SEARCH";
			frm.submit();
			return false;*/
			getAjaxUserResponse();
		}
	}
	 function dopage(page,op){
	     document.forms["ScheduleTestForm"].operation.value ="SEARCH";
         document.forms["ScheduleTestForm"].startPage.value = page;
         document.forms["ScheduleTestForm"].perpageRecord.value=document.getElementById("perpageRecord").value;
         document.forms["ScheduleTestForm"].submit();
     }

	 function doSearch(){
		 document.forms["ScheduleTestForm"].operation.value ="SEARCHVALUE";
         document.forms["ScheduleTestForm"].perpageRecord.value=document.getElementById("perpageRecord").value;
         document.forms["ScheduleTestForm"].submit();
	 }
		function doSubmit(val)
		{
		
			if(document.forms["ScheduleTestForm"].examName.value==''){
				alert("Enter exam name!");
				document.forms["ScheduleTestForm"].examName.focus();
			}
			else if(document.getElementById("selectTest").value==0){
				alert("Select question paper!");
			}else if(document.forms["ScheduleTestForm"].timezoneId.value == ''){
				alert("Select Timezone!");
			}
			else{
			var startdate=document.getElementById("tdate").value;
			stdate=startdate.split("-");
			
			var enddate=document.getElementById("edate").value;
			endate= enddate.split("-");

			var flag=0;

			if(document.forms["ScheduleTestForm"].userId && document.forms["ScheduleTestForm"].userId.checked)
				flag=1;
			else{
				if(document.forms["ScheduleTestForm"].userId){
					 for(var i=0;i<document.forms["ScheduleTestForm"].userId.length;i++)
					 {
						 if(document.forms["ScheduleTestForm"].userId[i].checked)
							 flag=1;
					 }
				}
			}
			
			if(flag==0 && val!='true' && document.forms["ScheduleTestForm"].publicURL.value=='')
			{
				alert("Select at least one user for exam!.");
				return false;
			}
			if(stdate=='' || endate=='')
			{
				alert("Select valid start & end date!");
				return false;
			}else{
				frm=document.forms["ScheduleTestForm"];

				if(val=='true'){
					frm.operation.value="edit";}
				else{
					frm.operation.value="add";}
				
				frm.submit();
			}
					
		}
	}
 function selectEmail(){
		if(document.forms["ScheduleTestForm"].selectemail.checked){
		
		     for(var i=0;i<document.forms["ScheduleTestForm"].userId.length;i++)
		    	 document.forms["ScheduleTestForm"].userId[i].checked=true;
		     document.forms["ScheduleTestForm"].userId.checked=true;
	   	}
		else{
			 for(var i=0;i<document.forms["ScheduleTestForm"].userId.length;i++)
		    	 document.forms["ScheduleTestForm"].userId[i].checked=false;
			 document.forms["ScheduleTestForm"].userId.checked=false;
		}
	}
 function hidemessage(){
		document.getElementById("messagep").style.display="none";
	}	

 function checkExamURL(urlval) {	
	 	if(urlval==""){
		 	return;
		 }else{
			$.post("callCreateQuestionPaper.do?check", {
				exmURL : urlval,
				op : "checkurl"
			}, function(data) {
				if (data == null) {
					message(container, "Data Not Found...");
				} else {			
					if(data != 'available'){
						alert("The entered public exam url is not available. Please use different keyword.");
						document.forms["QuestionPaperForm"].exmURL.value="";
					}
				}
			});

		 }

	}
 $("#multiplePublicExam").on("change", function() { checkOpenSource();});			
 checkOpenSource = function(){
	 if($("#multiplePublicExam").val()=='0'){
		 $("#multiplePublicExam").val(1);
		 alert("This feature is available for saas(On Premises) and Commercial versions. Please visit Kaldin for more details .");
	 }
 }
 
</script>
<script type="text/javascript" charset="utf-8">
var contextPath = '<%=request.getContextPath()%>';

			/* Define two custom functions (asc and desc) for string sorting */
			/*jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
				return ((x < y) ? -1 : ((x > y) ?  1 : 0));
			};
			
			jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
				return ((x < y) ?  1 : ((x > y) ? -1 : 0));
			};*/
			
			$(document).ready(function() {
				/* Build the DataTable with third column using our custom sort functions */
				    if(document.forms["ScheduleTestForm"].operation.value == 'VIEW'){
						getAjaxUserResponse();
					}else if(document.forms["ScheduleTestForm"].operation.value == 'LOADUSERS'){
							var oTable = $('#example').dataTable({
								"aLengthMenu": [
												[20, 50, 100 ,200, -1],
								                [20, 50, 100 ,200, "All"]
								            ],
							     "iDisplayLength": 20,
								 "bProcessing": true,
							     "bServerSide": true,
							     "bDestroy": true, 
							     "sAjaxSource": contextPath+"/ScheduleTest.do?loaduser",
				                 "aoColumnDefs": [{ 
			   									 aTargets: [0],    // Column number which needs to be modified
			   									 mRender: function (data, userId) {   // o, v contains the object and value for the column
			      										  return '<input type="checkbox" id="userId" name="userId" value="'+data+'"/>';
			    								},
			    								sClass: 'tableCell'// Optional - class to be applied to this table cell
								}],
		                	    "bSort": false,
		                	    "bStateSave":false,
		                	    "bSearchable":true,
		                	    "bRegex":true
		   					});
						
						$('#example_filter input').unbind();
						$('#example_filter input').bind('keyup', function(e) {
						       /*if(e.keyCode == 13) {*/
						        oTable.fnFilter(this.value);   
						   /* }*/
						}); 
					}else{
						var oTable = $('#example').dataTable({
								"aLengthMenu": [
												[20, 50, 100 ,200, -1],
								                [20, 50, 100 ,200, "All"]
								            ],
							     "iDisplayLength": 20,
								 "bProcessing": true,
							     "bServerSide": true,
							     "bDestroy": true, 
							     "sAjaxSource": contextPath+"/ScheduleTest.do?check",
				                 "aoColumnDefs": [{ 
			   									 aTargets: [0],    // Column number which needs to be modified
			   									 mRender: function (data, userId) {   // o, v contains the object and value for the column
			      										  return '<input type="checkbox" id="userId" name="userId" value="'+data+'"/>';
			    								},
			    								sClass: 'tableCell'// Optional - class to be applied to this table cell
								}],
		                	    "bSort": false,
		                	    "bStateSave":false,
		                	    "bSearchable":true,
		                	    "bRegex":true
		   					});
						
						$('#example_filter input').unbind();
						$('#example_filter input').bind('keyup', function(e) {
						       /*if(e.keyCode == 13) {*/
						        oTable.fnFilter(this.value);   
						   /* }*/
						}); 
				}
			    $("#example_previous").click( function() { document.forms["ScheduleTestForm"].selectemail.checked=false; });
			    $("#example_next").click( function() { document.forms["ScheduleTestForm"].selectemail.checked=false; });
				Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
				
			});
			
			
		</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Test");
		String examid = request.getParameter("examid")==null?"0":(String) request.getParameter("examid");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<!--	CONTENT -->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do">Question	Paper</a></li>
					<li ><a href="<%=request.getContextPath()%>/schdultestlist.do?operation=LIST" class="active">Scheduled Exam</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Schedule Exams by selecting employees/candidates for any of the Question Papers you created.</p></div>
			</div>
			<div id="main">
				<h3>Schedule a Exam</h3>
				<hr />
				<logic:present name="error">
					<div id="messagep">
						<p class="message invalid">
							<bean:write name="error" filter="true" />
							<span class="x" onclick="hidemessage();"></span>
						</p>
					</div>
				</logic:present>
				<logic:present name="ScheduleTestMessage">
					<p class="message success" id="messagep">
						<bean:write name="ScheduleTestMessage" filter="true" />
						<span class="x" onclick="hidemessage();"></span>
				</logic:present>
				<div class="schedule">
					<html:form action="/ScheduleTest">
						<%
							boolean isEditableDisable = false;
						%>
						<logic:equal name="ScheduleTestForm" property="operation"
							value="VIEW">
							<%
								isEditableDisable = true;
							%>
						</logic:equal>

						<html:hidden property="startPage" />
						<html:hidden property="examID"/>
						<html:hidden property="operation"></html:hidden>
						<div class="schedule_exm">
							<p>
								<label>Exam Name:</label>
								<html:text property="examName" maxlength="45" size="20"></html:text>
								<html:select property="testId" styleId="selectTest"
							onchange="return getTestDetails('test');" disabled="<%=isEditableDisable %>">
							<html:option value="0">Select Question Paper</html:option>
							<logic:present name="testList">
								<logic:iterate id="test" name="testList">
									<html:option value="${test.testID}"><bean:write	name="test" property="testName" filter="true" /></html:option>
								</logic:iterate>
							</logic:present>
						</html:select>
							&nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/19/129/en/question-paper-%26-exam-schedule.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Exam Name"></a>
							</p>	
							<p>
							<label>Exam Start Date & Time:</label>
							<html:text property="startDate" styleId="tdate" size="12" />
							<html:select property="startTime" styleId="stime">
								<html:option value="00:00">12:00 AM</html:option><html:option value="00:30">12:30 AM</html:option>
								<html:option value="1:00">1:00 AM</html:option><html:option value="1:30">1:30 AM</html:option>
								<html:option value="2:00">2:00 AM</html:option><html:option value="2:30">2:30 AM</html:option>
								<html:option value="3:00">3:00 AM</html:option><html:option value="3:30">3:30 AM</html:option>
								<html:option value="4:00">4:00 AM</html:option><html:option value="4:30">4:30 AM</html:option>
								<html:option value="5:00">5:00 AM</html:option><html:option value="5:30">5:30 AM</html:option>
								<html:option value="6:00">6:00 AM</html:option><html:option value="6:30">6:30 AM</html:option>
								<html:option value="7:00">7:00 AM</html:option><html:option value="7:30">7:30 AM</html:option>
								<html:option value="8:00">8:00 AM</html:option><html:option value="8:30">8:30 AM</html:option>
								<html:option value="9:00">9:00 AM</html:option><html:option value="9:30">9:30 AM</html:option>
								<html:option value="10:00">10:00 AM</html:option><html:option value="10:30">10:30 AM</html:option>
								<html:option value="11:00">11:00 AM</html:option><html:option value="11:30">11:30 AM</html:option>
								<html:option value="12:00">12:00 PM</html:option><html:option value="12:30">12:30 PM</html:option>
								<html:option value="13:00">1:00 PM</html:option><html:option value="13:30">1:30 PM</html:option>
								<html:option value="14:00">2:00 PM</html:option><html:option value="14:30">2:30 PM</html:option>
								<html:option value="15:00">3:00 PM</html:option><html:option value="15:30">3:30 PM</html:option>
								<html:option value="16:00">4:00 PM</html:option><html:option value="16:30">4:30 PM</html:option>
								<html:option value="17:00">5:00 PM</html:option><html:option value="17:30">5:30 PM</html:option>
								<html:option value="18:00">6:00 PM</html:option><html:option value="18:30">6:30 PM</html:option>
								<html:option value="19:00">7:00 PM</html:option><html:option value="19:30">7:30 PM</html:option>
								<html:option value="20:00">8:00 PM</html:option><html:option value="20:30">8:30 PM</html:option>
								<html:option value="21:00">9:00 PM</html:option><html:option value="21:30">9:30 PM</html:option>
								<html:option value="22:00">10:00 PM</html:option><html:option value="22:30">10:30 PM</html:option>
								<html:option value="23:00">11:00 PM</html:option><html:option value="23:30">11:30 PM</html:option>
							</html:select>
							</p>	
							<p>
							<label>Exam End Date & Time:</label>
							<html:text property="endDate" styleId="edate" size="13" />
							<html:select property="endTime" styleId="etime" value="23:30">
								<html:option value="00:00">12:00 AM</html:option><html:option value="00:30">12:30 AM</html:option>
								<html:option value="1:00">1:00 AM</html:option><html:option value="1:30">1:30 AM</html:option>
								<html:option value="2:00">2:00 AM</html:option><html:option value="2:30">2:30 AM</html:option>
								<html:option value="3:00">3:00 AM</html:option><html:option value="3:30">3:30 AM</html:option>
								<html:option value="4:00">4:00 AM</html:option><html:option value="4:30">4:30 AM</html:option>
								<html:option value="5:00">5:00 AM</html:option><html:option value="5:30">5:30 AM</html:option>
								<html:option value="6:00">6:00 AM</html:option><html:option value="6:30">6:30 AM</html:option>
								<html:option value="7:00">7:00 AM</html:option><html:option value="7:30">7:30 AM</html:option>
								<html:option value="8:00">8:00 AM</html:option><html:option value="8:30">8:30 AM</html:option>
								<html:option value="9:00">9:00 AM</html:option><html:option value="9:30">9:30 AM</html:option>
								<html:option value="10:00">10:00 AM</html:option><html:option value="10:30">10:30 AM</html:option>
								<html:option value="11:00">11:00 AM</html:option><html:option value="11:30">11:30 AM</html:option>
								<html:option value="12:00">12:00 PM</html:option><html:option value="12:30">12:30 PM</html:option>
								<html:option value="13:00">1:00 PM</html:option><html:option value="13:30">1:30 PM</html:option>
								<html:option value="14:00">2:00 PM</html:option><html:option value="14:30">2:30 PM</html:option>
								<html:option value="15:00">3:00 PM</html:option><html:option value="15:30">3:30 PM</html:option>
								<html:option value="16:00">4:00 PM</html:option><html:option value="16:30">4:30 PM</html:option>
								<html:option value="17:00">5:00 PM</html:option><html:option value="17:30">5:30 PM</html:option>
								<html:option value="18:00">6:00 PM</html:option><html:option value="18:30">6:30 PM</html:option>
								<html:option value="19:00">7:00 PM</html:option><html:option value="19:30">7:30 PM</html:option>
								<html:option value="20:00">8:00 PM</html:option><html:option value="20:30">8:30 PM</html:option>
								<html:option value="21:00">9:00 PM</html:option><html:option value="21:30">9:30 PM</html:option>
								<html:option value="22:00">10:00 PM</html:option><html:option value="22:30">10:30 PM</html:option>
								<html:option value="23:00">11:00 PM</html:option><html:option value="23:30">11:30 PM</html:option>
							</html:select>
							&nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/28/176/en/start-exam-date-and-end-exam-date.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Dates"></a>
							</p>	
							<p>
                                  <label>Public Exam URL:</label>          
                                  	<%
                                  	String URL = request.getServerName();
                                  	int portNo =request.getServerPort();
                                  	if(URL.equals("localhost")) {
                                  		URL +=  ":" +  portNo + request.getContextPath();
                                  	} else {
                                  		URL +=  request.getContextPath();
                                  	}
                                  	%>
                                      <%= request.getScheme()%>://<%=URL%>/exam/
                                          <html:text property="publicURL" style="width:80px;" onblur="checkExamURL(this.value);"/>
                             &nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/21/138/en/schedule-public-exam-by-url.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Public Exam URL"></a>
                                          <small class="more_info">Please use this URL if you want exam can be given publicly without registration.</small>                                 
                             </p>
                             
                             
                             
                             <p>
                                  <label>Questions for Exam:</label>                                 
                                  <html:select property="quesSequence" styleId="selectquesSequence">
                                  		<html:option value="1">Randomize</html:option>
										<html:option value="0">Sequential</html:option>
								  </html:select>                                 
                             &nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/19/131/en/sequence-of-questions-in-exam.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Questions in Exam"></a>
                             </p>
                             
                             
							<p>
								<label>Timezone:</label>
								<html:select property="timezoneId" styleId="selectTimezoneId">
									<logic:present name="timezoneList">
										<logic:iterate id="timezone" name="timezoneList">
											<html:option value="${timezone.timezoneId}">
												(GMT <bean:write name="timezone" property="gmtOffset"
													filter="true" />) <bean:write name="timezone" property="timezoneName"
													filter="true" />
											</html:option>
										</logic:iterate>
									</logic:present>
								</html:select>
							&nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/29/164/en/timezone-feature-in-kaldin.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Timezone"></a>	
							</p>
							<p><label>Send Result Email:</label>
								<html:select property="sendResultEmail" styleId="sendResultEmail">
                                 		<html:option value="1">Yes</html:option>
									<html:option value="0">No</html:option>
						  		</html:select>
						  		&nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/31/173/en/send-result-email-to-candidates.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Result Email"></a>
							</p>
							<p><label>Allow Multiple Exam:</label>
								<html:select property="multiplePublicExam" onchange="javaScript:checkOpenSource();" styleId="multiplePublicExam">
                                 	<html:option value="1">Yes</html:option>
									<html:option value="0">No</html:option>
						  		</html:select>
						  		&nbsp;&nbsp;<a href="http://help.kaldin.com/faq/content/21/179/en/allow-your-candidates-to-take-same-exam-multiple-times.html" target="_new"><img src="<%=request.getContextPath()%>/images/help_on.gif" title="Help on Multiple Exams"></a>
						  		<small class="more_info">This option is only applicable for candidate/users giving Public Exams</small>
							</p>
						</div>


						<div class="table_top">
							<label>Select Group:</label>
							<html:select property="groupid" styleId="groupid"
								onchange="return getTestDetails('user');">
								<html:option value="0">All Groups</html:option>
								<logic:iterate id="showResult" name="groupList">
									<html:option value='${showResult.groupid}'>
										<bean:write name="showResult" property="groupname"
											filter="true" />
									</html:option>
								</logic:iterate>
							</html:select>
							&nbsp;<a href="<%=request.getContextPath()%>/CreateUser.do"
								class="btn_green_sml">Add more users to Exam</a>
						</div>
						<div>
						<table id="example" class="display">
							<thead>
								<tr>
									<th rowspan="1" colspan="1" width="10%"><input
										type="checkbox" onchange="selectEmail()" name="selectemail"></th>
									<th rowspan="1" colspan="1" width="35%">Group</th>
									<th rowspan="1" colspan="1" width="*">Email ID</th>
								</tr>
							</tbody>
						</table>
						</div>
						<div>
							<button type="button" class="btn_green" onclick="doSubmit('<%=isEditableDisable%>');return false;">Schedule Exam</button>
						</div>
								
					</html:form>
				</div>
			</div>
		</div>
		</div>
	<script type="text/javascript">
								$(function() {
									$("#tdate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,minDate:-0});
								});
							</script>
							<script type="text/javascript">
								$(function() {
									$("#edate").datepicker({dateFormat: 'dd-M-yy',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,minDate:-0});
								});
								$(document).ready(function() { 
									$("#selectTimezoneId").select2({
										placeholder: "",
										allowClear: true
									});
									$(".ui-datepicker-trigger").mouseover(function() {
									    $(this).css('cursor', 'pointer');
									});
								});
							</script>
	<script>
<logic:present name="TestId">
var list = document.getElementById('selectTest');

for (var intI = 0; intI < list.options.length; intI++) {
  if (list.options[intI].value == "${TestId}") {
	    list.options[intI].selected = true;
  }
}
</logic:present>
<logic:present name="GroupId">
var list = document.getElementById('groupid');
for (var intI = 0; intI < list.options.length; intI++) {
  if (list.options[intI].value == "${GroupId}") {
	    list.options[intI].selected = true;
  }
}
</logic:present>


<%String testid = request.getParameter("fromqpr");
			if (testid == null || testid == "" || testid.equalsIgnoreCase("")
					|| testid.equals(null)) {
			} else {%>
			document.forms["ScheduleTestForm"].testId.value= '<%=testid%>';
		<%}%>
	
	</script>
<script type="application/javascript">
$(".paginate_enabled_previous").click( function() {
	document.forms["ScheduleTestForm"].userId.checked=false;
});
$(".paginate_enabled_next").click( function() {
	document.forms["ScheduleTestForm"].userId.checked=false;
});
</script>	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
