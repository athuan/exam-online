<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Schedule Test Information - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
</head>
<body>
<div id="maintable">
<div id="main" >
	<%@ include file="/jsp/common/headernew.jsp" %>
	 <div id="content">
    	<div id="content_inner" style="width:940px;height:auto;">
	<form>
		
		
	<logic:present name="TestList">
		<table border="1" width="940px;" style="height: auto;width:940px;" align="center">
		<tr align="center"><td><div style="float: center;color:red;font-size:14px;" align="center">
		<logic:present name="ExpireMessge"><bean:write name="ExpireMessge" filter="true"/></logic:present></div></td></tr><tr>
		<td align="center">
			<logic:notPresent name="TestSchduleFlag"><h3 style="padding-top: 200px;padding-left: 200px;">There is no schedule test for you.</h3></logic:notPresent>
			<table width="700px;" cellspacing="10px;" style="border:2;border-color: black;">
					<logic:present name="TestSchduleFlag">
					<tr align="center">
						<td width="10%"><b>Sr. No.</b></td>
						<td width="25%"><b>Test Name</b></td>
						<td><b>Start Date</b></td>
						<td><b>End Date</b></td>
						
					</tr>
					</logic:present>
					<% int i=1; %>
					<logic:iterate id="obj" name="TestList">
					
						<logic:equal value="false" name="obj" property="testGivenflag">
						<tr align="center">
						<td><%=i %></td>
						<td><bean:write name="obj" property="testname" filter="true"/></td>
						<td><bean:write name="obj" property="startDate" filter="true"/></td>
						<td><bean:write name="obj" property="endDate" filter="true"/></td>
						<td id="widget" style="width:100px;"><a href="<%=request.getContextPath()%>/detailtestinfo.do?testid=${obj.testId}"><h4>Detail</h4></a></td><td></td>
						<td id="widget" style="width:100px;"><h5 style="font-weight:600;"><a href="<%=request.getContextPath()%>/executetest.do?testid=${obj.testId}"><h4>Start Exam</h4></a></h5></td>
						<% i=i+1; %>
						</tr>		
						</logic:equal>	
					
					</logic:iterate>
			</table>
			</td>
					
		</tr>
		</table>
	</logic:present>
		<logic:notPresent name="TestList"><h3 style="float: center;padding-top: 200px;padding-left: 200px;">There is no schedule test for you.</h3></logic:notPresent>
	</form>
	
	</div>
</div>

	<%@ include file="/jsp/common/footernew.jsp" %>
</div>
</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>