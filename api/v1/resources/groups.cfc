<cfcomponent extends="taffy.core.resource" taffy:uri="/groups" hint="get Collection of groups">

	<cffunction name="GET" access="public" output="false" hint="get Collection of groups">

		<cfset var q = "" />
		
		<cfstoredproc datasource="dsSDF" procedure="ap_getGroups">
			<cfprocresult name="q">
		</cfstoredproc>

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

	<cffunction name="POST" access="public" output="false" hint="create a project">
		<cfargument name="groupname" type="string" required="true" />
		<cfargument name="projectid"  type="string" required="false" default="" />

		<cfstoredproc datasource="dsSDF" procedure="ap_insertGroup" >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.groupname#" dbvarname="@Groupname" />
			<cfif arguments.projectID eq "" or arguments.projectID eq "null" >
					<cfprocparam cfsqltype="CF_SQL_VARCHAR" null="true" dbvarname="@ProjectID"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.projectID#" dbvarname="@ProjectID"  />
			</cfif>
		</cfstoredproc>	

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>

</cfcomponent>