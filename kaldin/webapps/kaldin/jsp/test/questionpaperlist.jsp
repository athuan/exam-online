<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Question Papers - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/test/questionPaper.js?dt=22nov2013"></script>
<style type="text/css">
a:hover,a:active {
	outline-style: none;
	outline-width: medium;
}
</style>
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
					<li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" class="active">Question Paper</a></li>
					<li><a href="<%=request.getContextPath()%>/schdultestlist.do?operation=LIST">Scheduled Exams</a></li>
				</ul>
				<div class="sidebar_note message note">
				<p>Combine questions from different categories and complexities to create a complete Question Paper.</p>
				<p>
					1. Company ABC created a "First Round" question paper by selection 10 questions from aptitude, 10 from Analytical and 10 from Logical Categories each.
					Company ABC then schedules exams every time they have walk in  interviews.
					</p>
					<p>
					2. College XYZ have questions organized in categories "additions", "Multiplication" and "Division". Question paper "Maths" created using 25 questions from each of these categories and exam is scheduled every year using same question paper.
					</p>
					<p>
					Note: You can choose categories while creating Question papers. Actual questions are selected randomly at the time of actual exam. Hence each question paper is unique in terms of question and order of questions.	
					</p>
					</div>
					
			</div>

			<div id="main">
				<h3>Question Papers</h3>
				<hr />
				<logic:present name="TestMessage">
					<p class="message success">
						<bean:write name="TestMessage" filter="true" />
					</p>
				</logic:present>
				<div class="table_top">
				<a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do?opr=first" class="btn_green_sml">New Question Paper</a>
				</div>
	    		<div id="q_bank" class="filterdiv" style="float: right;">
					<html:form action="SearchTestAction"><html:text property="testname" placeholder="Enter Question Paper Name"/><html:hidden property="startPage" /><html:hidden property="operation" /><button class="btn_green_sml" onclick="doSubmit();"><span>search</span></button></html:form>
				</div>
				<html:form action="callCreateQuestionPaper">
					<logic:present name="TestList">
						<table class="display" id="example" style="margin-top: 40px;">
							<thead>
								<tr>
									<th scope="col">Sr.No.</th>
									<th scope="col">Question Paper</th>
									<th scope="col">Duration</th>
									<th scope="col" >Questions</th>
									<th scope="col">Marks</th>
									<th scope="col">Option</th>									
									<th scope="col">Schedule</th>
								</tr>
							</thead>
							<tbody>
								<%
									int i = 1;
								%>
								<logic:iterate id="showList" name="TestList">
									<tr>
										<td><%=i++%></td>
										<td><bean:write name="showList" property="questionPaperName" filter="true" />
										 <logic:notEqual name="showList" property="examCount" value="0">
											&nbsp;<span class="highlight">(<bean:write name="showList" property="examCount" /> <logic:equal name="showList" property="examCount" value="1">exam</logic:equal><logic:notEqual name="showList" property="examCount" value="1">exams</logic:notEqual>)</span> 
										 </logic:notEqual>
										</td>
										<td><bean:write name="showList" property="duration" filter="true" />&nbsp;Minutes</td>
										<td><bean:write name="showList" property="questions" filter="true" /></td>
										<td><bean:write name="showList" property="totalMarks" filter="true" /></td>
										<td><logic:equal name="showList" property="examCount" value="0">
											<a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do?opr=edit&qp=<bean:write name="showList" property="paperId" />"><img src="<%=request.getContextPath()%>/images/edit.png" title="Edit"></a>
											</logic:equal>
											<logic:notEqual name="showList" property="examCount" value="0">
											<a href="javascript:showAlert();" /><img style="opacity:0.6;" src="<%=request.getContextPath()%>/images/edit.png" title="Edit"></a>
											</logic:notEqual>
										</td>
										<td><a
											href="<%=request.getContextPath()%>/ScheduleTest.do?fromqpr=<bean:write name="showList" property="paperId" />" class="btn_orange_sml">Schedule New
												Exam</a></td>
									</tr>
								</logic:iterate>
							</tbody>
						</table>
					</logic:present>
					<html:hidden property="startPage" value="1"></html:hidden>
				</html:form>
				
				<table style="width:100%">						
					<tr>
					<td>
						<logic:present name="pagingBean">
						<font color="red">Total: <bean:write name="pagingBean" property="count" /></font>
						</logic:present>
					</td>
					<td align="right">
					<%@include file="/jsp/common/paging.jsp" %>
					</td>
					</tr>
				</table>
			</div>
		</div>
	<script type="text/javascript" charset="utf-8">
		<%-- /* Define two custom functions (asc and desc) for string sorting */
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
			
		}); --%>
	</script>

	<script>
		function dopage(page, op) {
			<logic:notPresent name="search">
			document.forms["QuestionPaperForm"].startPage.value = page;
			document.forms["QuestionPaperForm"].submit();
			</logic:notPresent>
			<logic:present name="search">
			document.forms["QuestionPaperForm"].startPage.value = page;
			document.forms["QuestionPaperForm"].operation.value = "list";
			document.forms["QuestionPaperForm"].submit();
			</logic:present>
		}
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
