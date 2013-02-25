<input type="hidden" name="id"  ng-model="model.group.id" >
<table id="capture">
	<tr width="100%">
		<td align="right">Grouping:&nbsp</td>
		<td>
			<input name="Group" id="Group" size="50" ng-model="model.group.groupname" >	 
		</td>
		<td align="right" width="25%"><label>Project:&nbsp</label></td>
		<td>
			<select name="ProjectID" ng-model="model.group.projectid">
				<option value="" >ALL</option>	
				<option  ng-repeat="p in model.projects" value="{{p.id}}" >{{p.projectname}}</option>
			</select>
		</td>
	</tr>	
	<tr>
		<td colspan="4" align="right">
			<input type="submit" name="submit" value="Submit" ng-click="submitGroup()" >
		</td>
	</tr>
</table>			
	
<br />
<br />
<br />
<table id="list">
	<tr>
		<th><span class="green">ID</span></th>
		<th><span class="green">Group Name</span></th>
		<th><span class="green">Project</span></th>
	</tr>	
	<tr height="20" ng-repeat="g in model.groups">
		<td>{{g.id}}</td>
		<td width="40%" >{{g.groupname}}</td>
		<td width="40%" >{{g.projectname}}</td>
		<td><a ng-click="getGroup(g.id)" >edit</a></td>
		<td><a ng-click="deleteGroup(g.id)" >delete</a></td>
	</tr>
</table>