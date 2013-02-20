<html>
	<head>
		<title>textbox</title>
	</head>	
	<body id="content">
		<!--->
		<cfquery name="groupList" datasource="dsSDF" >
			select * from tblgroups with (nolock);
		</cfquery>
		--->
		<cfstoredproc procedure="ap_getGroups" datasource="dsSDF">
			<cfprocresult name="groupList">
		</cfstoredproc>
		
		<cfset lstGroup = ValueList(groupList.GroupName,",") >
	
		<cfform name="form" action="actTextbox.cfm" method="post">
			<cfinput name="Tag" type="text" Value="" 
						autosuggest="#lstGroup#" required="true" message="This is a required field..">
 			<cfinput type="submit" value="Submit" name="submit">
		</cfform>
	</body>
</html>