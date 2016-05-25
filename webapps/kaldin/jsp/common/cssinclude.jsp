<link type="image/x-icon" href="<%=request.getContextPath()%>/images/favicon.ico" rel="shortcut icon" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.0.css?dt=12jan2016" type="text/css" />
<logic:present name="theme">
<logic:notEqual name="theme" value="0">
<link id="themestyle" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.<bean:write name="theme"/>.css?dt=12jan2016" type="text/css" />
</logic:notEqual>
</logic:present>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/feedback/feedback.css"  type="text/css" media="screen" />