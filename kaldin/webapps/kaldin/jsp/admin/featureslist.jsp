<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Manage Features</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript">
function changeFeatureStatus(pkid) {
	var status = document.getElementById("status_"+pkid).value;
	document.getElementById("status").value = status;
	document.getElementById("pkid").value = pkid;
	document.getElementById("check").value = "chk";
	document.forms[0].submit();
}
</script>
</head>
<body>
<% request.setAttribute("menu", "plan"); %>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
						<li><a href="<%=request.getContextPath()%>/plans.do">Plan List</a></li>
						<li><a href="<%=request.getContextPath()%>/newplan.do">Add New Plan</a></li>
						<li><a href="<%=request.getContextPath()%>/assignplan.do">Assign Plan</a></li>
						<li><a href="<%=request.getContextPath()%>/plancontacts.do">Plan Change Request</a></li>
						<li><a href="<%=request.getContextPath()%>/viewtransactions.do">Transaction History</a></li>
						<li><a href="<%=request.getContextPath()%>/managefeatures.do" class="active">Manage Features</a></li>
					</ul>
				<div class="sidebar_note message note"><p>Features Management where features can be enabled or disabled</p>
				<p>1 = Enabled</p><p>0 = Disabled</p></div>
			</div>
			<div id="main">
				<h3>Manage Features</h3>
				<hr>
				<logic:present name="msg">
						<p class="message success" id="messagep">
							<bean:write name="msg" filter="true"></bean:write>
						</p>
				</logic:present>
				<table class="display" id="example">
					<thead>
						<tr>
							<th scope="col">Company ID</th>
							<th scope="col">Type</th>
							<th scope="col">Feature Name</th>
							<th scope="col">Status</th>
							<th scope="col">Option</th>
						</tr>
					</thead>
					<logic:iterate id="featureList" name="featureList">
						<tr>
							<td><bean:write name="featureList" property="cid" /></td>
							<td><bean:write name="featureList" property="type" /></td>
							<td><bean:write name="featureList" property="pkey" /></td>
							<td><logic:equal value="1" name="featureList" property="pvalue" >Enabled</logic:equal>
							<logic:notEqual value="1" name="featureList" property="pvalue" >Disabled</logic:notEqual>
							&nbsp;&nbsp;<input type="text" id="status_${featureList.pkid}" name="status" size="5" value='<bean:write name="featureList" property="pvalue" />'/> 
							</td>
							<td><a class="btn_green" href="javascript:changeFeatureStatus(${featureList.pkid});">Change Status</a></td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<form action="<%=request.getContextPath()%>/managefeatures.do">
				<input type="hidden" name="pkid" id="pkid">
				<input type="hidden" name="status" id="status">
				<input type="hidden" name="check" id="check">
			</form>
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