	
<cfcomponent extends="taffy.core.resource" taffy:uri="/project/{id}" hint="get Collection of projects">

	<cffunction name="PUT" access="public" output="false" hint="update project">
		<cfargument name="projectname" type="string" required="true" />
		<cfargument name="description" type="string" required="true" />
		<cfargument name="parentid"  type="string" required="false" default="" />

		<cfset var q = "" />
		
		<cfstoredproc datasource="dsSDF" procedure="ap_editProject" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER"  value="#arguments.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.projectname#" dbvarname="@projectname"  />
			<cfprocparam cfsqltype="cF_SQL_VARCHAR" value="#arguments.description#" dbvarname="@description"  />
			<cfif arguments.parentid eq "" or arguments.parentid eq "null" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" null="true"  />
			<cfelse>	
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@parentid" value="#arguments.parentid#" />
			</cfif>
		</cfstoredproc>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


	<cffunction name="DELETE" access="public" output="false" hint="delete project">
		
		<cfstoredproc datasource="dsSDF" procedure="ap_deleteProject" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@id" value="#arguments.id#" > 	    
		</cfstoredproc>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


</cfcomponent>
	