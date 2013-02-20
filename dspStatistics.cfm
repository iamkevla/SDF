<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="author" content="Kevin Vlahos" />
	<title>SDF - Statistics</title>
	<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	<script language="javascript">
		function myOpen(){
			window.location.href='actChangeProject.cfm?ProjectID='+document.myForm.projectID.value;
		}
	</script>	
</head>
<body >
	<div id="content">
		<div id="maincontent">
	
		<cfinclude template="header.cfm">
	
		<cfinclude template="menu.cfm">
		
		<br>
		<br>
		<div id="introduction" >
			<form name="myForm" >
				<!--- get a list of projects to display in a drop box --->
				<cfstoredproc datasource="#ds#" procedure="ap_getProjects" >
					<cfprocresult name="Projects">
				</cfstoredproc>
		
				<select name="projectID" onChange="javascript:myOpen();"  >
					<cfoutput query="projects">
						<option value="#projects.id#" <cfif session.projectID eq projects.id>selected</cfif> >#projects.projectname#</option>
					</cfoutput>
				</select>
			</form>
		</div>	
		<div id="rightside" >
			<h5>Tests Created</h5>
				<cfif #projects.dbName[session.projectID]# neq ''>
					<cfquery datasource="#ds#" name="qryTests" >
						select * from #projects.dbName[session.projectID]#.dbo.tsuLastTestResult with (nolock)
					</cfquery>

					
					<cfoutput>
						<p>
						==========================<br>
						Run tests starts:#qryTests.starttime#<br>
						==========================<br>
						Testsuite: (#qryTests.testcount# tests) execution time : #datediff('s',qryTests.starttime,qryTests.stoptime)#<br>
						Run tests ends: #qryTests.stoptime#
						Summary:
							#qryTests.testcount# tests, of which #qrytests.failurecount# failed and #qryTests.errorcount# had an error. <br>
							<br>
							<cfif #qrytests.success#>SUCCESS!<CFELSE>FAILED X</cfif> <br>
						-----------------------------------------<br>
						==========================<br>
						</p>
					</cfoutput>
					
				<cfelse>
					<p>No testing established</p>	
					
				</cfif>	
				
		</div>

	
		<div id="leftside" >
			<h5>New Requirements</h5>
		
			<cfquery datasource="#ds#" name="getdataNew" >
				exec ap_getNewRequirementsStats @ProjectID = #session.projectID#
			</cfquery>
			
			<cfquery datasource="#ds#" name="getdataChanged" >
				exec ap_getChangedRequirementsStats @ProjectID = #session.projectID#
			</cfquery>
		
			
			<cfchart format="jpg" chartheight="200" chartwidth="500" showxgridlines="no" showygridlines="yes" 
					seriesplacement="stacked" showborder="no" fontbold="no" fontitalic="no" 
					xAxisTitle="Date" yAxisTitle="Requirements per Day" show3d="no" rotated="no" sortxaxis="yes" 
					showlegend="yes" showmarkers="no" >
					
				<cfchartseries 
						type="bar" query="getDataNew" 
						itemColumn="dayReq" valueColumn="sumReq" serieslabel="New"  />
						
				<cfchartseries 
							type="bar" 
							query="getdataCHanged" 
							itemColumn="dayReq" 
							valueColumn="sumReq" serieslabel="Changed"  />		
			</cfchart>
		</div>
		
		<cfinclude template="footer.cfm">
	</div>	
</body>
</html>