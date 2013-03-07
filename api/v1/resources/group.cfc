<cfcomponent extends="taffy.core.resource" taffy:uri="/group/{id}" hint="get Collection of groupss">

	<cffunction name="PUT" access="public" output="false" hint="update group">
		<cfargument name="groupname" type="string" required="true" />
		<cfargument name="projectid"  type="string" required="false" default="" />

		<cfset var q = "" />
		
		<cftry>
		<cfstoredproc datasource="dsSDF" procedure="ap_editGroup" >
			<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#arguments.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.groupname#" dbvarname="@groupname"  />
			<cfif arguments.projectID eq "" or arguments.projectID eq "null" >
					<cfprocparam cfsqltype="CF_SQL_VARCHAR" null="true" dbvarname="@ProjectID"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.projectID#" dbvarname="@ProjectID"  />
			</cfif>
		</cfstoredproc>

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


	<cffunction name="DELETE" access="public" output="false" hint="delete project">

		<cftry>
			<cfstoredproc datasource="dsSDF" procedure="ap_deleteGroup" returncode="true" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@id" value="#arguments.id#" > 	    
			</cfstoredproc>

			<cfif cfstoredproc.statuscode eq 1 >
				<cfreturn representationOf('').withStatus(400) />	
			</cfif>

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>
		
		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


</cfcomponent>
	