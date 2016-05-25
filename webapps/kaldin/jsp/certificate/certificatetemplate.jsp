<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Certificate Templates - Kaldin | Open Source Web-based online examination software</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script>
function deleteTemplate(id){
	document.getElementById("id").value = id;
	document.getElementById("operation").value = "DELETE";
	if(confirm('Are you sure you want to delete the Certificate Template?'))
		document.forms["CertificateTemplateForm"].submit();
}
function getPreview(id){
	window.open("previewcert.do?eid="+id, "Preview Certificate", "width=700px, height=600px,scrollbars=yes, center:yes");
}
</script>
</head>
<body>
	<%
		request.setAttribute("menu", "certificate");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/certificatetemplate.do" class="active">Listing</a></li>
				</ul>
				<div class="sidebar_note">
					<p class="message note">Manage your Certificate templates.</p>
					<p class="message note">In the Certificate template tokens enclosed with $$ will get replaced with real values when Certificate is generated.</p>
				</div>
			</div>
			<div id="main">
				<div style="margin: 0px auto; text-align: center; width: 100%; height: 100%; font-size: 20px;margin-top: 100px;text-align: center;">
					<div>
						This feature is available for SAAS (On Premises) and Commercial versions.<br/>Please visit <a href="http://www.kaldin.com" target="_blank">Kaldin</a> for more details
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" charset="utf-8">
		$(document).ready(function() {
		  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		} );
	</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->		
</body>
</html>