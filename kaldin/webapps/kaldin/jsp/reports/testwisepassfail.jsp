<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
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
						href="<%=request.getContextPath()%>/callUserWiseResult.do">User
							Wise Result</a></li>
					<li><a
						href="<%=request.getContextPath()%>/subjectwisequestion.do">Category
							Wise Questions</a></li>
					<li><a
						href="<%=request.getContextPath()%>/topicwisequestion.do">Sub
							category Wise Questions</a></li>
					<li><a
						href="<%=request.getContextPath()%>/levelwisequestion.do">Complexity
							Wise Questions</a></li>
					<li><a href="<%=request.getContextPath()%>/testpassfail.do"
						class="active">Exam Wise Pass Fail</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Schedule Exams by selecting employees/candidates for any of the Question Papers you created.</p></div>
			</div>
			<div id="main">
				<h3>Exam Wise Pass Fail</h3>
				<hr />
				<logic:present name="UserResult">
					<table class="display" id="example">
						<thead>
							<tr>
								<th>Exam Name</th>
								<th scope="col" align="center">Pass</th>
								<th align="center">Fail</th>
							</tr>
						</thead>

						<tbody>
							<logic:iterate id="UserResult" name="UserResult">
								<tr>
									<td width="80%">${UserResult.testName}</td>
									<td align="center" width="10%">${UserResult.passCount}</td>
									<td align="center" width="10%">${UserResult.failCount}</td>
								</tr>
							</logic:iterate>
						</tbody>
					</table>
				</logic:present>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#chart').visualize({
				type : 'bar',
				height : 200,
				width : 300,
				barMargin : 7
			});
		});
	
</script>

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
		});
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
