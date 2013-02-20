<!--- this page increases a features complexity  --->

<cfstoredproc datasource="#ds#" procedure="ap_increaseFeatureComplexity" > 
	<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@featureID" value="#url.id#" >
</cfstoredproc>



<cflocation url="#cgi.HTTP_REFERER#">