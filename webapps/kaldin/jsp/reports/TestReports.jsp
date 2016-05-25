<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Test Report - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" charset="utf-8">
	/* Define two custom functions (asc and desc) for string sorting */
	jQuery.fn.dataTableExt.oSort['string-case-asc'] = function(x, y) {
		return ((x < y) ? -1 : ((x > y) ? 1 : 0));
	};

	jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x, y) {
		return ((x < y) ? 1 : ((x > y) ? -1 : 0));
	};

	$(document).ready(function() {
		/* Build the DataTable with third column using our custom sort functions */
		$('#example').dataTable({
			"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
			"aoColumnDefs" : [ {
				"sType" : 'string-case',
				"aTargets" : [ 2 ]
			} ]
		});
	});
</script>

</head>
<body>
		<div>
				<a href="javascript:window.print();"><img src="images/printer.png" alt="print" title="print"  style="float: left;margin-right: 20px;cursor:pointer;" onclick="javascript:window.print();"></a>
				<logic:present name="SelectedTest">
				<label>Exam Name:</label> 
					<bean:write name="SelectedTest" filter="true" /> 
					|
				</logic:present>	
				<label>Report Date:</label>
						<bean:write name="Date" filter="true" />
		</div>	
	
	
		<!--<h3 style="color: maroon; margin-top: 15px" >REPORT</h3>-->
		<!--<h4 align="right"><logic:present name="Date"><bean:write name="Date"/></logic:present></h4>-->
		<!--<h3 style="color: blue;"><logic:present name="SelectedTest">Test : &nbsp;&nbsp;<bean:write name="SelectedTest"/></logic:present></h3><hr>-->
		<logic:present name="TestWiseResult">
		<div>
			<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" style="margin:42px auto; !important;">
				<thead>
					<tr>
						<th width="7%">Sr.No.</th>
						<th>E-mail</th>
						<logic:notPresent name="SelectedTest"><th>Exam Name</th></logic:notPresent>
						<th>Date Taken</th>
						<th>Total Mark</th>
						<th>Obtain Mark</th>
						<th>Remark</th>
					</tr>
				</thead>
				<tbody>
					<%
						int i = 1;
					%>
					<logic:iterate id="TestResult" name="TestWiseResult">
						
						<tr>
							<td><%=i%></td>
							<td><bean:write name="TestResult" property="email" filter="true" /></td>
							<logic:notPresent name="SelectedTest"><td><bean:write name="TestResult" property="testName" filter="true" /></td></logic:notPresent>
							<td><bean:write name="TestResult" property="exmDate" filter="true" /></td>
							<td><bean:write name="TestResult" property="totalMark" filter="true" /></td>
							<td><bean:write name="TestResult" property="mark" filter="true" /></td>
							<td style="text-transform: uppercase;"><bean:write
									name="TestResult" property="remark" filter="true" /></td>
						</tr>
						<%
							i++;
						%>  
					</logic:iterate>
				</tbody>
				<tfoot></tfoot>
			</table>
		</div>
		</logic:present>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
