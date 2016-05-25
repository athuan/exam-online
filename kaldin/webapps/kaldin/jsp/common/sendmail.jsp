<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Send Mail - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	function getUserList() {
		var frm = document.forms[0];
		frm.operation.value = "edit";
		frm.submit();
	}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Test");
	%>



	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%><!--	 header end here -->
		<!--	CONTENT -->
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do">Question Paper</a></li>
					<li><a href="<%=request.getContextPath()%>/schdultestlist.do" class="active">Scheduled Exams</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Additional comment added over here will be included within the scheduled email sent to candidates.</p></div>
			</div>
			<div id="main">
				<h3>Send Mail</h3>
				<hr />
				<html:form action="/sendmail">
				<div class="send_mail">
				<p>
					<label>Select Exam to Send mail:</label>
					<html:select property="testdId" style="width:282px;"
						onchange="getUserList(); return false;">
						<html:option value="0">Select Exam</html:option>
						<logic:present name="testList">
							<logic:iterate id="test" name="testList">
								<html:option value="${test.examId}-${test.testID}">${test.examName} (${test.questionPaperName})</html:option>
							</logic:iterate>
						</logic:present>
					</html:select>
				</p>
				<p>
					<label style="vertical-align: top;">Additional Comments:</label>
					<html:textarea property="comments" rows="4" cols="30"></html:textarea>
				</p>
				<div>
					<table border="0" id="example" class="display">
							<thead>
								<tr>
									<th width="10%"><input
										type="checkbox" onchange="selectUser()" name="selectuser"></th>
									<th width="75%">User Email</th>
									<th width="15%">Mail Send Status</th>
								</tr>
     						</tbody>
						</table>
						</div>
						<div style="text-align: center;">
							<button class="btn_green" onclick="doSubmit();return false;">Send
								Mail</button>
						</div>
					<html:hidden property="operation"></html:hidden>
					<html:hidden property="startPage" value="1"></html:hidden>
				</html:form>

				<!--<div class="paging">-->
				<!---->
				<!--<%@ include file="/jsp/common/paging.jsp"%>-->
				<!---->
				<!--</div> -->
			</div>
		</div>
		
		</div>

	<script type="text/javascript" charset="utf-8">
	
	var contextPath =  '<%=request.getContextPath()%>';
		/* Define two custom functions (asc and desc) for string sorting */
		/*jQuery.fn.dataTableExt.oSort['string-case-asc'] = function(x, y) {
			return ((x < y) ? -1 : ((x > y) ? 1 : 0));
		};

		jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x, y) {
			return ((x < y) ? 1 : ((x > y) ? -1 : 0));
		};*/

		$(document).ready(function() {
			/* Build the DataTable with third column using our custom sort functions */
			var frm = document.forms[0];
			if(frm.operation.value == "VIEW_MAIL"){
				var oTable =	$('#example').dataTable( {
					"aLengthMenu": [
									[20, 50, 100 ,200, -1],
					                [20, 50, 100 ,200, "All"]
					            ],
				     "iDisplayLength": 20,
					 "bProcessing": true,
				     "bServerSide": true,
				     "bDestroy": true, 
				     "sAjaxSource": contextPath+"/sendmail.do?testId="+frm.testdId.value,
	                 "aoColumnDefs": [{ 
										 aTargets: [0],    // Column number which needs to be modified
										 mRender: function (data, userId) {   // o, v contains the object and value for the column
	  										  return '<input type="checkbox" id="userId" name="userId" value="'+data+'"/>';
									},
									sClass: 'tableCell'   // Optional - class to be applied to this table cell
					},{ 
						 aTargets: [2],    // Column number which needs to be modified
						 mRender: function (data, mailSendStatus) {  
							 if(data == 0){
								 data = "N"; 
							 }else{
								 data = "Y";
							 }
							 // o, v contains the object and value for the column
							 return data;
					},
					sClass: 'tableCell'   // Optional - class to be applied to this table cell
					}],
					"bSort": false,
             	    "bStateSave":false,
             	    "bSearchable":true,
             	    "bRegex":true
				});
				
				$('#example_filter input').unbind();
				$('#example_filter input').bind('keyup', function(e) {
				    //if(e.keyCode == 13) {
				        oTable.fnFilter(this.value);   
				    //}
			  }); 
		 }
			Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		});
		
	
		function selectUser() {
			var frm = document.forms[0];
			if (frm.selectuser.checked) {
				for ( var i = 0; i < frm.userId.length; i++)
					frm.userId[i].checked = true;
				frm.userId.checked = true;
			} else {
				for ( var i = 0; i < frm.userId.length; i++)
					frm.userId[i].checked = false;
				frm.userId.checked = false;
			}
			return false;
		}
		
	</script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/sendmail.js?dt=6nov2013"></script>
<img height="1" width="1" src='/log/hit.php?pageName=sendmail&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
