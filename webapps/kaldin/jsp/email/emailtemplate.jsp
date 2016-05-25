<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>Email Templates - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
</head>
<body>
	<%
		request.setAttribute("menu", "Setting");
	%>
	<div id="wrapper">
	<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
			<%@ include file="/jsp/common/header.jsp"%>
	<%}else{ %>
		<%@ include file="/jsp/common/adminHeader.jsp"%>
	<%} %>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/emailtemplate.do" class="active">Email Templates</a></li>
					<%if(session.getAttribute("userAdmin") != null && session.getAttribute("userAdmin").equals("userAdmin")){ %>
					<%}else{ %>
<%-- 				    	<li><a href="<%=request.getContextPath()%>/newemailtemplate.do">Add New</a></li> --%>
					<%} %>
					<%if(request.getSession().getAttribute("SuperAdmin") == null){ %>
					<li><a href="<%=request.getContextPath()%>/settings.do">Show Result</a></li>
					<li><a href="<%=request.getContextPath()%>/ProfileRequired.do">User Profile Required</a></li>
					<li><a href="<%=request.getContextPath()%>/customizeui.do">Customize UI</a></li>
					<%} %>
				</ul>
				<div class="sidebar_note">
					<p class="message note">Manage your email templates.</p>
					<p class="message note">In the message template tokens enclosed with $$ will get replaced with real values while sending email.</p>
				</div>
			</div>
			<div id="main">
				<h3>Email Templates</h3>
				<hr />
				<logic:present name="TopicMessage">
					<p class="message success">
						<b><bean:write name="TopicMessage" filter="true" /></b>
					</p>
				</logic:present>
				<logic:present name="Level">
					<div id="dialog"></div>
					<div class="table_top">
						<%if(session.getAttribute("userAdmin") != null && session.getAttribute("userAdmin").equals("userAdmin")){ %>
					    <%}else{ %>
<%-- 						 <a href="<%=request.getContextPath()%>/newemailtemplate.do" class="btn_green_sml">Add New Email Template</a> --%>
					    <%} %>

					</div>
					<table class="display" id="example">
						<thead>
							<tr>
								<th scope="col">Email Type</th>
								<th scope="col">From</th>
								<th scope="col">Subject</th>
<!-- 								<th scope="col">Content</th> -->
								<th scope="col">Edit</th>
							</tr>
						</thead>
						<logic:iterate id="showResult" name="Level">
							<tr>
								<td><bean:write name="showResult" property="mailtype" filter="true" /></td>
								<td><bean:write name="showResult" property="fromfield" filter="true"/></td>
								<td><bean:write name="showResult" property="mailsubject" filter="true" /></td>
<%-- 								<td><bean:write name="showResult" property="mailcontent" filter="true" /></td> --%>
								<td>
									<textarea id="txt_${showResult.id}" style="display:none;">
										<bean:write name="showResult" property="mailcontent" filter="true" />
										<bean:write name="showResult" property="footer" filter="true" />
									</textarea>
									
									<a href="<%=request.getContextPath()%>/newemailtemplate.do?eid=${showResult.id}">
									<img src="<%=request.getContextPath()%>/images/edit.png" title="Edit"></a>
									<a href="javaScript:getPreview(${showResult.id});" ><img src="<%=request.getContextPath()%>/images/view_choose.png" title="Preview"></a>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</logic:present>
			</div>
		</div>
		<iframe class="privew" id="preview" style="position: absolute; top: 170px; right: 150px; height: 300px; display: none; border: 1px solid #AAA; background-color: #FFF; border-radius: 5px; width: 750px;"></iframe>
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
				$(document).click(function(e){
					$(".privew").hide();	
				})
				
				/* Build the DataTable with third column using our custom sort functions */
				$('#example').dataTable( {
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 2 ] }
					]
				} );

				  Feedback({h2cPath: '<%=request.getContextPath()%>' +  '/js/feedback/html2canvas.js' , url:'<%=request.getContextPath()%>' +'/feedback' });
			} );
			getPreview = function(id) {
				//$(".privew").hide();
				//var offset = $('#txt_' + id).position();
				//alert(offset.top);
				//$('#preview').css({"top":offset.top});
				$('#preview').contents().find('body').html($('#txt_' + id).val());
				$('#preview').show();
			}
		</script>
<% com.kaldin.common.PageTimeStats statBean = (com.kaldin.common.PageTimeStats) request.getAttribute("pageTimeStats"); %>
<!-- PAGE TIMING STATISTICS : <%=statBean%>  -->		
</body>
</html>