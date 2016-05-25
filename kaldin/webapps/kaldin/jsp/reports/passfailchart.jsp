<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Pass Fail Result in Chart format - Kaldin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<!--[if lt IE 9]><script type="text/javascript" src="<%=request.getContextPath()%>/js/excanvas.js"></script><![endif]-->
<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/js/chart.min.js?dt=14july2014"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ChartNew.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<style>
.graph-container,
.graph-container div,
.graph-container a,
.graph-container span {
	margin: 0;
	padding: 0;
}

/* Gradinet and Rounded Corners */
.graph-container, #tooltip, .graph-info a {
	background: #ffffff;
	background: -moz-linear-gradient(top,  #ffffff 0%, #f9f9f9 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ffffff), color-stop(100%,#f9f9f9));
	background: -webkit-linear-gradient(top,  #ffffff 0%,#f9f9f9 100%);
	background: -o-linear-gradient(top,  #ffffff 0%,#f9f9f9 100%);
	background: -ms-linear-gradient(top,  #ffffff 0%,#f9f9f9 100%);
	background: linear-gradient(to bottom,  #ffffff 0%,#f9f9f9 100%);

	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

/*  Graph Container */
.graph-container {
	position: relative;
	width: 95%;
	height: 650px;
	padding: 20px;
	
	-webkit-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
	-moz-box-shadow: 0px 1px 2px rgba(0,0,0,.1);
	box-shadow: 0px 1px 2px rgba(0,0,0,.1);
}

.graph-container > div {
	position: absolute;
	width: inherit;
	height: inherit;
	top: 10px;
	left: 60px;
}

.graph-info {
	width: 100%;
	margin-bottom: 10px;
	margin-top: 50px;
}

/* Links */
.graph-info a {
	position: relative;
	display: inline-block;
	float: left;
	padding: 7px 10px 5px 30px;
	margin-right: 10px;
	text-decoration: none;
	cursor: default;
}

/* Color Circle for Links */
.graph-info a:before {
	position: absolute;
	display: block;
	content: '';
	width: 8px;
	height: 8px;
	top: 13px;
	left: 13px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
}
/* Colors For each Link */
.graph-info .pass { border-bottom: 2px solid #71c73e; }
.graph-info .fail { border-bottom: 2px solid #F8102C; }

.graph-info .pass:before { background: #71c73e; }
.graph-info .fail:before { background: #F8102C; }

/* Lines & Bars Buttons */
#lines, #bars {
	width: 34px;
	height: 32px;
	padding: 0;
	margin-right: 0;
	margin-left: 10px;
	border-bottom: 2px solid #71c73e;
	float: right;
	cursor: pointer;
}

#lines.active, #bars.active {
	background: #82d344;
	background: -moz-linear-gradient(top,  #82d344 0%, #71c73e 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#82d344), color-stop(100%,#71c73e));
	background: -webkit-linear-gradient(top,  #82d344 0%,#71c73e 100%);
	background: -o-linear-gradient(top,  #82d344 0%,#71c73e 100%);
	background: -ms-linear-gradient(top,  #82d344 0%,#71c73e 100%);
	background: linear-gradient(to bottom,  #82d344 0%,#71c73e 100%);
}

#lines span, #bars span {
	display: block;
	width: 34px;
	height: 32px;
	background: url('images/lines.png') no-repeat 9px 12px;
}

#bars span { background: url('images/bars.png') no-repeat center 10px; }

#lines.active span { background-image: url('images/lines_active.png'); }
#bars.active span { background-image: url('images/bars_active.png'); }
/* Clear Floats */
.graph-info:before, .graph-info:after,
.graph-container:before, .graph-container:after {
	content: '';
	display: block;
	clear: both;
}
</style>
</head>
<body>
	<%
		request.setAttribute("menu", "Reports");
	%>

	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/callTestWiseResult.do">Exam Wise Result</a></li>
					<li><a href="<%=request.getContextPath()%>/callUserWiseResult.do">User Wise Result</a></li>
					<li><a href="<%=request.getContextPath()%>/passfailcount.do" class="active">Pass Fail Chart</a></li>					
				</ul>
				<div class="sidebar_note"><p class="message note">You may review Chart with pass/fail.</p></div>
			</div>

			<div id="main">
				<h3>Pass Fail Result in Chart format</h3>
				<hr />
				<div id="q_bank4" class="filterdiv table_top">
					<html:form action="passfailcount.do">
						<div  style="float: left;">
							<label>Filter By Date: </label>
							<html:select property="dateRange" styleId="dateRange" onchange="showhidedates();" style="width:175px">
								<html:option value="0">Today</html:option>
								<html:option value="1">Yesterday</html:option>
								<html:option value="2">This Week</html:option>
								<html:option value="3">This Month</html:option>
								<html:option value="4">This Year</html:option>
								<html:option value="5">Last Week</html:option>
								<html:option value="6">Last Month</html:option>
								<html:option value="7">Last Year</html:option>
								<html:option value="8">Custom Dates</html:option>
							</html:select>
							&nbsp;&nbsp;
						</div>
						<div style="float: left;">
							<div id="customdate" style="display:none;float: left;">
								<label>Select Custom Dates</label>
								<html:text property="startDate" styleId="sdate" size="10"/>
								<html:text property="endDate" styleId="edate" size="10"/>
							</div>
							<html:hidden property="operation" value="test" />
						</div>
						<input type="submit" value="Show Report" class="btn_green_sml" />
					</html:form>
				</div>
				<div id="graph-wrapper" >
					<div class="graph-info" style="padding:3px;">
<!-- 						<a href="javascript:void(0)" class="pass">Pass</a> -->
<!-- 						<a href="javascript:void(0)" class="fail">Fail</a> -->
					</div>
					<div class="graph-container">
						<div id="graph-bars"><canvas id="canvasbar" height="400" width="900" ></canvas></div>
					</div>
				</div>
			</div>
		</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {		
		$("#dateRange").select2({
			placeholder: "",
			allowClear: true
		});
		//$("#dateRange").select2().select2('val', '5');
		
		$(function() {
			$("#sdate").datepicker({
				dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0,
				onSelect: function (selectedDate) {
	                var date2 = $('#sdate').datepicker('getDate');
	                date2.setDate(date2.getDate() + 1);
	                $('#edate').datepicker('setDate', date2);
	                $('#edate').datepicker('option', 'minDate', date2);
	                $('#edate').datepicker('option', 'maxDate', date2.getDate());
	            }
			});
		});
		
		$(function() {
			$("#edate").datepicker({dateFormat: 'yy-m-dd',showOn: 'both', buttonImage: 'images/cal.png', buttonImageOnly: true,maxDate:-0,
	       	 onClose: function () {
	                var dt1 = $('#sdate').datepicker('getDate');
	                var dt2 = $('#edate').datepicker('getDate');
	                if (dt2 <= dt1) {
	                	alert("Please select end date greater than start date");
	                	dt1.setDate(dt1.getDate() + 1);
	  	                $('#edate').datepicker('setDate', dt1);
	                }
	                var diff = (dt2 - dt1)/1000/60/60/24;
	                if (diff > 30) {
	                    alert("Max Allowed Range for Dates is of 1 Month");
	                    dt1.setDate(dt1.getDate() + 30);
	                    $('#edate').datepicker('setDate', dt1);
	                }
	            }	
			});
		});
		$('#graph-bars').show();
		var dataLabels = ${labels};
		var passCount = ${passCounts};
		var failCount = ${failCounts};
		var barChartData = {
				labels : dataLabels,
				datasets : [
					{
						label: 'Pass Candidates',
						fillColor : "#DCF3CE",
						strokeColor : "#71c73e",
						data : passCount
					},
					{
						label: 'Fail Candidates',
						fillColor : "#ffd4d4",
						strokeColor : "#F8102C",
						data : failCount
					}
				]
				
			}
		
		function annotateAllX(area,ctx,data,statData,posi,posj,othervars) {
			retstring='<B><U>'+statData[posi][posj].v2+'</U></B><BR>';
			for(var i=0;i< data.datasets.length;i++){
				if(typeof statData[i][posj].datavalue!="undefined" && data.datasets[i].type != "Line"){
					var boxLegend="<canvas id=\"canvas_Line"+posi+"_"+posj+"\" height=\"10\" width=\"30\" style=\"border:1px solid black; background : "+data.datasets[i].fillColor+"\"></canvas>";
					retstring=retstring+boxLegend+" "+statData[i][posj].v1+"="+statData[i][posj].datavalue+"<BR>";
				}
			}
			return retstring;
		}
		
		var newopts = {
				scaleShowLabels: true,
				scaleShowGridLines : false,
				responsive: true,
				yAxisLabel : "No of Candidates",
				xAxisLabel : "Exam Dates",
				yAxisMinimumInterval : 5,
				annotateDisplay : true, 
				dynamicDisplay : true,
				legend : true,
				annotateLabel: annotateAllX
		}
		
		var myBar = new Chart(document.getElementById("canvasbar").getContext("2d")).Bar(barChartData,newopts);
		
		showhidedates();
	});
	function showhidedates(){
		var selValue = document.ReportForm.dateRange.options[document.ReportForm.dateRange.selectedIndex].value;
		if(selValue == 8){
			document.getElementById("customdate").style.display='';
		}else{
			document.getElementById("customdate").style.display='none';
		}
	}
</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
