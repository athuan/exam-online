<div id="header">
  	<logic:notPresent name="logo">
    <h1><a href="<%=request.getContextPath()%>/userhome.do"><img src="<%=request.getContextPath()%>/uploads/logos/logo-blue.png" alt="kaldin" /></a></h1>
    </logic:notPresent>
    <logic:present name="logo">
    <h1><a href="<%=request.getContextPath()%>/userhome.do"><img id="clogo" src="<%=request.getContextPath()%>/uploads/logos/<bean:write name="logo"/>" alt="kaldin" /></a></h1>
    </logic:present>    
		<ul id="nav">
			<li><logic:present name="LogedUser">
				</logic:present> 
				<logic:notPresent name="LogedUser">
					<jsp:forward page="/jsp/common/index.jsp"></jsp:forward>
				</logic:notPresent>
			</li>
			<li><a href="logout.do" title="Logout">Logout</a></li>
		</ul>
</div>