<!--- This page moves a requirement passed thru in the url up down in the queue  --->
<cfquery datasource="#ds#" name="inFrontOf">
	Select ID from tblRequirements with (nolock) where queue = (Select queue from tblRequirements where[id] = #url.id#)+1;
</cfquery>



<cfstoredproc datasource="#ds#" procedure="ap_jumpQueue" >
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#url.id#" dbvarname="@QueueJumper" />
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#inFrontOf.id#" dbvarname="@inFrontOf" />
</cfstoredproc>

<cflocation url="dspRequirements.cfm">