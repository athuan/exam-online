<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Sub category wise Questions - Kaldin The Knowledge
	Evaluator</title>
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
						href="<%=request.getContextPath()%>/topicwisequestion.do"
						class="active">Sub Category Wise Questions</a></li>
					<li><a
						href="<%=request.getContextPath()%>/levelwisequestion.do">Complexity
							Wise Questions</a></li>
					<li><a href="<%=request.getContextPath()%>/testpassfail.do">Exam
							Wise Pass Fail</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Schedule Exams by selecting employees/candidates for any of the Question Papers you created.</p></div>
			</div>
			<div id="main">
				<logic:present name="TopicList">
					<h3>Sub category Wise Questions</h3>
					<hr />
					<table class="display" id="example">
						<thead>
							<tr>
								<th><b>Sub category</b></th>
								<th align="center"><b>Questions</b></th>
							</tr>
						</thead>
						<tbody>
							<logic:iterate id="Topic" name="TopicList">
								<tr>
									<td scope="col" width="90%">${Topic.topicName}</td>
									<td align="center" width="10%">${Topic.questionCount}</td>
								</tr>
							</logic:iterate>
						</tbody>
					</table>
				</logic:present>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#chart').visualize({
				type : 'bar',
				height : 300,
				width : 920,
				barMargin : 7
			});
		});
		function callhide(elmId) {
			var objDiv = document.getElementById(elmId)
			if (objDiv.style.display == 'block') {
				objDiv.style.display = 'none';
			} else {
				objDiv.style.display = 'block';
			}
		}
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
