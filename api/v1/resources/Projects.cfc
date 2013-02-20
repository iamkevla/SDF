<cfcomponent extends="taffy.core.resource" taffy:uri="/projects/" hint="get Collection of projects">

	<cffunction name="get" access="public" output="false" hint="get Collection of project">

		<cfset var q = "" />
		
		<cfstoredproc datasource="dsSDF" procedure="ap_getProjects">
			<cfprocresult name="q">
		</cfstoredproc>

			
		<cfreturn representationOf(q).withStatus(200) />		

	</cffunction>

</cfcomponent>