<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Analytics - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.gvChart-1.1.min.js?dt=19aug2013"></script>
<script type="text/javascript">
gvChartInit();
jQuery(document).ready(function(){
	jQuery('#adminpages').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'Page Name'},
			hAxis: {title: 'Visitor Count'},
			width: 700,
			height: 400
			}
	});
	jQuery('#candpages').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'Page Name'},
			hAxis: {title: 'Visitor Count'},
			width: 700,
			height: 400
			}
	});
	jQuery('#browser').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'Browser Type'},
			hAxis: {title: 'Visitor Count'},
			width: 700,
			height: 400
			}
	});
	jQuery('#users').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'User Statistics'},
			hAxis: {title: 'User Count'},
			width: 700,
			height: 400
			}
	});
	jQuery('#errors').gvChart({
		chartType: 'PieChart',
		gvSettings: {
			vAxis: {title: 'Error Type'},
			hAxis: {title: 'Error Count'},
			width: 700,
			height: 400
			}
	});
});
</script>
<style>.dash_small { width: 45%; float: left; position: relative; padding-left: 5px;}</style>
</head>
<body>
<% request.setAttribute("menu", "analytics"); %>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
		 	<div id="middle_section">
				<h3>Analytics</h3>
				<div class="dash_small">
				<table id='adminpages'>
				<caption>Admin Page wise Visit</caption>
				<thead>
					<tr>
						<th></th>
							<logic:iterate name="adminPageCountList" id="adpageList">
								<th><bean:write name="adpageList" property="pageName" /></th>
							</logic:iterate>
					</tr>
				</thead>
					<tbody>
					<tr>
						<th></th>
						<logic:iterate name="adminPageCountList" id="adcountList">
								<td><bean:write name="adcountList" property="count" /></td>
						</logic:iterate>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="dash_small">
				<table id='candpages'>
				<caption>Candidate Page wise Visit</caption>
				<thead>
					<tr>
						<th></th>
							<logic:iterate name="candPageCountList" id="canpageList">
								<th><bean:write name="canpageList" property="pageName" /></th>
							</logic:iterate>
					</tr>
				</thead>
					<tbody>
					<tr>
						<th></th>
						<logic:iterate name="candPageCountList" id="cancountList">
								<td><bean:write name="cancountList" property="count" /></td>
						</logic:iterate>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="dash_small">
				<table id='browser'>
				<caption>Browser wise Visits</caption>
				<thead>
					<tr>
						<th></th>
						<th>IE 7</th>
						<th>IE 8</th>
						<th>IE 9</th>
						<th>IE 10</th>
						<th>Firefox</th>
						<th>Chrome</th>
						<th>Safari</th>
						<th>Opera</th>
						<th>iPhone</th>
						<th>iPad</th>
						<th>iPad</th>
						<th>Android</th>
					</tr>
				</thead>
					<tbody>
					<tr>
						<th></th>
						<td><bean:write name="ie7Count" /></td>
						<td><bean:write name="ie8Count" /></td>
						<td><bean:write name="ie9Count" /></td>
						<td><bean:write name="ie10Count" /></td>
						<td><bean:write name="firefoxCount" /></td>
						<td><bean:write name="chromeCount" /></td>
						<td><bean:write name="safariCount" /></td>
						<td><bean:write name="operaCount" /></td>
						<td><bean:write name="iphoneCount" /></td>
						<td><bean:write name="ipadCount" /></td>
						<td><bean:write name="ipodCount" /></td>
						<td><bean:write name="androidCount" /></td>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="dash_small">
				<table id='users'>
				<caption>Users in Application</caption>
				<thead>
					<tr>
						<th></th>
						<th>Active</th>
						<th>Inactive</th>
						<th>Deleted</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<td><bean:write name="activatedUsers" /></td>
						<td><bean:write name="inactivatedUsers" /></td>
						<td><bean:write name="deletedUsers" /></td>
					</tr>
				</tbody>
				</table>
				</div>
				<div class="dash_small">
				<table id='errors'>
				<caption>Errors in Application</caption>
				<thead>
					<tr>
						<th></th>
						<th>Java</th>
						<th>JSP</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th></th>
						<td><bean:write name="javaCount" /></td>
						<td><bean:write name="jspCount" /></td>
					</tr>
				</tbody>
				</table>
				</div>
			</div>
		</div>
	</div>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->	
</body>
</html>