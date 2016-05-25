<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Feedback - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet"
	type="text/css" />

<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js?dt=19aug2013"> </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.3.2.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.core.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jHtmlArea-0.7.0.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ui.datepicker.js?dt=19aug2013"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/setting/changepassword.js?dt=19aug2013"></script>

</head>
<script type="text/javascript">
function hidemessage(){
	document.getElementById("messagep").style.display="none";
}

</script>

<body>
<%
	request.setAttribute("menu", "Settings");
%>


<!--	 header end here -->
<%@ include file="/jsp/common/header.jsp"%>
<!--	CONTENT -->
<div id="content">
    <div id="right_section">
		        	
      <h3>settings</h3>
      <div id="right_nav">
        <ul>
           <li><a href="<%=request.getContextPath()%>/callimport.do">Import Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/callxlsimport.do">Import Candidate Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/calladminchangepass.do" class="active">Change Password</a></li>
	       <li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
	       <li><a href="<%=request.getContextPath()%>/university.do">University</a></li>
	   
         </ul>
      </div>
      <!-- RIGHT NAV HERE --> 
      <h3>other pages</h3>
      <div id="right_nav">
        <ul>
          <li><a href="<%=request.getContextPath()%>/sitemap.do" title="Go to home page">home</a></li>
          <logic:equal value="QuestionBank" name="menu">
          <li><a href="#" class="active">question bank</a></li>
	  </logic:equal>
	  <logic:notEqual value="QuestionBank" name="menu">
	  <li><a href="Subject.do">question bank</a></li>
          </logic:notEqual>  
		<logic:equal value="Test" name="menu">
					        <li><a href="#" class="active">test</a></li>
		      			</logic:equal>
					    <logic:notEqual value="Test" name="menu">
		        			<li><a href="callCreateQuestionPaper.do">test</a></li>
		      			</logic:notEqual> 
		      			<logic:equal value="Users" name="menu">
					        <li><a href="#" class="active">users</a></li>
		      			</logic:equal>
					    <logic:notEqual value="Users" name="menu">
		        			<li><a href="CreateUser.do">users</a></li>
		      			</logic:notEqual> 
          
          <logic:equal value="Reports" name="menu">
					        <li><a href="#" class="active">reports</a></li>
		      			</logic:equal>
					    <logic:notEqual value="Reports" name="menu">
		        			<li><a href="callTestWiseResult.do">reports</a></li>
		      			</logic:notEqual> 
          
          <li><a href="#">my profile</a></li>
        </ul>
      </div>
      <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE-->
<div id="left_section">
   <label> </label><input type="text" />
   <label></label><input type="text" />
   <label></label><input type="text"/>
</div>
</div>

<script type="text/javascript">
submit1 = function()
{
	doSubmit();
} 
</script>
<%@ include file="/jsp/common/footer.jsp"%></div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>