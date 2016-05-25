    <div id="header">
       <h1><a href="http://www.kaldin.com"><img src="<%=request.getContextPath() %>/images/logo.png" alt="kaldin - knowledge evaluator" /></a>
		</h1>
      <div id="top_nav">
        <ul class="bottom_round">
          <li><a><logic:present name="User">Welcome, <bean:write name="User" property="email" filter="true"/></logic:present></a></li>
          <li><logic:present name="User"><logic:present name="testStarted"><a href="#">logout</a></logic:present>
          	  <logic:notPresent  name="testStarted"><a href="<%= request.getContextPath()%>/logout.do">logout</a></logic:notPresent></logic:present><logic:notPresent name="User"><a href="<%= request.getContextPath()%>/jsp/common/UserLogin.jsp">login</a></logic:notPresent></li>
        </ul>
      
      <!-- top nav end here -->
      <ul id="nav" class="dropdown dropdown-horizontal">
        <li class="moz_l"><logic:present name="testStarted"><a href="#">Home</a></logic:present>
        				<logic:notPresent  name="testStarted"><a href="<%= request.getContextPath()%>/jsp/common/UserLogin.jsp">Home</a></logic:notPresent></li>
        <li><a href="#" class="dir">Test</a>
          <ul>
            <li><logic:present name="testStarted"><a href="#">Given Exams</a></logic:present>
            	<logic:notPresent  name="testStarted"><a href="#">Given Exams</a></logic:notPresent></li>
            <li><logic:present name="testStarted"><a href="#">Schedule Exams</a></logic:present>
	            <logic:notPresent  name="testStarted"><a href="loadtest.do?status=schdule">Schedule Exams</a></logic:notPresent></li>
          </ul>
        </li>
        <li class="moz_r"><a href="#" class="dir">Settings</a>
          <ul>
            <li><logic:present name="testStarted"><a href="#">Change Password</a></logic:present>
            	<logic:notPresent  name="testStarted"><a href="<%= request.getContextPath()%>/calluserchangepass.do">Change Password</a></logic:notPresent></li>
          </ul>
        </li>
    </ul>
      </div>
    </div>
