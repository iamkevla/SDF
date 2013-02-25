<cfcomponent extends="taffy.core.resource" taffy:uri="/status" hint="get Collection of statuses">

	<cffunction name="GET" access="public" output="false" hint="get Collection of statuses">

		<cfset var q = "" />
		
		<cfquery datasource="dsSDF" name="q" >
			select [status] from tblStatus with (nolock) order by ID asc;
		</cfquery>

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

</cfcomponent>