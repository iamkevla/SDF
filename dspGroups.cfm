<!DOCTYPE html>
<html>
<head>
	<meta name="author" content="Kevin Vlahos" />
	<title>SDF - Groupings</title>
	<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	<script language="javascript">
		function giveFocus(){
			document.getElementById('Group').focus();
		}
	</script>
</head>
<body onLoad="giveFocus()" >
	<div id="content">
	
		<cfinclude template="header.cfm">
	
		<cfinclude template="menu.cfm">
		
	<br />	
	
	
	<cfstoredproc datasource="#ds#" procedure="ap_getGroups">
		<cfprocresult name="Groups">
	</cfstoredproc>
	
	<!--- check if it is a request to edit --->
	<cfif isdefined("url.id")>
		<cfquery dbtype="query" name="GroupName" >
			select GroupName, projectID from Groups where id = #url.id#
		</cfquery>
	<cfelse>
		<cfset GroupName.GroupName = "" >
		<cfset GroupName.ProjectID = "">
	</cfif>

	
	<cfform action="actAddEditGroup.cfm" method="post">
		<cfoutput>
			
		<input type="hidden" name="id" <cfif isdefined("url.id")>value="#url.id#"</cfif>>
		<table id="capture">
			<tr width="100%">
				<td align="right">Grouping:&nbsp</td>
				<td>
					<input name="Group" id="Group" size="50" value="#GroupName.GroupName#" >	 
				</td>
				</cfoutput>	
				<cfstoredproc datasource="#ds#" procedure="ap_getProjects">
					<cfprocresult name="Projects">
				</cfstoredproc>
				
				<td align="right" width="25%"><label>Project:&nbsp</label></td>
				<td>
					<cfselect name="ProjectID">
						<option value="" <cfif groupname.projectid eq "">selected</cfif> >ALL</option>	
						<cfoutput query="Projects">
							<option value="#Projects.ID#" <cfif groupname.projectid eq projects.id >selected</cfif>>#projects.projectname#</option>
						</cfoutput>
					</cfselect>
				</td>
			</tr>	
			<tr>
				<td colspan="4" align="right">
					<input type="submit" name="submit" value="Submit" >
				</td>
			</tr>
		</table>			
	
	</cfform>

	
	<br />
	<br />
	<br />
	<table id="list">
		<tr>
			<th><span class="green">ID</span></th>
			<th><span class="green">Group Name</span></th>
			<th><span class="green">Project</span></th>
		</tr>	
		<cfoutput query="Groups">
		<tr height="20">
			<td>#Groups.id#</td>
			<td width="40%">#Groups.groupname#</td>
			<td width="40%">#Groups.projectname#</td>
			<td><a href="#cgi.SCRIPT_NAME#?id=#groups.id#">edit</a></td>
			<td><a href="actDeleteGroup.cfm?id=#groups.id#">delete</a></td>
		</tr>
		</cfoutput>
	</table>

	<cfinclude template="footer.cfm">

</div>
</body>
</html>