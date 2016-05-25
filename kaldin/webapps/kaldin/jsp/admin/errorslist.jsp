<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Errors - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<style type="text/css">
body {
	overflow-x: auto;
}
</style>
</head>
<body>
<% request.setAttribute("menu", "errors"); %>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
		 	<div id="middle_section">
				<h3>Errors in Application</h3>
				<hr>
				<table class="display" id="example">
					<thead>
						<tr>
							<th scope="col">Where</th>
							<th scope="col">Page Name</th>
							<th scope="col">Type</th>
							<th scope="col">Stack Trace</th>
							<th scope="col">Occurred On</th>
							<th scope="col">User id</th>
						</tr>
					</thead>
					<% int i = 1; %>
					<logic:iterate id="errorsList" name="errorsList">
						<tr <% if( i%2 == 0) { %> class="even" <% } i++; %>>
							<td width="5%"><bean:write name="errorsList" property="intype" /></td>
							<td width="10%"><bean:write name="errorsList" property="actionname" /></td>
							<td width="10%"><bean:write name="errorsList" property="exceptiontype" /></td>
							<td width="60%"><bean:write name="errorsList" property="stacktrace" filter="false" /></td>
							<td width="10%"><bean:write name="errorsList" property="updatedon" /></td>
							<td width="5%"><bean:write name="errorsList" property="userid" /></td>
						</tr>
					</logic:iterate>
				</table>
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
					"sLengthMenu":'10',
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 1 ] }
					]
				} );	
			} );
		</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->		
</body>
</html>