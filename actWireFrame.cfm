	

<cfif isdefined('form') and not StructIsEmpty(form)>


	<!---- check that they have selected an area by testing width and height --->
	<cfif #form.x1# neq 0 >
		<cftry>
			
			<cfset x= form.x1 + 230 >
			<cfset y= form.y1 + 200 >
	
			<cfstoredproc datasource="#ds#" procedure="ap_createWireframe" >
				<cfprocparam dbvarname="@projectID" cfsqltype="CF_SQL_INTEGER" value="#session.projectID#" >
				<cfprocparam dbvarname="@groupID" cfsqltype="CF_SQL_INTEGER" value="#session.groupID#" >
				<cfprocparam dbvarname="@X1" cfsqltype="CF_SQL_INTEGER" value="#x#" >
				<cfprocparam dbvarname="@Y1" cfsqltype="CF_SQL_INTEGER" value="#y#" >
				<cfprocparam dbvarname="@width" cfsqltype="CF_SQL_INTEGER" value="#FORM.WIDTH#" >
				<cfprocparam dbvarname="@height" cfsqltype="CF_SQL_INTEGER" value="#FORM.HEIGHT#" >
			</cfstoredproc>
	
	
		<cfcatch type="database">
			<h1>Database Error</h1>
		      <cfoutput>
		      <ul>
		         <li><b>Message:</b> #cfcatch.Message#
		         <li><b>Native error code:</b> #cfcatch.NativeErrorCode#
		         <li><b>SQLState:</b> #cfcatch.SQLState#
		         <li><b>Detail:</b> #cfcatch.Detail#
		         </ul>
		      </cfoutput>
		      <cfset errorCaught = "Database">
			
			<a href="#" onClick="history.go(-1);">back</a>
		</cfcatch>
		</cftry>
	</cfif>
<cfelse>

	<cfdump var="#form#" ><cfabort>
			
		<!---#
		<script type="text/javascript" >
			history.back();
		
		</script>
			--->
					
		
</cfif>

<cflocation url="#cgi.HTTP_REFERER#">