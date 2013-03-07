	
<cfcomponent extends="taffy.core.resource" taffy:uri="/statistics/{id}" hint="statistics service">

	<cffunction name="GET" access="public" output="false" hint="get SQL test statistics">
		<cfargument name="dbname" type="string" required="true" />
		<cfargument name="method" type="string" required="false" />
		
		<cfset var q = "" />

		<cfif isdefined('arguments.method') and  arguments.method eq "new" >
			
			<cfquery datasource="dsSDF" name="q" >
				exec ap_getNewRequirementsStats @ProjectID = #arguments.id#
			</cfquery>

		<cfelseif  isdefined('arguments.method') and 	arguments.method eq "changed" >

			<cfquery datasource="dsSDF" name="q" >
				exec ap_getChangedRequirementsStats @ProjectID = #arguments.id#
			</cfquery>

		<cfelse>

			<cftry>

				<cfquery datasource="dsSDF" name="q" >
					select * from #arguments.dbname#.dbo.tsuLastTestResult with (nolock)
				</cfquery>

			<cfcatch type="any" >
				<cfreturn representationOf('').withStatus(400) />	
			</cfcatch>
			</cftry>

		</cfif>




		

		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

</cfcomponent>
	