<div id="header">
    <h1><a href="<%=request.getContextPath()%>/userhome.do"><img src="<%=request.getContextPath()%>/images/logo-blue.png" alt="kaldin" /></a></h1>
		<ul id="nav">
			<li><logic:present name="LogedUser">
					<a href="<%=request.getContextPath()%>/logout.do" title="Logout">Logout</a>
				</logic:present> 
				<logic:notPresent name="LogedUser">
					<a href="<%=request.getContextPath()%>/jsp/common/index.jsp" title="Logout">Login</a>
				</logic:notPresent>
			</li>
			<li></li>
		</ul>
</div>