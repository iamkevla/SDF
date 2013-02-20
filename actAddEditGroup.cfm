<cftry>
<!--- if this is a form postback then add the requiremnent --->
<cfif isdefined("form.submit")>
	<!--- is it an edit or an insert --->
	<cfif form.id eq ''>
		<cfstoredproc datasource="#ds#" procedure="ap_insertGroup" >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.group#" dbvarname="@Groupname" />
			<cfif form.projectID eq "" >
					<cfprocparam cfsqltype="CF_SQL_VARCHAR" null="true" dbvarname="@ProjectID"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.projectID#" dbvarname="@ProjectID"  />
			</cfif>
		</cfstoredproc>	
	<cfelse>
		<cfstoredproc datasource="#ds#" procedure="ap_editGroup" >
			<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#form.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.group#" dbvarname="@groupname"  />
			<cfif form.projectID eq "" >
					<cfprocparam cfsqltype="CF_SQL_VARCHAR" null="true" dbvarname="@ProjectID"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.projectID#" dbvarname="@ProjectID"  />
			</cfif>
		</cfstoredproc>
	</cfif>
</cfif>
	
<cflocation url="dspGroups.cfm">

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