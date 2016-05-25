<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Exam Statistics</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script type="text/javascript">
function showhidedates(){
	var selValue = document.StatisticsForm.dateRange.options[document.StatisticsForm.dateRange.selectedIndex].value;
	if(selValue == 5){
		document.getElementById("customdate").style.display='';
	}else{
		document.getElementById("customdate").style.display='none';
	}
}	
</script>
</head>
<body>
<% request.setAttribute("menu", "stats"); %>
	<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
				</ul>
				<div class="sidebar_note message note"><p>Exam Statistics Date & Company Wise</p></div>
				<div class="sidebar_note message note"><p>By Default All Companies and Today is used to show the result</p></div>
				<div class="sidebar_note message note"><p>Company id = 0 is equivalent to All Companies </p></div>
			</div>
			<div id="main">
				<h3>Exam Statistics</h3>
				<hr>
				<div>
					<html:form action="/statistics">
						<p><label>Select Company</label> <html:select property="companyid" styleId="companyId" style="width : 350px;">
												<logic:iterate name="companyList" id="companyList">
													<logic:equal name="companyList" property="companyid" value="0">
														<html:option value="${companyList.companyid}">All Companies</html:option>
													</logic:equal>
													<logic:notEqual name="companyList" property="companyid" value="0">
														<html:option value="${companyList.companyid}">${companyList.username} - ${companyList.companyid}</html:option>
													</logic:notEqual>
												</logic:iterate>
											</html:select> 
						&nbsp;&nbsp;<label>Select Date</label> <html:select property="dateRange" styleId="dateRange" style="width : 200px;" onchange="showhidedates();">
											<html:option value="0">Today</html:option>
											<html:option value="1">This Week</html:option>
											<html:option value="2">This Month</html:option>
											<html:option value="3">Last Week</html:option>
											<html:option value="4">Last Month</html:option>
											<html:option value="5">Custom Dates</html:option>
										</html:select>
						</p>
						<p>
						<div id="customdate" style="display:none;">
							<label>Select Custom Dates</label>
							<html:text property="startDate" styleId="sdate" size="10"/>
							<html:text property="endDate" styleId="edate" size="10"/>
						</div>				 
						&nbsp;&nbsp;<input type="submit" value="Filter Statistics" class="btn_green" /> </p>
						<html:hidden property="operation" value="search"/>
					</html:form>
				</div>
				<table class="display" id="example">
					<thead>
						<tr>
							<th scope="col">Company id - User Name</th>
							<th scope="col">Date</th>
							<th scope="col">No of Exams Used</th>
							<th scope="col">Unable to give Exams</th>
							<th scope="col">Contact us Exams</th>
							<th scope="col">Resume Exams</th>
							<th scope="col">Buy Now</th>
						</tr>
					</thead>
					<logic:present name="statsList">
					<logic:notEmpty name="statsList">
						<logic:iterate id="statsList" name="statsList">
							<tr>
								<td><bean:write name="statsList" property="companyid" /> - <bean:write name="statsList" property="username" />
								<br><bean:write name="statsList" property="password" /></td>
								<td><bean:write name="statsList" property="inputdate" /></td>
								<td><bean:write name="statsList" property="noofexamsused" /></td>
								<td><bean:write name="statsList" property="unableexamcount" /></td>
								<td><bean:write name="statsList" property="contactuscount" /></td>
								<td><bean:write name="statsList" property="resumeexamcount" /></td>
								<td><bean:write name="statsList" property="buynowcount" /></td>
							</tr>
						</logic:iterate>
					</logic:notEmpty>
					</logic:present>
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
			$("#companyId").select2({
				placeholder: "",
				allowClear: true
			});
			$("#dateRange").select2({
				placeholder: "",
				allowClear: true
			});
			$(function() {
				$("#sdate").datepicker({dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0});
			});
			$(function() {
				$("#edate").datepicker({dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0});
			});
		} );
	</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->		
</body>
</html>