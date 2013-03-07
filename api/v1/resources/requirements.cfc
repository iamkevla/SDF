<cfcomponent extends="taffy.core.resource" taffy:uri="/project/{projectid}/requirements" hint="get Collection of requirements">

	<cffunction name="GET" access="public" output="false" hint="get Collection of groups">

		<cfset var q = "" />

		<cfstoredproc datasource="dsSDF" procedure="ap_getRequirements">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#arguments.projectid#" dbvarname="@ProjectID"  />
			<cfprocresult name="q">
		</cfstoredproc>

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

	<cffunction name="POST" access="public" output="false" hint="create a requirement">
		<cfargument name="groupname" type="string" required="true" />
		<cfargument name="requirement" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfargument name="noun" type="string" required="true" />
		<cfargument name="status" type="string" required="true" />
		<cfargument name="estimate" type="string" required="false" />
		<cfargument name="projectid"  type="string" required="false" default="" />

		<cftry>
			
			<!--- get GroupID --->
			<cfstoredproc procedure="ap_getGroupID" datasource="dsSDF"  >
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@groupname" value="#arguments.groupname#" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@ProjectID" value="#val(arguments.projectid)#" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" type="OUT" variable="GroupID" dbvarname="@ID" null="true"  >
			</cfstoredproc>	

			<cfstoredproc datasource="dsSDF" procedure="ap_insertRequirement" >
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.requirement#" dbvarname="@requirement" />
				<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#groupID#" dbvarname="@GroupID" />
				<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#val(arguments.projectid)#" dbvarname="@ProjectID" />
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.verb#" dbvarname="@verb" />
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.noun#" dbvarname="@noun" />
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.status#" dbvarname="@status" />
				<cfif isdefined('arguments.estimate') and arguments.estimate neq "" >
					<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#arguments.estimate#" dbvarname="@estimate" />
				</cfif>	
			</cfstoredproc>	

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>

</cfcomponent>