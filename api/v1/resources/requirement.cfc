	
<cfcomponent extends="taffy.core.resource" taffy:uri="/requirement/{id}" hint="unique requirement">

	<cffunction name="PUT" access="public" output="false" hint="update group">
		<cfargument name="groupname" type="string" required="true" />
		<cfargument name="requirement" type="string" required="true" />
		<cfargument name="verb" type="string" required="true" />
		<cfargument name="noun" type="string" required="true" />
		<cfargument name="status" type="string" required="true" />
		<cfargument name="estimate" type="string" required="false" />
		<cfargument name="projectid"  type="string" required="false" default="" />

		<cfset var q = "" />

		<!--- get GroupID --->
		<cfstoredproc procedure="ap_getGroupID" datasource="dsSDF"  >
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@groupname" value="#arguments.groupname#" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@ProjectID" value="#val(arguments.projectid)#" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER" type="OUT" variable="GroupID" dbvarname="@ID" null="true"  >
		</cfstoredproc>	
		
		<cfstoredproc datasource="dsSDF" procedure="ap_editRequirement" >
			<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#arguments.id#" dbvarname="@id" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.requirement#" dbvarname="@requirement"  />
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#groupid#" dbvarname='@GroupID'>
			<cfprocparam cfsqltype="CF_SQL_INTEGER" value="#val(arguments.projectid)#" dbvarname='@ProjectID'>
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.verb#" dbvarname="@verb" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.noun#" dbvarname="@noun" />
			<cfprocparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.status#" dbvarname="@status" />
			<cfif isdefined('arguments.estimate') and arguments.estimate neq "" >
				<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#arguments.estimate#" dbvarname="@estimate" />
			</cfif>		
		</cfstoredproc>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


	<cffunction name="DELETE" access="public" output="false" hint="delete requirement">
		
		<cfstoredproc datasource="dsSDF" procedure="ap_deleteRequirement" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@id" value="#arguments.id#" > 	    
		</cfstoredproc>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


</cfcomponent>
	