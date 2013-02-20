

<!--- cget TagID --->
<cfstoredproc procedure="ap_getGroupID" datasource="dsSDF"  >
	<cfprocparam cfsqltype="CF_SQL_VARCHAR" dbvarname="@groupname" value="#form.tag#" >
	<cfprocparam cfsqltype="CF_SQL_INTEGER" type="OUT" variable="GroupID" dbvarname="@ID" null="true"  >
</cfstoredproc>	


<cfdump var="#GroupID#">