<cfoutput>Processing...</cfoutput>

<cfstoredproc datasource="#ds#" procedure="ap_deleteRequirement" >
	<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@id" value="#url.id#" > 	    
</cfstoredproc>

<cflocation url="dspRequirements.cfm" >
