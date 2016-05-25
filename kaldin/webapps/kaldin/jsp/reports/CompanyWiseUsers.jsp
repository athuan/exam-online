<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>User Details - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/reports/testwiseresult.js?dt=19aug2013"></script>
<script type="text/javascript">
	showDialog = function() {

		$("#dialog").dialog({
			autoOpen : true,
			height : 'auto',
			width : 'auto',
			modal : true,
			closeOnEscape : false
		});
		$("#dialog").dialog('option', 'title', "Candidate Profile");
		$("#dialog").dialog('option', 'show', 'drop');
		$("#dialog").dialog('option', 'resizable', true);
		$("#dialog").dialog('option', 'position', 'top');

		$("#dialog").dialog('open');
		$.ui.dialog.defaults.bgiframe = true;
	}
	getProfile = function(userid) {
		var frm = document.forms["ProfileForm"];
		$.ajax({
			url : "callProfile.do",
			data : {
				userId : userid,
				op : "getRecord"
			},
			success : function(data) {
				if (data == null) {
					message("User haven't added their details");
				} else {
					var res = eval("data");
					dispProfile(res);
				}
			}
		});
	}

	function dispProfile(str) {
		var temp = new Array();
		temp = str.split("$");
		var res = eval(temp[0]);
		if (res != null) {
			var mystr; var pstr;
			for ( var i = 0; i < res.length; i++) {
				pstr = "<tr><td>" + res[i].firstname + "</td><td>" + res[i].lastname
						+ "</td><td>" + res[i].emailid + "</td><td>"
						+ res[i].birthdate + "</td><td>" + res[i].mobileNumber + "</td><td>" + res[i].city + "</td></tr>";
			}

			tstr ="<table id='academics'><thead><tr><th scope='col'>First Name</th><th scope='col'>Last Name</th><th scope='col'>Email-Id</th>"
				 +"<th scope='col'>Birth Date</th><th scope='col'>MobileNumber</th><th scope='col'>City</th></tr></thead>";
			document.getElementById('myptable').innerHTML = tstr + pstr + "</table>";
			
			var myres = "(" + temp[1] + ")";
			var res = eval(myres);
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					mystr = "<tr><td>" + res[i].qualification + "</td><td>" + res[i].university + "</td><td>"
							+ res[i].passingyear + "</td><td>" + res[i].percentage + "</td></tr>";
				} else {
					mystr = mystr + "<tr><td>" + res[i].qualification + "</td><td>" + res[i].university + "</td><td>"
							+ res[i].passingyear + "</td><td>" + res[i].percentage + "</td></tr>";
				}
			}
			tstr ="<table id='academics'><thead><tr><th scope='col'>Qualification</th><th scope='col'>University/Board</th>"
				 +"<th scope='col'>Yearing of Passing</th><th scope='col'>Percentage/Grade</th></tr></thead>";
		
			if (mystr == undefined)
				mystr = "<tr><td colspan=4><center>Information Is Not Available</center></td></tr>";
			document.getElementById('myatable').innerHTML = tstr + mystr + "</table>";

			var myres = "(" + temp[2] + ")";
			var res = eval(myres);
			var myestr;
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					myestr = "<tr><td>" + res[i].companyname + "</td><td>" + res[i].description + "</td><td>"
							+ res[i].fromdate + "</td><td>" + res[i].todate + "</td></tr>";
				} else {
					myestr = myestr + "<tr><td>" + res[i].companyname + "</td><td>" + res[i].description + "</td><td>"
							+ res[i].fromdate + "</td><td>" + res[i].todate + "</td></tr>";
				}
			}
			tstr ="<table id='academics'><thead><tr><th scope='col'>Company Name</th><th scope='col'>Designation</th>"
				 +"<th scope='col'>From Date</th><th scope='col'>To Date</th></tr></thead>";
		
			if (myestr == undefined)
				myestr = "<tr><td colspan=4 ><center>Information Is Not Available</center></td></tr>";
			document.getElementById('myetable').innerHTML = tstr + myestr + "</table>";

			var myres = "(" + temp[3] + ")";
			var res = eval(myres);
			var mytstr;
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					mytstr = "<tr><td>" + res[i].technology + "</td><td>"
							+ res[i].skills + "</td></tr>";
				} else {
					mytstr += "<tr><td>" + res[i].technology + "</td><td>"
							+ res[i].skills + "</td></tr>";
				}
			}

			if (mytstr == undefined)
				mytstr = "<tr><td colspan=2 ><center>Information Is Not Available</center></td></tr>";

			//document.getElementById('myttable').innerHTML = mytstr;

			showDialog();
		} else {
			alert("User haven't added their details");
		}
	}
</script>
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
						<li><a href="<%=request.getContextPath()%>/callAdminWiseQuestion.do">Admin Wise Questions</a></li>
						<li><a href="<%=request.getContextPath()%>/callAdminWiseTest.do">Admin Wise Test</a></li>
						<li><a href="<%=request.getContextPath()%>/callCompanyWiseUser.do" class="active">Company Wise Users</a></li>
						<li><a href="<%=request.getContextPath()%>/feedbackReport.do">Feedback Report</a></li>
					</ul>
				<div class="sidebar_note"><p class="message note">Message to Displayed on each page below Left side Menu</p></div>
				</div>
			<div id="dialog" style="display: none;">
				<div>
					<div class="rt_tab">
						<div class="rt_tabtab" id="#round_corner">
								<h2>Personal</h2>
								<div id="myptable"></div>
							</div>
							<div class="rt_tabtab" id="#round_corner">
								<h2>Academics</h2>
								<div id="myatable"></div>
							</div>
							<div class="rt_tabtab">
								<h2>Experience</h2>
									<div id="myetable"></div>
							</div>
					</div>
				</div>
			</div>
			<div id="main">
			<h3>Company Wise Users</h3>
			<hr />
				<div id="q_bank4" class="filterdiv">
					<html:form action="/CompanyWiseUser">
						<logic:present name="companylist">
							<div class="table_top">
									<html:select property="companyId">
											<logic:iterate id='company' name='companylist'>
												<html:option value="${company.companyId}">${company.companyName}</html:option>
											</logic:iterate>
										</html:select>
									<input type="submit" value="Show Report" class="btn_green_sml">
							</div>
							
						</logic:present>
						<logic:present name="userCount">
								<span style="margin: 10px 0 0 320px;dispaly: inline-block;">User Count: <bean:write name="userCount"></bean:write>
								</span>
							<logic:present name="compUsersList">
								<table class="display" id="example">
									<thead>
										<tr>
											<th>UserList</th>
											<th>View Profile</th>
										</tr>
									</thead>
									<tbody>
										<logic:iterate id="user" name="compUsersList">
											<tr>
												<td>${user.email}</td>
												<td width="15%"><a href="#" onclick="getProfile('${user.userId}');"><img src="<%=request.getContextPath()%>/images/user.png" alt="View Profile" title="View Profile" /></a></td>
											</tr>
										</logic:iterate>
									</tbody>
								</table>
							</logic:present>
						</logic:present>
					</html:form>
				</div>
			</div>
		</div>
	</div>
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
					"aTargets" : [ 1 ]
				} ]
			});

			  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
		});
	</script>
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>