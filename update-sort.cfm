<cfstoredproc datasource="#ds#" procedure="ap_jumpQueue" >
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#url.reqMoved#" dbvarname="@QueueJumper" />
	<cfprocparam cfsqltype="cF_SQL_INTEGER"  value="#url.infrontof#" dbvarname="@inFrontOf" />
</cfstoredproc>

