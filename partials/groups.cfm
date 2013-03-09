	
<table class="table table-condensed table-bordered table-hover span10" >
	<tr>
		<th><span class="green">ID</span></th>
		<th><span class="green">Group Name</span></th>
		<th><span class="green">Project</span></th>
	</tr>	
	<tr height="20" ng-repeat="g in model.groups">
		<td>{{g.id}}</td>
		<td width="40%" >{{g.groupname}}</td>
		<td width="40%" >{{g.projectname}}</td>
		<td>
			<div class="btn-group">
				<a class="btn btn-small" ng-click="getGroup(g.id)"  >edit<i class="icon-edit"></i></a>
				<a class="btn btn-small" ng-click="deleteGroup(g.id)" >delete<i class="icon-remove"></i></a>
			</div>
		</td>	
	</tr>
</table>

<form class="form-horizontal" >
	<input type="hidden" name="id"  ng-model="model.group.id" >
	<div class="row" >
		<div class="control-group span5" >
			<label class="control-label" >Grouping:&nbsp</label>
			<div class="controls" >
				<input name="Group" id="Group" size="50" ng-model="model.group.groupname" >	 
			</div>
		</div	
		<div class="control-group span5" >	
			<label class="control-label" >Project:&nbsp</label>
			<div class="controls" >
			<select name="ProjectID" ng-model="model.group.projectid">
				<option value="" >ALL</option>	
				<option  ng-repeat="p in model.projects" value="{{p.id}}" >{{p.projectname}}</option>
			</select>
		</div>
	</div>	
	<div class="row" >
		<div class="form-actions span10">
			<input class="btn btn-primary pull-right" type="button" value="Submit"  ng-click="submitGroup()"  >
		</div>
	</div>
</form>			
