<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Import - Kaldin The Knowledge Evaluator</title>

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
           <li><a href="<%=request.getContextPath()%>/callimport.do" class="active">Import Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/callxlsimport.do">Import Candidate Data</a></li>
	       <li><a href="<%=request.getContextPath()%>/calladminchangepass.do">Change Password</a></li>
	       <li><a href="<%=request.getContextPath()%>/callAdminProfile.do">My Profile</a></li>
	       <li><a href="<%=request.getContextPath()%>/university.do">University</a></li>
	   
         </ul>
      </div>
       <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE-->
<div id="left_section">
 <h3>Import Data</h3> 
<div id="q_bank4">
<html:form action="/import">
        <table style="width: 65%;" align="left">
        	<tr>
        		<td><label>IP Address to Connect</label></td>
        		<td><html:text property="connctionURL"/></td>
        	</tr>
        	<tr>
        		<td><label>Database Name</label></td>
        		<td><html:text property="dbName"/></td>
        	</tr>
        	<tr>
        		<td><label>User Name</label></td>
        		<td><html:text  property="userName"/></td>
        	</tr>
        	<tr>
        		<td><label>Password</label></td>
        		<td><html:password property="password"/></td>
        	</tr>
        	<tr>
        		<td colspan="2"><input type="submit" value="Import" class="btn_green"  /></td>
        	</tr>
        </table>
<!--		<p>-->
<!--		<label>IP Address to Connect</label><html:text property="connctionURL"/>-->
<!--		</p>-->
<!--		<p>-->
<!--		<label>Database Name</label> <html:text property="dbName"/>-->
<!--		</p>-->
<!--		<p>-->
<!--		<label>User Name</label> <html:text  property="userName"/>-->
<!--		</p>-->
<!--		<p>-->
<!--		<label>Password</label><html:password property="password"/>-->
<!--		</p>-->
<!--			<input type="submit" value="Import" class="btn_green"  style="float: left;" />-->
</html:form>


</div>


</div>
</div>
</div>
<%@ include file="/jsp/common/footer.jsp"%></div>
<%@ include file="/jsp/common/feedback.jsp"%>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
