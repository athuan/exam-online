<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Schedule Test Detail - Kaldin The Knowledge Evaluator</title>
<link href="<%=request.getContextPath()%>/css/style.css"
	rel="stylesheet" type="text/css" />

<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/sorting/jquery.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/sorting/jquery.dataTables.js"></script>
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
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 1 ] }
					]
				} );
			} );

			
		</script>

</head>
<body>
<%
	request.setAttribute("menu", "Test");
%>



<div id="wrapper"><!--	 header end here -->
 <%@ include file="/jsp/common/header.jsp"%>
	
<!--	CONTENT -->
<div id="content">
    <div id="right_section">
      <h3>test</h3>
      <div id="right_nav">
        <ul>
          <li><a href="<%=request.getContextPath()%>/callCreateQuestionPaper.do" >create question paper</a></li>
          <li><a href="<%=request.getContextPath()%>/schdultestlist.do" class="active">scheduled tests</a></li>
	      <li><a href="<%=request.getContextPath()%>/ScheduleTest.do">schedule test</a></li>
          <li><a href="<%=request.getContextPath()%>/sendmail.do">send mail</a></li>
          <li><a href="<%=request.getContextPath()%>/registration.do">Send Registration Link</a></li>
         </ul>
      </div>
       <!-- RIGHT NAV HERE --> 
    </div>
    <!--RIGHT SECTION ENDS HERE-->
<div id="left_section">
	<h3>Test Details</h3>
	<hr />
	<logic:present name="CandidateList">
	<table  class="display" id="example" >
	<thead>
	<tr>
	    <label>Test : <logic:present name="TestName"><bean:write name="TestName" filter="true"/></logic:present>  Start Date: <logic:present name="StartDate"><bean:write name="StartDate" filter="true"/></logic:present>	
		End Date :<logic:present name="EndDate"><bean:write name="EndDate" filter="true"/></logic:present>
		</label>
		<th>Sr No.</th>	
		<th>Email </th>	
	</tr></thead>
	<tbody>
		<%int i=1;%>
		<logic:iterate id="showList" name="CandidateList">
			<tr><td style="text-align: right"><%=i%></td>
			<td colspan="2" style="text-align: center"><bean:write name="showList" property="email" filter="true"/></td>
			
			</tr><%i=i+1; %>
		</logic:iterate>
		</tbody>
		<tfoot>
		</tfoot>
		</table>
	</logic:present>


</div>
</div>

<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
