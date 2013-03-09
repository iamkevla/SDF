<div class = "container">

	<table class="table table-condensed table-bordered table-hover span10" >
		<thead>
			<tr class="green">
				<th>Projects</th><th></th>
			</tr>
		</thead>	
		<tbody>
			<tr ng-repeat="project in model.projects">
				<td class="span10">{{project.projectname}}&nbsp;</td>
				<td>				
					<div class="btn-group">
						<a class="btn btn-small" ng-click='getProject(project.id)' >edit<i class="icon-edit"></i></a>
						<a  class="btn btn-small" ng-click='deleteProject(project.id)' >delete<i class="icon-remove"></i></a>
					</div>
				</td>		
			</tr>
		</tbody>
	</table>

	<form class="form-horizontal" >
		<input type="hidden" name="id" ng-model="model.project.id" />
		<div class="row">
			<div class="control-group span5" >
				<label class="control-label" >Project Name:</label>	
				<div class="controls" >	
					<input validate="maxlength" maxlength="50" required="true" size="50"
					 message="The project name is too long or is empty. Max 50 characters."
					 ng-model="model.project.projectname" />	 
				</div>
			</div>
			<div class="control-group span5" >
				<label class="control-label" >Parent project:</label>
				<div class="controls" >	
					<select ng-model="model.project.parentid" ng-options="project.id as project.projectname for project in model.projects" ></select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="control-group span10" >
				<label class="control-label" >Objectives:</label>
				<div class="controls" >	
					<textarea maxlength="255" ng-model="model.project.description" class="span10"></textarea>
				</div>
			</div>
		</div>
		<div class="row" >
			<div class="form-actions span10">
				<input class="btn pull-left" type="button" value="Clear"  ng-click="resetProject()" >
				<input ng-show="model.project.id != ''" class="btn btn-primary pull-right" type="button" value="Update" ng-click="update()" >
				<input ng-show="model.project.id == ''" class="btn btn-primary pull-right" type="button" value="Submit" ng-click="submit()" >
			</div>
		</div>
	</form>	
</div>