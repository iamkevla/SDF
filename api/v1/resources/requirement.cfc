	
<cfcomponent extends="taffy.core.resource" taffy:uri="/requirement/{id}" hint="unique requirement">

	<cffunction name="PUT" access="public" output="false" hint="update group">
		<cfargument name="groupname" type="string" required="false" />
		<cfargument name="requirement" type="string" required="false" />
		<cfargument name="verb" type="string" required="false" />
		<cfargument name="noun" type="string" required="false" />
		<cfargument name="status" type="string" required="false" />
		<cfargument name="estimate" type="string" required="false" />
		<cfargument name="projectid"  type="string" required="false" default="" />
		<cfargument name="infrontof" type="string" required="false" />

		<cfset var q = "" />

		<cftry>
			
			<cfif isdefined('arguments.infrontof') > 
				<cfstoredproc datasource="dsSDF" procedure="ap_jumpQueue" >
					<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#arguments.id#" dbvarname="@QueueJumper" />
					<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#arguments.infrontof#" dbvarname="@inFrontOf" />
				</cfstoredproc>
			<cfelse>
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
					<cfif isdefined('arguments.estimate') and ( arguments.estimate neq "" and arguments.estimate neq "null" ) >
						<cfprocparam cfsqltype="cF_SQL_INTEGER" value="#arguments.estimate#" dbvarname="@estimate" />
					</cfif>		
				</cfstoredproc>
			</cfif>

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


	<cffunction name="DELETE" access="public" output="false" hint="delete requirement">

		<cftry>
		
			<cfstoredproc datasource="dsSDF" procedure="ap_deleteRequirement" >
				<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@id" value="#arguments.id#" > 	    
			</cfstoredproc>

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>

		<cfreturn representationOf('').withStatus(200) />		

	</cffunction>


</cfcomponent>
	