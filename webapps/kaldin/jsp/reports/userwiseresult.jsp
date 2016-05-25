<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>User wise Exam Result - Kaldin Online Exam To Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/reports/userwiseresult.js"></script>
<script type="text/javascript">
	function doSubmit(id) {
		var frm = document.forms[0];
		frm.userId.value = id;
		frm.submit();
	}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "Reports");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
						<li><a
							href="<%=request.getContextPath()%>/callTestWiseResult.do">Exam
								Wise Result</a></li>
						<li><a
							href="<%=request.getContextPath()%>/callUserWiseResult.do"
							class="active">User Wise Result</a></li>
						<li><a href="<%=request.getContextPath()%>/passfailcount.do">Pass Fail Chart</a></li>
					</ul>
					<div class="sidebar_note"><p class="message note">You may review User wise detailed result with correct answer, wrong answer.</p></div>
				</div>
			<div id="main">
				<h3>User Wise Result</h3>
				<hr />
				<div id="q_bank4" class="filterdiv">
					<html:form action="Report">
						<logic:present name="unAttempted">
							<p class="message info"><b><bean:write name="unAttempted" filter="true" /></b></p>
						</logic:present>
						<logic:notPresent name="UserWiseResult">

							<logic:present name="UserList">
								<%
									int userSrNo = 1;
								%>
								<table class="display" id="example">
									<thead>
										<tr>
											<th>User Id</th>
											<th>Email</th>
											<th>View Result</th>
										</tr>
									</thead>
									<tbody>
										<logic:iterate id="User1" name="UserList">
											<tr>
												<td width="10%"><%=userSrNo++%></td>
												<td>${User1.email}</td>
												<td width="20%" align="center"><a href="#" onclick="doSubmit('${User1.userId}');"><img
														src="<%=request.getContextPath()%>/images/view_choose.png"
														alt="View Result" title="View Result" /></a></td>
											</tr>
										</logic:iterate>
									</tbody>
								</table>
								<html:hidden property="userId" />
								<html:hidden property="operation" value="user" />
								<html:hidden property="startPage" value="1" />

							</logic:present>
						</logic:notPresent>
					</html:form>
				</div>
				<logic:present name="UserWiseResult">
					<div class="filterdiv table_top" id="q_bank4">
						<logic:present name="userEmail">
						User Email: <bean:write name="userEmail" filter="true"/>
						</logic:present>
					</div>
					<table id="example" class="display">
						<thead>
							<tr align="center">
								<th>Exam Name</th>
								<th>Exam Date</th>
								<th>Total Mark</th>
								<th>Obtain Mark</th>
								<th>Remark</th>
								<th>Details</th>
								<th></th>
							</tr>
						</thead>
						<logic:iterate id="UserResult" name="UserWiseResult">							
							<tr align="center">
								<td><bean:write name="UserResult" property="testName" filter="true" /></td>
								<td><bean:write name="UserResult" property="exmDate" filter="true" /></td>
								<td><bean:write name="UserResult" property="totalMark" filter="true" /></td>
								<td><bean:write name="UserResult" property="mark" filter="true" /></td>
								<td><bean:write name="UserResult" property="remark" filter="true" /></td>
								<td><button class="btn_green_sml" onclick="setiframe('${UserResult.resultId}')"> Detail Result</button></td>
								<td><logic:notEmpty name="UserResult" property="pdfCertificateName">
									<a target="_new" href="<%=request.getContextPath()%>/certpdfs/<bean:write name="UserResult" property="pdfCertificateName" />"><img src="images/pdf.png" /></a>
								</logic:notEmpty>
							</td>
							</tr>
						</logic:iterate>
					</table>
				</logic:present>
				<center>
					<div id="iframe" style="min-height: 500px; height: auto;"></div>
				</center>
			</div>
		</div>
	</div>
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
// 				"aaSorting" : [ [ 0, 'asc' ] ],
// 				"aoColumnDefs" : [ {
// 					"sType" : 'string-case',
// 					"aTargets" : [ 1 ]
// 				} ]
			  "bSort": false
			});

			Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		});
	</script>
<img height="1" width="1" src='/log/hit.php?pageName=usrres&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />	
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>