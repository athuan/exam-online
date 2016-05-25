<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Scheduled Exam - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
</head>

<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/headerall.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/userhome.do" class="active">Scheduled Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/loadtest.do">Given Exams</a></li>
					<li><a href="<%=request.getContextPath()%>/callCandidateProfile.do">My Profile</a></li>
					<li><a href="<%=request.getContextPath()%>/calluserchangepass.do">Change Password</a></li>
				</ul>
				<div class="sidebar_note message note"><p>You may review the status of Exam Scheduled for you with exam name/status/date etc.</p></div>
			</div>
			<div id="main">
				<h3>Scheduled Exam</h3>
				<hr />
				<div id="test">
					<logic:present name="ExpireMessge">
						<bean:write name="ExpireMessge" filter="true" />
					</logic:present>

					<logic:notPresent name="TestSchduleFlag">
						<p class="message info">There is no Exam scheduled for you!!!</p>
					</logic:notPresent>
					<logic:present name="message">
						<p class="message invalid"><bean:write name="message" /></p>
					</logic:present>
					<%
						int i = 1;
					%>
					<logic:notPresent name="detail">
						<logic:present name="TestList">
							<table class="display" id="example">
								<thead>
									<tr>
										<th scope="col" width="5%">Sr.No.</th>
										<th>Exam Name</th>
										<th>Start Date</th>
										<th>End Date</th>
										<th>Status</th>
									</tr>
								</thead>
								<tbody>
									<logic:iterate id="obj" name="TestList">	
										<tr>
											<td><%=i++%></td>
											<td><bean:write name="obj" property="examName" filter="true" /> - <bean:write name="obj" property="questionPaperName" filter="true" /></td>
											<td><bean:write name="obj" property="startDate" filter="true" /></td>
											<td><bean:write name="obj" property="endDate" filter="true" /></td>
											<td>
											<logic:equal value="Completed" name="obj" property="examStatus">Expired</logic:equal>
											<logic:equal value="Current" name="obj" property="examStatus">
											<a href="<%=request.getContextPath()%>/detailtestinfo.do?testid=${obj.testID}&examid=${obj.examId}" class="btn_green_sml">Start Exam</a></logic:equal>
											<logic:equal value="Resume" name="obj" property="examStatus">
											<a href="<%=request.getContextPath()%>/executetest.do?testid=${obj.testID}&examid=${obj.examId}" class="btn_green_sml">Resume Exam</a></logic:equal>
											<logic:equal value="Coming" name="obj" property="examStatus">Exam will be available in <bean:write name="obj" property="timezoneTimeDiff" filter="true" /><!-- Not yet started--></logic:equal>
											</td>
										</tr>
									</logic:iterate>
								</tbody>
							</table>
						</logic:present>
					</logic:notPresent>
				</div>
				<!--TEST ENDS HERE-->
				<logic:present name="detail">
					<div id="test_info">
						<logic:present name="Test">
							<ul class="list" style="width: 100%;">
								<li>Total Number Of Questions:<span>&nbsp;<bean:write
											name="Test" property="noOfQuestions" /></span></li>
								<li>Time Duration (in Minutes): <span>&nbsp;<bean:write
											name="Test" property="duration" /></span>
								</li>
								<li>Total Marks:<span>&nbsp;<bean:write name="Test"
											property="totalMarks" /></span></li>
								<!--		<li>Passing Marks:<span ><bean:write name="Test" property="passingMarks"/></span></li>-->
								<li>Per Question Mark:<span>&nbsp;<bean:write name="Test"
											property="perQuestionMarks" /></span></li>
								<li>Negative Per Question Mark:<span>&nbsp;<bean:write
											name="Test" property="negativeMarks" /></span></li>

							</ul>
							<p>
								<a class="btn_green" href="<%=request.getContextPath()%>/showadditionalinfo.do?testid=<bean:write name="detail"/>&examid=<bean:write name="examid"/>"
									> Start Exam </a>
							</p>
						</logic:present>
					</div>
				</logic:present>
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
			$('#example').dataTable( {
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