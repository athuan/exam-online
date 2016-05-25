<logic:present name="pagingBean">
	<logic:notEqual value="0" name="pagingBean" property="pages">
		<logic:notEqual value="1" name="pagingBean" property="startPage">
			<a href="#"
				onclick="dopage(<bean:write name="pagingBean" property="startPage" />-1,'<bean:write name="SearchCriteriaTypes" />');"><bean:message key="jsp.common.paging.page.link.previous"/></a>
		</logic:notEqual>
		<!--  
					-->&nbsp;&nbsp;
		<logic:notEmpty name="pagingBean" property="strStartOfSet">
			<font color='#800000'> <b><a href="#"
					onclick="dopage('<bean:write name="pagingBean" property="strStartOfSet" />','<bean:write name="SearchCriteriaTypes" />');">
						<< </a></b>
			</font>&nbsp;&nbsp;
		</logic:notEmpty>

		<%!int cnt = 0;%>
		<logic:iterate id="collPages" name="pagingBean" property="collPages">
			<%
				cnt = cnt + 1;
			%>

		</logic:iterate>

		<logic:greaterThan value="1" name="pagingBean" property="pages">
			<logic:iterate id="pagesNo" name="pagingBean" property="collPages">
				<!--  code for first(1) page  -->
				<logic:equal name="pagesNo" value='${pagingBean.startPage}'>
					<font color="red"><b><bean:write name="pagesNo" /></b></font>&nbsp;
				                             </logic:equal>
				<!--  code for remaining pages   -->
				<logic:notEqual name="pagesNo" value='${pagingBean.startPage}'>
					<font color='#800000'> <b><a href="#"
							onclick="dopage('<bean:write name="pagesNo" />','<bean:write name="SearchCriteriaTypes" />');"><bean:write
									name="pagesNo" /></a></b>
					</font>&nbsp;
					</logic:notEqual>
			</logic:iterate>
		</logic:greaterThan>

		<logic:notEmpty name="pagingBean" property="strStopOfSet">
			<font color='#800000'> <b> <a href="#"
					onclick="dopage('<bean:write name="pagingBean" property="strStopOfSet" />','<bean:write name="SearchCriteriaTypes" />');">
						>></a></b></font>&nbsp;&nbsp;
					 
		</logic:notEmpty>
	</logic:notEqual>
</logic:present>
<logic:notEqual value="0" name="pagingBean" property="pages">
	<logic:notEqual value="1" name="pagingBean" property="pages">
		<logic:notEqual value='${pagingBean.startPage}' name="pagingBean"
			property="pages">
			<a href="#"
				onclick="dopage(<bean:write name="pagingBean" property="startPage" />+1,'<bean:write name="SearchCriteriaTypes" />');"><bean:message key="jsp.common.paging.page.link.next"/></a>
		</logic:notEqual>
	</logic:notEqual>
</logic:notEqual>