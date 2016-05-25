<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Test Details - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/reports/testwiseresult.js?dt=19aug2013"></script>
</head>
<body>
	<%
		request.setAttribute("menu", "Reports");
	%>
	<div id="wrapper"><%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callAdminWiseQuestion.do" class="active">Admin Wise Questions</a></li>
					<li><a href="<%=request.getContextPath()%>/callAdminWiseTest.do">Admin Wise Test</a></li>
					<li><a href="<%=request.getContextPath()%>/callCompanyWiseUser.do">Company Wise Users</a></li>
					<li><a href="<%=request.getContextPath()%>/feedbackReport.do">Feedback Report</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
			</div>
			<div id="main">
			<h3>Admin Wise Questions</h3>
			<hr />
				<div id="q_bank4" class="filterdiv">
					<html:form action="/AdminWiseQuestion">
						<logic:present name="adminlist">
						<div class="table_top">
									<p>
									<label>Select Admin:</label>
									<html:select property="companyId">
											<logic:iterate id='adminResult' name='adminlist'>
												<html:option value="${adminResult.companyId}">${adminResult.email}</html:option>
											</logic:iterate>
										</html:select>
									<input type="submit" value="Show Report" class="btn_green_sml" />
										</p>
										</div>
						</logic:present>
					</html:form>
				</div>
				<br />
				<!-- <div id="contentTable"> -->
				<!--<div id="q_bank" class="filterdiv">-->
				<!--   <div id="contentTable">  -->
				<!--  <div id="q_bank"> -->
				<logic:present name="SubjectList">
					<%
						int i = 1;
					%>
					<table class="display" id="example">
						<thead>
							<tr>
								<th>Sr.No</th>
								<th><b>Categories</b></th>
								<th><b>Questions</b></th>
							</tr>
						</thead>
						<tbody>
							<logic:iterate id="Subject" name="SubjectList">
								<tr>
									<td><%=i%></td>
									<%
										i++;
									%>
									<td>${Subject.subjectName}</td>
									<td>${Subject.quetionCount}</td>
								</tr>
							</logic:iterate>
						</tbody>
					</table>
				</logic:present>

				<br />
				<div id="iframe"></div>
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
				"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
				"aoColumnDefs" : [ {
					"sType" : 'string-case',
					"aTargets" : [ 1 ]
				} ]
			});

			Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		});
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>