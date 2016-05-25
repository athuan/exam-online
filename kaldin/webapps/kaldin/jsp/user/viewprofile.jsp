<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>View Profile - Kaldin Online Exam to Evaluate Knowledge</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<style>
.left {
	
    margin-left:180px;
    margin-right: auto; 
    width: 20%;
    margin-top: -0.4%;
    height: 5%;
}

</style>
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
		//$("#dialog").dialog('option', 'show', 'drop');
		$("#dialog").dialog('option', 'resizable', true);
		$("#dialog").dialog('option', 'position', 'top');

		$("#dialog").dialog('open');
		$("#dialog").dialog('defaults','bgiframe',true);
	}

	function doUserDelete(email) {
		var frm = document.forms[0];
		frm.email.value = email;
		frm.operation.value = "delete";
		if (confirm('Do you want to delete this User?')) {
			document.forms[0].submit();
		}
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
				myestr = "<tr><td colspan=4 ><center>Information Is Not Available</center></td></tr></table>";
			document.getElementById('myetable').innerHTML = tstr + myestr + "</table>";

			var myres = "(" + temp[3] + ")";
			var res = eval(myres);
			var mytstr;
			for ( var i = 0; i < res.length; i++) {
				if (i == 0) {
					mytstr = "<tr><td>" + res[i].technology + "</td><td>" + res[i].skills + "</td></tr>";
				} else {
					mytstr += "<tr><td>" + res[i].technology + "</td><td>" + res[i].skills + "</td></tr>";
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
	function getUsers() {
		var frm = document.forms["groups"];
		//frm.action = "/ViewUser.do";
		frm.submit();
	}
	
	function savePassword() {
		var data = $.trim($("#pass").val());
		var dataAgain = $.trim($("#conf").val());
		if (data == '' || dataAgain == '')
			alert("Please enter Password value");
		else if(data != dataAgain)
			alert("Please enter same Password value");
		else {
			var userId = $("#useridpass").val();
			var emailFlag = $('#emailFlag').is(':checked')?"true":"false";
			var passEmail = $('#passEmail').val();
			$.ajax({
				type: "POST",
				url : "changePassword.do",
				data : {
					userId : userId,
					data : data,
					emailFlag : emailFlag,
					passEmail : passEmail
				},
				success : function(data) {
					var res = $.trim(data);
					if(res == 'done') {
						window.location.reload(true);
					} else {
						alert('Error while sending the mail, Please try again.');
					}
				}
			});
			
		}
	}

	resetPassword = function(userid,email) {
		$("#passwordDialog").dialog({
			autoOpen : true, height : '230', width : 'auto', modal : true, closeOnEscape : false
		});
		$("#passwordDialog").dialog('option', 'title', "Change Password");
		$("#passwordDialog").dialog('option', 'show', 'drop');
		$("#passwordDialog").dialog('option', 'resizable', false);
		var strHtml = "<input type='hidden' id='useridpass' value='" + userid + "' /><input type='hidden' id='passEmail' value='" + email + "' /><table>";  
		strHtml += "<tr><td>New Password:</td><td><input type='password' size='5' id='pass'><span class='mandatory'>*</span></td></tr>";
		strHtml += "<tr><td>Confirm Password:</td><td><input type='password' size='5' id='conf'><span class='mandatory'>*</span></td></tr>";
		strHtml += "<tr><td>Send Email:</td><td><input type='checkbox' id='emailFlag'></td></tr>";
		strHtml += "<tr><td colspan='2' align='center'><button onclick='return savePassword();' class='btn_green'>Save</button></td></tr></table>";
		$("#passwordDialog").html(strHtml);
		$("#passwordDialog").dialog('open');
	}
</script>
<script type="text/javascript">
function exportLink(){    // operation 
     var groupId = $("#groupid").val();		
    // var userId= $("userId").val();
	 $.ajax({
	      type: "POST",
	      url: "ViewUser.do",
	      data : {
	    	  operation : "EXPORT_CSV",
	    	  groupid   : groupId,
	    	 // userId	: userId
			},
	      dataType: "text",
	     /*  beforeSend: function() {
	       		alert("Are you sure you want to export");
	  	  }, */
	      success: function(msg){
	        	if(msg!=null)
	        	$("#displayMsg").append(msg);
	        		document.getElementById("displayMsg").innerHTML = msg;
	  	        		//document.forms[0].submit();
	  	 }
	});
}

</script>
</head>

<body>
	<%
		request.setAttribute("menu", "Users");
	%>

	<div id="wrapper">
		<%@ include file="/jsp/common/header.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/group.do">User Groups</a></li>
					<li><a href="<%=request.getContextPath()%>/CreateUser.do">Add User</a></li>
					<li><a href="<%=request.getContextPath()%>/ViewUser.do" class="active">User List</a></li>
					<li><a href="<%=request.getContextPath()%>/importUser.do">Import Users</a></li>
				</ul>
				<div class="sidebar_note"><p class="message note">You can review the user profiles in detail</p></div>
			</div>
			<div id="main">
				<h3>Group Wise User List</h3>
				
				<hr />				
				<div class="table_top">
				<form action="ViewUser.do" name="groups">
				<input type="hidden" name="operation" id="operation"/>
				<input type="hidden" name="email" id="email"/>
				<input type="hidden" name="password" id="password"/>
				<input type="hidden" name="cpassword" id="cpassword"/>
				<input type="hidden" name="status" id="status"/>
				<input type="hidden" name="question" id="question"/>
				<input type="hidden" name="answer" id="answer"/>
				<input type="hidden" name="companyId" id="companyId"/>
				<select name="groupid" id="groupid"
								onchange="return getUsers();">
									<option value="0">All Groups</option>
									<logic:iterate id="showResult" name="groupList">
										<option value='${showResult.groupid}'><bean:write name="showResult" property="groupname" filter="true"  /></option>
									</logic:iterate>
				</select>
				</form>
				<script type="text/javascript">
					<logic:present name="grp">
					var list = document.getElementById('groupid');
					for ( var intI = 0; intI < list.options.length; intI++) {
						if (list.options[intI].value == <bean:write name="grp"/>) {
							list.options[intI].selected = true;
						}
					}
					</logic:present>
				</script>
				</div>
					<div class="left" id="exporttocsv" >
					<html:button property="button" onclick="exportLink();" styleClass="btn_green" >Export</html:button>
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

				<logic:present name="companyUsers">
					<table class="display" id="example">
						<thead>
							<tr>
								<th>Group Name</th>
								<th>User List</th>
								<th>View Profile</th>
								<th>Options</th>
							</tr>
						</thead>
						<tbody>
							<logic:iterate id="user" name="companyUsers">
								<tr>
									<td><bean:write name="user" property="groupname" filter="true" /></td>
									<td><html:hidden property="userId" value="${user.userId}"></html:hidden>
										<bean:write name="user" property="email" filter="true" /></td>
									<td><a href="#" onclick="getProfile('${user.userId}');"><img src="<%=request.getContextPath()%>/images/user.png" alt="View Profile" title="View Profile" /></a>
									&nbsp;&nbsp;
									<a href="javaScript:resetPassword('${user.userId}','${user.email}')" title="Reset Password">Reset Password</a><!-- <img src="< %=request.getContextPath()%>/images/edit.png" /> -->
									</td>
									<td><a href="#" onclick="return doUserDelete('${user.email}');"><img src="<%=request.getContextPath()%>/images/delete.png"	title='<bean:message key="jsp.questionbank.questionshow.page.tooltip.delete"/>'/></a></td>
								</tr>
							</logic:iterate>
								<div id="displayMsg" class="download" ></div>
						</tbody>
						<tfoot>
						</tfoot>
					</table>
				</logic:present>
			</div>
		</div>
		</div>
		<div id="passwordDialog"></div>
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
					"aaSorting" : [ [ 0, 'desc' ], [ 1, 'desc' ] ],
					"aoColumnDefs" : [ {
						"sType" : 'string-case',
						"aTargets" : [ 1 ]
					} ]
				});

				Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
				
			});
		</script>
<img height="1" width="1" src='/log/hit.php?pageName=viewpro&sessionId=<%=session.getId()%>&uid=a-<bean:write name="Admin" property="userId" />&ref=<%=org.apache.commons.lang.StringEscapeUtils.escapeHtml(request.getHeader("referer"))%>' />		
<%@ include file="/jsp/common/analytics.jsp"%>
</body>
</html>
