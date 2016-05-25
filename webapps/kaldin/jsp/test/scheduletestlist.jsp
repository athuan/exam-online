<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Scheduled Exams - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" charset="utf-8"> 
	/* Define two custom functions (asc and desc) for string sorting */
	jQuery.fn.dataTableExt.oSort['string-case-asc'] = function(x, y) {
		return ((x < y) ? -1 : ((x > y) ? 1 : 0));
	};

	jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x, y) {
		return ((x < y) ? 1 : ((x > y) ? -1 : 0));
	};

	$(document).ready(function() {
		/* Build the DataTable with third column using our custom sort functions */
		$('#example').dataTable({
			"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
			"aoColumnDefs" : [ {
				"sType" : 'string-case',
				"aTargets" : [ 2 ]
			} ]
		});

		 Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		
	});
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Test");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
						<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do">Question Paper</a></li>
						<li><a href="<%=request.getContextPath()%>/schdultestlist.do?operation=LIST" class="active">Scheduled Exams</a></li>
					</ul>
					<div class="sidebar_note"><p class="message note">Schedule Exams by selecting employees/candidates for any of the Question Papers you created.
					
					</p></div>
				</div>
			<div id="main">
				<h3>Scheduled Exams</h3>
					<hr />
				<html:form action="schdultestlist">
					<html:hidden property="startPage" value="1"></html:hidden>
					<html:hidden property="operation" value=""></html:hidden>
					<html:hidden property="testId" />
					<html:hidden property="examID" />
					
					<div class="table_top">				
						<div style="float: left">						
							<html:select property="groupBy" styleId="group"	onchange="dopage();">
								<html:option value="0">All Groups</html:option>
								<logic:present name="groupList">
									<logic:iterate id="showResult" name="groupList">
										<html:option value='${showResult.groupid}'><bean:write name="showResult" property="groupname" filter="true" /></html:option>
									</logic:iterate>
								</logic:present>			
							</html:select>
						</div>						
						<div style="float: left; margin: 0 0 0 10px;">
							<html:select property="statusBy" styleId="status"	onchange="dopage()">
								<html:option value="0">All Status</html:option>								
								<html:option value="completed">Completed</html:option>
								<html:option value="current">Current</html:option>
								<html:option value="coming">Coming</html:option>
							</html:select>
						</div>					
						<a href="<%=request.getContextPath()%>/ScheduleTest.do?operation=LIST" class="btn_green_sml">Schedule New Exam</a>
					</div>
				</html:form>
				<html:form action="/DetailSchduleTestAction">
					<html:hidden property="testId" />
					<html:hidden property="startDate" />
					<html:hidden property="endDate" />
					
					
					
					<logic:present name="SchduleTestList">
						<table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
							<thead>
								<tr>
									<th width="4%">Sr.No.</th>
									<th width="25%">Exam Name</th>
									<th width="15%">Question Paper</th>
									<th width="10%">Start Date</th>
									<th width="10%">End Date</th>
									<th width="5%">Edit</th>
									<th width="20%">Announce Exam</th>
								</tr>
							</thead>
							<tbody>
								<%
									int i = 1;
								%>

								<logic:iterate id="showList" name="SchduleTestList">									
									<tr>
										<td><%=i%></td>
										<td><bean:write name="showList" property="examName" filter="true" />
										<logic:notEqual name="showList" property="examUrl" value="">
										<%
                                  	String URL = request.getServerName();
                                  	int portNo =request.getServerPort();
                                  	if(URL.equals("localhost")) {
                                  		URL +=  ":" +  portNo + request.getContextPath();
                                  	} else {
                                  		URL +=  request.getContextPath();
                                  	}
                                  	%>
                                        <br/><small>Public URL: http://<%=URL%>/exam/<bean:write name="showList" property="examUrl"  filter="true"/></small>
                                        </logic:notEqual>
										</td>
										<td><bean:write name="showList" property="questionPaperName" filter="true" /></td>
										<td><bean:write name="showList" property="startDate" filter="true" /></td>
										<td><bean:write name="showList" property="endDate" filter="true" /></td>
										<td><a href="#"
											onclick="edit('${showList.examId}','${showList.testID}');">
												<img src="<%=request.getContextPath()%>/images/edit.png"
												title="Edit">	</a></td>										
										<td>										
										<logic:notEqual name="showList" property="examStatus" value="Completed">
											<a href="#" onclick="announce('${showList.examId}-${showList.testID}')" class="btn_orange_sml">invite</a>
											<logic:notEqual name="showList" property="noOfInvitedCandidates" value="0">
												<br>(<bean:write name="showList" property="noOfInvitedCandidates" /> invited)
											</logic:notEqual>
											<logic:notEqual name="showList" property="noOfWaitingCandidates" value="0">
												(<bean:write name="showList" property="noOfWaitingCandidates" /> more waiting)
											</logic:notEqual>
										</logic:notEqual>
										<logic:equal name="showList" property="examStatus" value="Completed">
											<bean:write name="showList" property="examStatus" filter="true" />
										</logic:equal>
										</td>
									</tr>
									<%
										i = i + 1;
									%>
								</logic:iterate>
							</tbody>
						</table>
					</logic:present>
				</html:form>
				
				<html:form action="/sendmail">
					<html:hidden property="testdId" />
					<html:hidden property="operation"></html:hidden>
					<html:hidden property="startPage" value="1"></html:hidden>
				</html:form>
			</div></div>
		<script>
			function dopage() {
				document.forms["ScheduleTestForm"].operation.value = "LIST";				
				document.forms["ScheduleTestForm"].submit();
			}
			function edit(examID, testID) {
				document.forms["ScheduleTestForm"].operation.value = "VIEW";	
				document.forms["ScheduleTestForm"].testId.value = testID;
				document.forms["ScheduleTestForm"].examID.value = examID;	
				document.forms["ScheduleTestForm"].action = "ScheduleTest.do";
				document.forms["ScheduleTestForm"].submit();
			}
			function announce(testid) {
				var frm = document.forms["SendMailForm"];
				frm.operation.value = "edit";
				frm.testdId.value = testid
				frm.submit();
			}
			
		</script>
<img height="1" width="1" src='/log/hit.php?pageName=schlist&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />		
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
