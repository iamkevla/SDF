<cfcomponent extends="taffy.core.resource" taffy:uri="/projects" hint="get Collection of projects">

	<cffunction name="GET" access="public" output="false" hint="get Collection of project">

		<cfset var q = "" />
		
		<cfstoredproc datasource="dsSDF" procedure="ap_getProjects">
			<cfprocresult name="q">
		</cfstoredproc>

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

	<cffunction name="POST" access="public" output="false" hint="create a project">
		<cfargument name="projectname" type="string" required="true" />
		<cfargument name="description" type="string" required="true" />
		<cfargument name="parentid"  type="string" required="false" default="" />

		<cfstoredproc datasource="dsSDF" procedure="ap_insertProject" >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@ProjectName" value="#arguments.projectname#" />
			<cfprocparam cfsqltype="cF_SQL_VARCHAR" dbvarname="@description" value="#arguments.description#" />
			<cfif arguments.parentid eq "">
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" null="true"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" value="#arguments.parentid#" />
			</cfif>
		</cfstoredproc>	

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>

</cfcomponent>