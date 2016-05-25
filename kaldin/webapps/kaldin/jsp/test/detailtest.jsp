<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Test Detail - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css" />
<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js?dt=19aug2013" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common/UserHome.js?dt=19aug2013"></script>
<script>
	history.go(1);
</script>
</head>

<body>
<div id="wrapper">
  <div id="header">
    <h1><a href="#" id="logo"></a></h1>
    <!--TITLE ENDS HERE-->
	<div id="topnav">
      <ul>
        <li>welcome-
        <logic:present name="LogedUser">
			<bean:write name="LogedUser" filter="true"/>
		</logic:present> 
		<logic:notPresent name="LogedUser">
			<jsp:forward page="/jsp/common/UserLogin.jsp"></jsp:forward>
		</logic:notPresent></li>
		<li><a href="logout.do"
		style="font-weight: bold; color: #ff0000; text-decoration: none;">Logout</a>
		</li>
      </ul>
    </div>
    <!--TOP NAV ENDS HERE--> 
  </div>
  <!--HEADER ENDS HERE-->
  <div id="content">
    <div id="right_section">
       <div id="test_details">
        <logic:present name="Test">
		<ul>
		<li>Test:<bean:write name="Test" property="testName" filter="true"/></li>
		<li>Total Number Of Question's:<bean:write name="Test" property="noOfQuestions" filter="true"/></li>
		<li>Total Mark's:<bean:write name="Test" property="totalMarks" filter="true"/></li>
		<li>Passing Mark's:<bean:write name="Test" property="passingMarks" filter="true"/></li>
		<li>Per Question Mark:<bean:write name="Test" property="perQuestionMarks" filter="true"/></li>
		<li>Negative Per Question Mark:<bean:write name="Test" property="negativeMarks" filter="true"/></li>		
		</ul>
		</logic:present>
      </div>
       <!--TEST DETAILS ENDS HERE-->
        <div id="right_nav">
        <ul>
          <li><a href="<%=request.getContextPath()%>/userhome.do">Home</a></li>
          <li><a href="<%=request.getContextPath()%>/loadtest.do">Given Exams</a></li>
          <li><a href="#">Schedule Exams</a></li>
          <li><a href="<%=request.getContextPath()%>/calluserchangepass.do">Change Password</a></li>
        </ul>
      </div>
      <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE--> 
    
        <div id="left_section">
      <div id="test">
	<logic:present name="TestList">
	<h3>select test</h3>
	<table>
		<logic:present name="ExpireMessge"><bean:write name="ExpireMessge" filter="true"/>
	</logic:present>
	<logic:notPresent name="TestSchduleFlag"><h3 style="padding-top: 200px;padding-left: 200px;">
						There is no schedule exam for you.</h3></logic:notPresent>
	</table>
        <table>
        <logic:present name="TestSchduleFlag">
          <thead>
            <tr>
              <th scope="col">SR. No</th>
              <th scope="col">Test Name</th>
              <th scope="col">Start Date</th>
              <th scope="col">End Date</th>
              <!--<th scope="col">Page Actions</th>-->
            </tr>
          </thead>
          </logic:present>
          <tbody>
            <% int i=1; %>
					<logic:iterate id="obj" name="TestList">
						<logic:equal value="false" name="obj" property="testGivenflag">
							<tr>
								<td><%=i %></td>
								<td><bean:write name="obj" property="testname" filter="true"/></td>
								<td><bean:write name="obj" property="startDate" filter="true"/></td>
								<td><bean:write name="obj" property="endDate" filter="true"/></td>
								<td><a href="<%=request.getContextPath()%>/detailtestinfo.do?testid=${obj.testId}">
								<h4>Detail</h4></a></td>
								<td><h5 style="font-weight:600;"><a href="<%= request.getContextPath() %>/executetest.do?testid=${obj.testId}">
								<h4>Start Exam</h4></a></h5></td>
								<% i=i+1; %>
							</tr>		
						</logic:equal>				
					</logic:iterate>
	 	</tbody>
	</table>
        <div class="paging" style="padding-top: 200px"> 
        	<a class="visited" href="#">previous</a>&nbsp;&nbsp; 
        	<a href="#" class="visited">1</a> 
        	<a href="#"> 2</a> 
        	<a href="#"> 3</a> 
        	<a href="#"> 4</a>
        	<a href="#"> 5</a> &nbsp;&nbsp; 
        	<a href="#">next</a> 
        </div>
        <!--PAGING ENDS HERE--> 
     	</logic:present>
     	<table>
			<logic:notPresent name="TestList"><h3 style="float: center;padding-top: 150px;padding-left: 200px;">
				There is no schedule exam for you!!</h3></logic:notPresent>
		</table>
      	</div>
      <!--TEST ENDS HERE--> 
    </div>
    <!--LEFT SECTION ENDS HERE-->
  </div>
  <!--CONTENT ENDS HERE-->
  <%@ include file="/jsp/common/footer.jsp"%>
  <!--FOOTER ENDS HERE  --> 
</div>
<!--MAIN ENDS HERE-->
<%@ include file="/jsp/common/analytics.jsp"%> 
</body>
</html>