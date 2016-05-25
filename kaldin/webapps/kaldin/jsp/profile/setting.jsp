
<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Setting - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type='text/javascript' src='js/user/createuser.js?dt=19aug2013'></script>
<script type="text/javascript">

function dosubmit(){
	var frm = document.forms[0];
	frm.operation.value = "save";
	frm.submit();
}

function showsummaryDetails(){
	var frm = document.forms[0];
	if(frm.showCandidateResult.value == 1){
		document.getElementById("details").style.display = '';	
	}else if(frm.showCandidateResult.value == 0){
		document.getElementById("details").style.display = 'none';
	}
}
</script>
</head>
<body>
	<%String showCandidateResult = (String)request.getAttribute("showCandidateResult");
	request.setAttribute("menu", "Setting");
	%>
	<div id="wrapper">
		<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
			<%@ include file="/jsp/common/header.jsp"%>
		<%}else{ %>
			<%@ include file="/jsp/common/adminHeader.jsp"%>
		<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/emailtemplate.do">Email Templates</a></li>
					<li><a href="<%=request.getContextPath()%>/settings.do" class="active">Show Result</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User Profile Required</a></li>
					<li><a href="<%=request.getContextPath()%>/customizeui.do">Customize UI</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">Set Show Results To Candidate to 'Yes' , if you want your candidates to view their results after finishing examination</p></div>
			</div>
			<html:form action="/settings">
				<div id="main">
					<div class="regilogin_box">
					
						<h3>Show Result to Candidate</h3>
						<hr />
						<p class="message info">
						Set Show Results To Candidate to 'Yes' , if you want your candidates to view their results after finishing examination
						</p>
						<html:hidden property="operation" value=""></html:hidden>
						
						<p>
                             <label style="width: 180px;">Show Result to Candidate: </label>                                 
                             <html:select property="showCandidateResult" styleId="showCandidateResult" onchange="showsummaryDetails();">
                             	<html:option value="1">Yes</html:option>
								<html:option value="0">No</html:option>
			  				 </html:select>                                 
                        </p>
                        
	                        <p id="details" <%if(showCandidateResult.equals("0")){ %>style="display: none;" <%} %>>
	                             <label style="width: 180px;">Summary/Details: </label>                                 
	                             <html:select property="summaryDetails" styleId="summaryDetails">
	                             	<html:option value="0">Summary</html:option>
									<html:option value="1">Details</html:option>
				  				 </html:select>                                 
	                        </p>
                        
						
						<button class="btn_green" type="button" onclick="dosubmit();">Save</button>						
					</div>
				</div>
			</html:form>
			</div>
</div>
<script type="text/javascript">
   $(document).ready(function() {
     Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
   });
</script>
<%@ include file="/jsp/common/analytics.jsp" %>
</body>
</html>