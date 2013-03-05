<div id="introduction" >
	<form name="myForm" >
		<select ng-model="model.project" ng-change="load()" ng-options="p as p.projectname for p in model.projects" />
	</form>
</div>	
<div id="rightside" >
	<h5>Tests Created</h5>
					
	<p>
	==========================<br>
	Run tests starts:{{model.statistics[0].starttime}}<br>
	==========================<br>
	Testsuite: ({{model.statistics[0].testcount}} tests) execution time : {{model.statistics[0].starttime - model.statistics[0].stoptime}}<br>
	Run tests ends: {{model.statistics[0].stoptime}}
	Summary:
		{{model.statistics[0].testcount}} tests, of which {{model.statistics[0].failurecount}} failed and {{model.statistics[0].errorcount}} had an error. <br>
		<br>
		Success: {{model.statistics[0].success}} <br>
	-----------------------------------------<br>
	==========================<br>
	</p>	
</div>

<div id="leftside" >
	<h5>New Requirements</h5>
		

	
	
	<!---cfchart format="jpg" chartheight="200" chartwidth="500" showxgridlines="no" showygridlines="yes" 
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
	</cfchart--->
</div>