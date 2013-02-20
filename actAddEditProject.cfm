<cftry>
<!--- if this is a form postback then add the requiremnent --->
<cfif isdefined("form.submit")>
	<!--- is it an edit or an insert --->
	<cfif form.id eq ''>
		<cfstoredproc datasource="#ds#" procedure="ap_insertProject" >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@ProjectName" value="#form.Project#" />
			<cfprocparam cfsqltype="cF_SQL_VARCHAR" dbvarname="@description" value="#form.description#" />
			<cfif form.parentid eq "">
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" null="true"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" value="#form.parentid#" />
			</cfif>
		</cfstoredproc>	
	<cfelse>
		<cfstoredproc datasource="#ds#" procedure="ap_editProject" >
			<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#form.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.project#" dbvarname="@projectname"  />
			<cfprocparam cfsqltype="cF_SQL_VARCHAR" dbvarname="@description" value="#form.description#" />
			<cfif form.parentid eq "">
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" null="true"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" value="#form.parentid#" />
			</cfif>
		</cfstoredproc>
	</cfif>
</cfif>

<cflocation url="dspProjects.cfm">

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
	
