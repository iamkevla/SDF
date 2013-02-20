<!--- this page generates a set of feature blocks  --->

<cfstoredproc datasource="#ds#" procedure="ap_generateFeatures" > 
	<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@projectID" value="#session.projectID#" >
	<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@groupID" value="#session.groupID#" >	
</cfstoredproc>



<cflocation url="#cgi.HTTP_REFERER#">