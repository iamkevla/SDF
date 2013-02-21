

<input type="hidden" name="id" ng-model="model.project.id">
<table id="capture">
	<tr>
		<td align="right">
			<label>Project Name:&nbsp</label>
			<input name="Project" id="Project"
				 validate="maxlength"  
				 maxlength="50" required="true" size="50"
				 message="The project name is too long or is empty. Max 50 characters."
				 mg-model="model.project.projectname" >	 
		</td>
		</tr>
	<tr>	
		<td align="right">
			<label>Objectives:&nbsp</label>
			<textarea id="description" name="description" maxlength="255" cols="80" ng-bind="model.project.descrition"></textarea>
		</td>

	</tr>
	<tr>
		<td align="right">
		<label>Parent project:&nbsp</label>
		<select name="ParentID" ng-model="model.project.id" ng-options="project.id as project.projectname for project in model.projects" ></select>
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
					<td><a ng-click='getProduct({{project.id}})'>edit&nbsp;&nbsp;</a></td>
					<td><a href='actDeleteProject.cfm?id={{project.id}}'>delete</a></td>
				</tr>
			</table>
		</td>
	</tr>	
</table>
<pre>{{model.product | json}}</pre>