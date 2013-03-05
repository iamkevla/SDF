	
<cfcomponent extends="taffy.core.resource" taffy:uri="/statistics/{id}" hint="statistics service">

	<cffunction name="GET" access="public" output="false" hint="get SQL test statistics">
		<cfargument name="dbname" type="string" required="true" />
		

		<cfset var q = "" />

		<cfquery datasource="dsSDF" name="q" >
			select * from #arguments.dbname#.dbo.tsuLastTestResult with (nolock)
		</cfquery>

		<cfquery datasource="dsSDF" name="getdataNew" >
				exec ap_getNewRequirementsStats @ProjectID = #arguments.id#
		</cfquery>

		<cfquery datasource="dsSDF" name="getdataChanged" >
				exec ap_getChangedRequirementsStats @ProjectID = #arguments.id#
		</cfquery>
		

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

</cfcomponent>
	