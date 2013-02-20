<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
	
<script>
// Replaces all instances of the given substring.
String.prototype.replaceAll = function( 
 strTarget, // The substring you want to replace
 strSubString // The string you want to replace in.
 ){
 var strText = this;
 var intIndexOfMatch = strText.indexOf( strTarget );
  
 // Keep looping while an instance of the target string
 // still exists in the string.
 while (intIndexOfMatch != -1){
  // Relace out the current instance.
  strText = strText.replace( strTarget, strSubString )
   
  // Get the index of any next matching substring.
  intIndexOfMatch = strText.indexOf( strTarget );
 }
  
 // Return the updated string with ALL the target strings
 // replaced out with the new substring.
 return( strText );
}
</script>  

</head>
<body >

	<!--- This simple code works --->	
	<cfset searchString = "This is a test" >
	<cfset lookFor = "is" >
	<cfset replaceWith = "<b>is</b>">	
		
	<cfoutput>#ReplaceNoCase(searchString,lookFor,replaceWith,"ALL")#</cfoutput> 
	
	
	<br /><br />

	<!--- This example also works --->
	<cfset qryRecs = QueryNew('Requirement,Verb') >
	<cfset tmp = QueryAddRow(qryRecs,2)>
	<cfset tmp = QuerySetCell(qryRecs,'Requirement','This is a test of query',1)>
	<cfset tmp = QuerySetCell(qryRecs,'Verb','test',1)>
	<cfset tmp = QuerySetCell(qryRecs,'Requirement','This is a second query to watch',2)>
	<cfset tmp = QuerySetCell(qryRecs,'Verb','watch',2)>
	

	<cfoutput query="qryRecs">
		<cfset qryReplaceWith = "<b>"& qryRecs.verb &"</b>" >
		#ReplaceNoCase(qryRecs.Requirement, qryRecs.Verb, qryReplaceWith, "ALL")#
		<br />
	</cfoutput>
	



	<br /><br />


	<!--- this code does not --->
	<cfstoredproc datasource="#ds#" procedure="ap_getRequirements" >
		<cfprocparam cfsqltype="CF_SQL_INTEGER">
		<cfprocresult name="Reqs" >
	</cfstoredproc>


	<cfoutput query="Reqs" >
			<cfset rep = "<b>"& Reqs.verb &"</b>">
			#ReReplaceNoCase(Reqs.requirement, Reqs.verb, rep , "ALL")# 
		<br />
	</cfoutput>
	
	
	<br /><br />
	


<cfoutput query = "Reqs">
      <cfset keyword = reqs.verb >
	  <cfset oldResults = reqs.requirement >
	  <cfset newResults = REReplaceNoCase(VARIABLES.oldResults, "(([^A-Za-z])(#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "\2<b style='background=color:yellow'>\3</b>\4", "ALL")>
	<cfif Left(VARIABLES.newResults, Len(Trim(VARIABLES.keyword))) IS Trim(VARIABLES.keyword)>           
		<cfset newResults = REReplaceNoCase(VARIABLES.newResults, "((#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "<b style='background-color:yellow'>\2</b>\3", "ONE")>       
	</cfif>
		
		#newResults#<br/>
</cfoutput>		
		
</body>
</html>