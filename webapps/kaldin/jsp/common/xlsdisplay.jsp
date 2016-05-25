<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<%@ include file="/jsp/common/cssinclude.jsp" %>
</head>
<body>
	<%
		request.setAttribute("menu", "QuestionBank");
	%>
	<div id="wrapper">
		<!-- HEADER -->
		<%@ include file="/jsp/common/header.jsp"%>
		<!-- header end here -->

		<!-- CONTENT -->
		<div id="content">
		    <div id="right_section">
		        	
      <h3>settings</h3>
      <div id="right_nav">
        <ul>
           <li><a href="<%=request.getContextPath()%>/PaymentAction.do">More Question Papers</a></li>
	       <!-- <li><a href="<%=request.getContextPath()%>/callxlsimport.do" class="active">Import Candidate Data</a></li>-->
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
			<br>
			<br>
			<div id='basic-modal'>

				<logic:present name="success">
					<p class="message success" >
						<b><bean:write name="success" filter="true"></bean:write></b>
					</p>
				</logic:present>

				<logic:present name="error">
					<p class="message invalid" >
						<b><bean:write name="error" filter="true"></bean:write></b>
					</p>
				</logic:present>

			</div>
		</div>
	</div>
	</div>
	<%@ include file="/jsp/common/footer.jsp"%>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>





















