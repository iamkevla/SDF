<div class="container" >
	<table class="table table-condensed table-bordered table-hover span10" >
		<tr>
			<th><span class="green" >ID</span></th>
			<th><span class="green" >Grouping</span></th>
			<th><span class="green" >Requirement</span></th>
			<th colspan="2" >&nbsp</th>
		</tr>	
		<tbody class="content" sortable >	
			<tr ng-repeat="r in model.requirements" class="item" data-id="{{r.id}}"  >
				<td>{{r.id}}</td>
				<td>{{r.groupname}}</td>
				<td ng-bind-html-unsafe="r.requirement | boldify:r.verb:r.noun" ></td>
				<td>
					<div class="btn-group">
						<a class="btn btn-small" ng-click="getRequirement(r.id)" >edit<i class="icon-edit"></i></a>
						<a class="btn btn-small" ng-click="deleteRequirement(r.id)" >delete<i class="icon-remove"></i></a>
					</div>
				</td>
			</tr>
		</tbody>	
	</table>

	<form class="form-horizontal" >
		<div class="row" >
			<div class="control-group span5" >
				<label class="control-label" >Project:</label>
				<div class="controls" >
					<select ng-model="model.requirement.projectid" ng-change="changeProject()" ng-options="p.id as p.projectname for p in model.projects" />
					<input type="hidden" name="id" ng-model="model.requirement.id" >	
				</div>
			</div>
			<div class="control-group span5" >	
				<label class="control-label" >Requirement Group:</label>
				<div class="controls" >
					<input type="text" ng-model="model.requirement.groupname" required="true" message="This is a required field.." bs-typeahead="model.typeahead" >
				</div>
			</div>	
		</div>
		<div class="row">
			<div class="control-group span10" >
				<label class="control-label" >Requirement:</label>
				<div class="controls" >
					<textarea ng-model="model.requirement.requirement"  required="true" cols="80" class="span8"></textarea>
					<a ng-click="toggleShowhide()" >Show/Hide</a> 
				</div>
			</div>
		</div>	
		<div class="row" ng-class="{showhide: model.showhide}"  > 
			<div class="control-group span5" >
				<label class="control-label" >Verb:</label>
				<div class="controls" >
					<input type="text" ng-model="model.requirement.verb" size="20" />
				</div>
			</div>	
			<div class="control-group span5" >
				<label class="control-label" >Noun:</label>
				<div class="controls" >
					<input type="text" ng-model="model.requirement.noun" size="20" />				
				</div>
			</div>
		</div>	
		<div class="row" ng-class="{showhide: model.showhide}"  > 
			<div class="control-group span5" >
				<label class="control-label" >Status:</label>
				<div class="controls" >
					<select ng-model="model.requirement.status" ng-options="s.status as s.status for s in model.status" />
				</div>
			</div>
			<div class="control-group span5" >
				<label class="control-label" >Estimate:</label>
				<div class="controls" >
					<stars rating="model.requirement.estimate" max="5"></stars>
				</div>
			</div>
		</div>	
		<div class="row" >
			<div class="form-actions span10">
				<input class="btn pull-left" type="button" value="Clear"  ng-click="resetRequirement()" >
				<input ng-show="model.requirement.id != ''" class="btn btn-primary pull-right" type="button" value="Update" ng-click="submitRequirement()" >
				<input ng-show="model.requirement.id == ''" class="btn btn-primary pull-right" type="button" value="Submit"  ng-click="submitRequirement()" >
			</div>
		</div>
	</form>	
</div>	