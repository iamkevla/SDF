<!--- This page moves a requirement passed thru in the url up one in the queue  --->
<cfquery datasource="#ds#" name="inFrontOf">

select 
	[id] 
from 
	tblRequirements with (nolock) 
where 
	queue = (select 
			max(queue) 
		from 
			tblRequirements with (nolock)
		where 
			queue < (select 
					queue 
				from 
					tblRequirements with (nolock)
				where 
				[ID]=  #url.id#))

</cfquery>

<cfstoredproc datasource="#ds#" procedure="ap_jumpQueue" >
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#url.id#" dbvarname="@QueueJumper" />
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#inFrontOf.id#" dbvarname="@inFrontOf" />
</cfstoredproc>

<cflocation url="dspRequirements.cfm">