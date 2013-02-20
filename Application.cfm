<cfapplication name="SDF" sessionmanagement="true" >

<cfset ds="dsSDF">


<cfif not isdefined('session.projectID') or isdefined('url.reset')>
	<cfset session.projectID = 1 > <!--- default to SDF Application project --->
	<cfset session.groupID = 2> <!--- also default to Service group --->
	<cfset session.filtered = false >
	<cfset session.showhide = true >
</cfif>


<cferror type = "exception" exception = "lock" template = "err_except.cfm" mailto = "kevin.vlahos@krackas.com">