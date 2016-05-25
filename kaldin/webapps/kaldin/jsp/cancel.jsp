<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Payment Cancelled</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {		
		  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
	});	
</script>
</head>
<body>
	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div style="margin: 50px auto; width: 500px;">
				<p class="message success">
					A Payment has been cancelled.
				</p>
			</div>
		</div>
	<%@ include file="/jsp/common/footer.jsp"%>
	</div>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>