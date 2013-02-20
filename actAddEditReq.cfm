<!--- if this is a form postback then add the requiremnent --->
<cfif isdefined("form.submit")>
	<!--- is it an edit or an insert --->
	
	<!--- get GroupID --->
	<cfstoredproc procedure="ap_getGroupID" datasource="dsSDF"  >
		<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@groupname" value="#form.Group#" >
		<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@ProjectID" value="#form.projectID#" >
		<cfprocparam cfsqltype="CF_SQL_INTEGER" type="OUT" variable="GroupID" dbvarname="@ID" null="true"  >
	</cfstoredproc>	
	
	
	<cfif form.id eq ''>
		<cfstoredproc datasource="#ds#" procedure="ap_insertRequirement" >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.requirement#" dbvarname="@requirement" />
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#groupID#" dbvarname="@GroupID" />
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#form.projectID#" dbvarname="@ProjectID" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.verb#" dbvarname="@verb" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.noun#" dbvarname="@noun" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.status#" dbvarname="@status" />
			<cfif isdefined('form.estimate') and form.estimate neq "" >
				<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#form.estimate#" dbvarname="@estimate" />
			</cfif>	
		</cfstoredproc>	
	<cfelse>
		<cfstoredproc datasource="#ds#" procedure="ap_editRequirement" >
			<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#form.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.requirement#" dbvarname="@requirement"  />
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#groupid#" dbvarname='@GroupID'>
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#form.projectID#" dbvarname='@ProjectID'>
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.verb#" dbvarname="@verb" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.noun#" dbvarname="@noun" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#form.status#" dbvarname="@status" />
			<cfif isdefined('form.estimate') and form.estimate neq "" >
				<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#form.estimate#" dbvarname="@estimate" />
			</cfif>		
		</cfstoredproc>
	</cfif>
</cfif>
	
<cflocation url="dspRequirements.cfm" addtoken="no">