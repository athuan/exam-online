<%@ include file="/jsp/common/includetags.jsp" %>
<!DOCTYPE HTML>
<html lang="en">
<head>
<meta charset=utf-8>
<title>University - Kaldin The Knowledge Evaluator</title>
<%@ include file="/jsp/common/cssinclude.jsp"%>
<%@ include file="/jsp/common/scriptinclude.jsp"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/select/select2.js?dt=19aug2013"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/select/select2.css"  type="text/css" media="screen" />
<script type="text/javascript">

function doUniversityDelete(universityid){	
	var frm =document.forms["UniversityInfoForm"];
	frm.universityId.value= universityid;
	frm.operation.value="DELETE";
	if(confirm('Do you want to delete this record ?')) {
		frm.submit();
	}	
}

function addUniversity() {
	 
	var frm=document.forms["UniversityInfoForm"];
	frm.universityName.value="";
	frm.city.value="";
	//frm.state.value="";
	$("#country").val(0);
	frm.zip.value="";
	frm.operation.value="ADD";

	$("#editdialog1").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#editdialog1").dialog('option', 'title', "Enter University Details");
	$("#editdialog1").dialog('option', 'show', 'drop');
    $("#editdialog1").dialog('option', 'resizable', true)
	$("#editdialog1").dialog('open');
}

function showEditDialog1(id,name,city,state,country,zip){
	
	var frm=document.forms["UniversityInfoForm"];
	frm.universityId.value=id;	
	frm.universityName.value=name;
	frm.city.value=city;
	$("#country").val(country);
	setState(state);
	frm.zip.value=zip;
	frm.operation.value="EDIT"

	$("#editdialog1").dialog({ autoOpen: true, height: 'auto', width: 'auto', modal: true, closeOnEscape:false });
    $("#editdialog1").dialog('option', 'title', "Enter University Details");
	$("#editdialog1").dialog('option', 'show', 'drop');
    $("#editdialog1").dialog('option', 'resizable', true)
	$("#editdialog1").dialog('open');
   
}

function validateUniversity()
{
	var dailog = document.getElementById("university"); 			
	if(dailog.universityName.value==""||dailog.city.value==""||dailog.state.value==""||
			dailog.country.value==""||dailog.zip.value=="")
	{
		alert("Fill All the Fields");
		return false;
	}else{
          return true;
		}	
}
function setState(stateId) {
	var frm = document.forms["UniversityInfoForm"];
	var countryId = document.UniversityInfoForm.country.options[document.UniversityInfoForm.country.selectedIndex].value;

	$.post("showstate.do", {
		companyId : countryId,
		stateId : stateId
	}, function(data) {
		if (data == null) {
			message(container, "States Not Found");
		} else {
			document.getElementById("state").innerHTML = data;
		}
	});
}
</script>

<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/sorting/jquery.dataTables.js"></script>
		<script type="text/javascript" charset="utf-8">

			/* Define two custom functions (asc and desc) for string sorting */
			jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
				return ((x < y) ? -1 : ((x > y) ?  1 : 0));
			};
			
			jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
				return ((x < y) ?  1 : ((x > y) ? -1 : 0));
			};
			
			$(document).ready(function() {
				/* Build the DataTable with third column using our custom sort functions */
				$('#example').dataTable( {
					"aaSorting": [ [0,'asc'], [1,'asc'] ],
					"aoColumnDefs": [
						{ "sType": 'string-case', "aTargets": [ 2 ] }
					]
				} );
				$("#country").select2({
					placeholder: "",
					allowClear: true
				});
			} );			
		</script>		
</head>
<body>

<div id="wrapper">
		<%@ include file="/jsp/common/adminHeader.jsp"%>
		<div id="content">
			<div id="sidebar">
				<ul class="sidebar_nav">
					<li><a href="<%=request.getContextPath()%>/university.do" class="active">University Management</a></li>
				</ul>
				<div class="sidebar_note message note"><p>University Listing and Management</p>
					<p>Adding a University makes a Global Impact to Candidate Profile, listing them in the drop down</p>
				</div>
			</div>
      		<div id="main">
				<h3>University Listing</h3>
				<hr>
				 <div id="editdialog1" style="display: none;">
					<html:form action="/universityEdit" styleId="university">	
					 <table>
							<tr align="right"> 
								<td>University Name:</td>
								<td align="left"><html:text property="universityName" value="" size="30px"/></td>
							</tr> 
							<tr align="right"> 
								<td>City:</td>
								<td align="left""><html:text property="city" value=""/></td>
							</tr > 
							<tr align="right">	
								<td>Country:</td> 
								<td align="left">
									<logic:present name="CountryList">
										<html:select property="country" styleId="country" onchange="setState('')" style="width:200px">
											<logic:iterate id="Country" name="CountryList">
												<html:option value='${Country.countryId}'>${Country.countryName}</html:option>
											</logic:iterate>
										</html:select>
									</logic:present>
								</td>
							</tr> 
							<tr align="right">	
								<td>State: </td>
								<td align="left"><div id="state" style="float: left;">
											<select>
												<option style="width: 156px">Select State:</option>
											</select>
										</div>
								</td>
							</tr> 
							<tr align="right">	
								<td>Zip/Pincode:</td>
								<td align="left"> <html:text property="zip" value=""/>	</td>
							</tr>
						</table>
						<center><html:submit value="Save" styleClass="btn_green" onclick="return validateUniversity();"/></center>			
						<html:hidden property="operation"></html:hidden>
						<html:hidden property="universityId"></html:hidden>
				   </html:form>
				   	<script type="text/javascript">
						setState(0);
					</script>			
					</div>
   
					<logic:present name="universityList">     		   
						<logic:present name="message">
							<h4 align="center" style="color: red;"><bean:write name="message" filter="true"/></h4>
						</logic:present>
      
				       <table id="example" class="display" >
						 <thead>		       
								<tr>
									<th>ID</th>
									<th>Name</th>
									<th>City</th>
									<th>state</th>
									<th>country</th>
									<th>zip</th>
									<th>Edit</th>
									<th>Delete</th>			
								</tr>
							</thead>
							<tbody>    		
				           	<logic:iterate id='unilist' name='universityList'> 
				              <tr>
				                <td>${unilist.universityId}</td>
				                <td>${unilist.universityName}</td>
				                <td>${unilist.city}</td>
				                <td>${unilist.state}</td>
				                <td>${unilist.country}</td>
				                <td>${unilist.zip}</td>
				                <td><a href="#" onclick="showEditDialog1(${unilist.universityId},'${unilist.universityName}','${unilist.city}','${unilist.state}','${unilist.country}',${unilist.zip});">
								<img src="<%=request.getContextPath()%>/images/edit.png" title="Edit"> </a> </td>
				                <td><a href="#" class='basicDelete' onclick="return doUniversityDelete(${unilist.universityId});">
								<img src="<%=request.getContextPath()%>/images/delete.png" title="Delete"> </a></td>
				              </tr>
				              </logic:iterate>             
				        	</tbody>        			 
				    	</table>
    					<center><button class="btn_green"  onclick="addUniversity();"><span>Add More</span></button></center>
    				</logic:present>
				    <logic:notPresent name="universityList">
				          <table width="100%">
				           <tr>
				           		<td><label style="font-size: 20px; "> There is no University Name present in List.</label></td>
				          </tr>  
				          </table>
				          <center><button class="btn_green"  onclick="addUniversity();"><span>Add</span></button></center>
				    </logic:notPresent>  
			</div>
		</div>
</div>
</body>
</html>