<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Import Candidates - Kaldin The Knowledge Evaluator</title>

<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet"
	type="text/css" />

<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
</head>
<body>
<%
	request.setAttribute("menu", "Settings");
%>



<div id="wrapper"><!--	 header end here -->
<%@ include file="/jsp/common/header.jsp"%>
<!--	CONTENT -->
<div id="content">

    <div id="right_section">
		        	
      <h3>settings</h3>
      <div id="right_nav">
        <ul>
           <li><a href="<%=request.getContextPath()%>/PaymentAction.do">More Question Papers</a></li>
	       <li><a href="<%=request.getContextPath()%>/callxlsimport.do" class="active">Import Candidate Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/callqueimport.do">Import Question Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/Technology.do">Technology</a></li>
           <li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User Profile Required</a></li>
	       <li><a href="<%=request.getContextPath()%>/calladminchangepass.do">Change Password</a></li>
	       <li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
         </ul>
      </div>
      <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE-->
<div id="left_section">
	<div style="width: 100%;">
   <h3>Import Data</h3>
	<p class="message info" >
		Importing Emails From Excel Sheet
		<br/> 1. have a column name 'email' in Excel sheet
		<br/> 2. Fill the email ids in that column
		<br/> 3. Click on import button to import the email ids
	</p>
<div id="q_bank4" style="text-align: center;">
<html:form action="/importXLSData" enctype="multipart/form-data">
<br/><br/>
	<html:file property="candidateData"  />
		<p><br/>
		<input type="submit" value="Import" class="btn_green" >
		</p>
</html:form>
</div>

</div>
</div>
</div>
<%@ include file="/jsp/common/footer.jsp"%>
</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
