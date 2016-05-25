<%@page import="java.text.SimpleDateFormat"%>
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Given Exams - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
<script type="text/javascript">
	function setiframe(resultid) {
		var str = "<iframe height='500' width='730' src='' name='report' id='testiframe' style='min-height: 410px;border:2px;border-color: orange;border-style: solid;height:auto;'></iframe>";
		document.getElementById("iframe").innerHTML = str;
		document.getElementById("testiframe").src = "detailresult.do?resultid="
				+ resultid;
	}
</script>

</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/userhome.do">Scheduled Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/loadtest.do"	class="active">Given Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/callCandidateProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calluserchangepass.do">Change Password</a></li>
				</ul>
				<div class="sidebar_note message note"><p>All attempted exam details.</p></div>
			</div>
			<div id="main">
				<div id="test">
					<h3>Given Exams Details</h3>
						<hr />
						<logic:present name="TestList">
						<table id="giventestdetails" class="display">
							<thead>
								<tr>
									<th scope="col">SR. No</th>
									<th scope="col">Exams Name</th>
									<th scope="col">Start Date</th>
									<th scope="col">End Date</th>
									<th scope="col"></th>
									<!--<th scope="col">Page Actions</th>-->
								</tr>
							</thead>
							<logic:present name="TestList">							
								<tbody>
									<%
										int i = 1;
									%>
									<logic:iterate id="obj" name="TestList">
										
										<tr>
											<td><%=i%></td>
											<td><bean:write name="obj" property="examName" filter="true" /></td>
											<td><bean:write name="obj" property="startDate" filter="true" /></td>
											<td><bean:write name="obj" property="endDate" filter="true" /></td>
											<td><a
												href="<%=request.getContextPath()%>/detailtestinfo.do?testid=${obj.testID}&giventest=true" class="btn_orange_sml">
													Details </a></td>
											<%
												i = i + 1;
											%>
										</tr>
									</logic:iterate>
								</tbody>
							</logic:present>
						</table>
					</logic:present>
					<div id="test_details">
						<logic:present name="Test">
						<p>Exam Details are as follows...</p>
							<ul class="list">
								<li>Question Paper: &nbsp;<bean:write name="Test" property="testName" filter="true" /></li>
								<li>Total Questions: &nbsp;<bean:write name="Test" property="noOfQuestions" filter="true" /></li>
								<li>Total Marks: &nbsp;<bean:write name="Test" property="totalMarks" filter="true" /></li>
								<li>Passing: &nbsp;<bean:write name="Test" property="passingMarks" filter="true" /></li>
								<li>Marks Per Question: &nbsp;<bean:write name="Test" property="perQuestionMarks" filter="true" /></li>
								<li>Negative Marks Per Question: &nbsp;<bean:write name="Test" property="negativeMarks" filter="true" /></li>
							</ul>
						</logic:present>
					</div>
					<logic:equal name="showUserResult"  value="1" >
						<div id="test_details">
							
							<ul class="list">
							<hr/>
							<li>Remark: ${remark}</li>
							<logic:equal name="showSummaryDetails"  value="1" >
								<li>Correct Answers: ${correctAnswer}</li>
								<li>Wrong Answers: ${wrongAnswer}</li>
							</logic:equal>
							</ul>
						</div>
					</logic:equal>
								
								
								
					<center>
						<div id="iframe"></div>
					</center>
				</div>
			</div>
		</div>
	</div>
		<script type="text/javascript" charset="utf-8">
		/* Define two custom functions (asc and desc) for string sorting */
		jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
			return ((x < y) ? -1 : ((x > y) ?  1 : 0));
		};
		
		jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
			return ((x < y) ?  1 : ((x > y) ? -1 : 0));
		};
		
		$(document).ready(function() {
			/* Build the DataTable with third column using our custom sort functions */
			$('#giventestdetails').dataTable( {
				"sLengthMenu":'10',
				"aaSorting": [ [0,'asc'], [1,'asc'] ],
				"aoColumnDefs": [
					{ "sType": 'string-case', "aTargets": [ 2 ] }
				]
			} );	

			Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });			
		} );
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>