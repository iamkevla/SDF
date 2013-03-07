<cfcomponent extends="taffy.core.resource" taffy:uri="/status" hint="get Collection of statuses">

	<cffunction name="GET" access="public" output="false" hint="get Collection of statuses">

		<cfset var q = "" />
		
		<cftry>

			<cfquery datasource="dsSDF" name="q" >
				select [status] from tblStatus with (nolock) order by ID asc;
			</cfquery>

		<cfcatch type="any" >
			<cfreturn representationOf('').withStatus(400) />	
		</cfcatch>
		</cftry>

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

</cfcomponent>