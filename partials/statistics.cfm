<div class="container" >
	<div class="row">
		<form >
			<select ng-model="model.project" ng-change="loadData()" ng-options="p as p.projectname for p in model.projects" />
		</form>
	</div>	
	<div class="row" >
		<div class="span5" >
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

		<div class="span5" >
			<h5>Requirements Graph</h5>
				
			<div ng-show="model.project">
				<chart data="model.data" opts="model.opts" />
			</div>
		</div>
	</div>
</div>