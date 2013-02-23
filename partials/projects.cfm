<input type="hidden" name="id" ng-model="model.project.id">
<table id="capture">
	<tr>
		<td>
			<label>Project Name:&nbsp
				<input validate="maxlength" maxlength="50" required="true" size="50"
				 message="The project name is too long or is empty. Max 50 characters."
				 ng-model="model.project.projectname" />	 
			</label>	 
		</td>
		</tr>
	<tr>	
		<td>
			<label>Objectives:&nbsp
				<textarea maxlength="255" cols="80" ng-model="model.project.description"></textarea>
			</label>
		</td>

	</tr>
	<tr>
		<td>
		<label>Parent project:&nbsp
		<select ng-model="model.project.id" ng-options="project.id as project.projectname for project in model.projects" ></select>
		</label>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="Submit" ng-click="submit()" ></td>
	</tr>
</table>	


<br />
<br />
<br />
<table cellpadding="5">
	<tr>
		<td>
			<table>
				<tr height="24" ng-repeat="project in model.projects">
					<td width='250'>{{project.projectname}}&nbsp;</td>
					<td><a ng-click='getProject(project.id)' >edit&nbsp;&nbsp;</a></td>
					<td><a ng-click='deleteProject(project.id)'>delete</a></td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
<pre>{{model.product | json}}</pre>