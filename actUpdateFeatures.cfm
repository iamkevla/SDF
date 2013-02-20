<cftry>
<!--- if this is a form postback then add the requiremnent --->

	<cfset lst = "" >
	<!--- get a list of the FeatureIDs  --->
	<cfloop list="#form.fieldnames#" index="label" >
		<cfif left(label,7) eq "XCOORD_"> 
			<cfset lst = lst & replace(label,"XCOORD_","")& ",">
		</cfif>	
	</cfloop>

	<cfloop list="#lst#" index="ID">
		<cfset x = form["Xcoord_#ID#"]>
		<cfset y = form["Ycoord_#ID#"]>
		
		<cfstoredproc datasource="#ds#" procedure="ap_editFeature">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@ID" value="#ID#" >
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@Xcoord" value="#x#">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@Ycoord" value="#y#">
		</cfstoredproc>	
	</cfloop>	

	
<cflocation url="dspFeatures.cfm">

<cfcatch type="database">
      <h1>Database Error</h1>
      <cfoutput>
      <ul>
         <li><b>Message:</b> #cfcatch.Message#
         <li><b>Native error code:</b> #cfcatch.NativeErrorCode#
         <li><b>SQLState:</b> #cfcatch.SQLState#
         <li><b>Detail:</b> #cfcatch.Detail#
         </ul>
      </cfoutput>
      <cfset errorCaught = "Database">
	
	<a href="#" onClick="history.go(-1);">back</a>
</cfcatch>
</cftry>