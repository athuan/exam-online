<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Feedback Report - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
</head>
<body>
	<%
		request.setAttribute("menu", "Reports");
	%>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">					
					<li><a href="<%=request.getContextPath()%>/callAdminWiseQuestion.do">Admin	Wise Questions</a></li>
					<li><a href="<%=request.getContextPath()%>/callAdminWiseTest.do">Admin Wise Tests</a></li>
					<li><a href="<%=request.getContextPath()%>/callCompanyWiseUser.do">Company Wise Users</a></li>
					<li><a href="javascript:void(0);" class="active">Feedback Report</a></li>						
				</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
			</div>					
			<div id="main">		
				<h3>Feedback Report</h3>
				<hr/>			
				<div style="padding:10px;">
					<table cellpadding="5" cellspacing="0" class="display" style="clear: none;" id="example">
						<thead>
							<tr>
								<th style="width: 30px;text-align: center;">Sr. No.</th>
								<th style="width:30%">Request Details</th>
								<th style="width:30%">Message</th>
								<th>Screen</th>
							</tr>
						</thead>
						<tbody>
						<logic:present name="feedbacklist">
							<logic:iterate id="feedbackid" name="feedbacklist" indexId="id">
								<tr>
									<td> ${id+1}</td>
									<td>
										IP : ${feedbackid.fbUserIP} <br/>												
										Browser Name : ${feedbackid.fbBrowserName}<br/>
										Browser Version : ${feedbackid.fbBrowserVersion}<br/>
										OS Name : ${feedbackid.fbOsName}<br/>
										Referer : ${feedbackid.fbRefrer}
									</td>
									<td>${feedbackid.fbText}</td>
									<td class="center">
										<a target="_new" href="<%=request.getContextPath()%>/${feedbackid.imagePath}" title="Click to enlarge image">
											<img src="<%=request.getContextPath()%>/${feedbackid.imagePath}" height="150px" width="150px"/>
										</a>
									</td>
								</tr>									
							</logic:iterate>								
						</logic:present>
						<logic:notPresent name="feedbacklist">
							<tr><td colspan="4">No data available.</td></tr>
						</logic:notPresent>
						</tbody>				
					</table>
				</div>		
			</div>			
		</div>
	</div>
<script type="text/javascript" charset="utf-8">
/* Define two custom functions (asc and desc) for string sorting */
jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
	return ((x < y) ?  1 : ((x > y) ? -1 : 0));
};

$(document).ready(function() {
	/* Build the DataTable with third column using our custom sort functions */
	$('#example').dataTable( {
		"aaSorting": [ [0,'asc'] ],
		"aoColumnDefs": [
			{ "sType": 'string-case', "aTargets": [ 2 ] }
		]
	} );		

	 Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
} );
</script>	
</body>
</html>