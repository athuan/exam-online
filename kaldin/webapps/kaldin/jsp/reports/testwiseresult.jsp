<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Exam Results - Kaldin Online Exam to Evaluate Knowledge</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/reports/testwiseresult.js?dt=24feb2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
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
						href="<%=request.getContextPath()%>/callTestWiseResult.do"
						class="active">Exam Wise Result</a></li>
					<li><a
						href="<%=request.getContextPath()%>/callUserWiseResult.do">User
							Wise Result</a></li>					
					<li><a href="<%=request.getContextPath()%>/passfailcount.do">Pass Fail Chart</a></li>					
				</ul>
				<div class="sidebar_note"><p class="message note">You may review Exam wise result with pass/fail.</p></div>
			</div>

			<div id="main">
				<h3>Exam Wise Result</h3>
				<hr />
				<div id="q_bank4" class="filterdiv table_top">
					<html:form action="Report.do">
						<logic:present name="test">
							<label>Exam: </label>
							<html:select property="testID" styleId="testID" style="width:300px">
								<html:option value='0'>All Exams</html:option>
								<logic:iterate id='showResult' name='test'>
									<html:option value="${showResult.testId}">${showResult.testName}</html:option>
								</logic:iterate>
							</html:select>
							&nbsp;
							<label>Filter By: </label>
							<html:select property="filterBy">
								<html:option value='0'>All</html:option>
								<html:option value='PASS'>Pass</html:option>
								<html:option value='FAIL'>Fail</html:option>								
							</html:select>
							&nbsp;&nbsp;<label>Select Date</label> 
							<html:select property="dateRange" styleId="dateRange" onchange="showhidedates();" style="width:175px">
								<html:option value="-1">All</html:option>
								<html:option value="0">Today</html:option>
								<html:option value="1">This Week</html:option>
								<html:option value="2">This Month</html:option>
								<html:option value="3">Last Week</html:option>
								<html:option value="4">Last Month</html:option>
								<html:option value="5">Custom Dates</html:option>
							</html:select>
							<div style="text-align: center; margin-top: 10px;">
								<div id="customdate" style="display:none;float: left;">
								<label>Select Custom Dates</label>
								<html:text property="startDate" styleId="sdate" size="10"/>
								<html:text property="endDate" styleId="edate" size="10"/>
								</div>
								<html:hidden property="operation" value="test" />
								<input type="button" value="Show Report" class="btn_green_sml"	onclick="setiframenew();" />
								<input type="button" value="Export To Excel" class="btn_green_sml" onclick="exportResult();" />
							</div>
						</logic:present>
					</html:form>
				</div>
				<div id="iframe" style="margin-top:100px;"></div>
			</div>
		</div>
</div>
<script type="text/javascript">
	$(document).ready(function() {		
		Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });		
	
		$("#testID").select2({
			placeholder: "",
			allowClear: true
		});
		$("#dateRange").select2().select2('val', '-1');
		$(function() {
			$("#sdate").datepicker({dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0});
		});
		$(function() {
			$("#edate").datepicker({dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0});
		});
	});
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
