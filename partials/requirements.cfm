	<!--- script language="javascript">
		
		var myVerbs=new Array();
		myVerbs[0]="add";
		myVerbs[1]="edit";
		myVerbs[2]="delete";
		myVerbs[3]="view";
		
		var myNouns=new Array();
		myNouns[0]="Requirement";
		myNouns[1]="Project";
	
		
		function giveFocus(){
			$('#Requirement').focus();
		}
		
		function myOpen(){
			window.location.href='actChangeProject.cfm?ProjectID='+$('select#projectID').val();
		}
	
		function lookForNoun(x,y){
			if (y.value == ""){
				var v;
				for (v in myNouns){
					y.value= x.match(myNouns[v],"i");
					if (y.value != "" ){break;}					
				}
			}
		}
		
		function lookForVerb(x,y){
			if (y.value == ""){
				var v;
				for (v in myVerbs){
					y.value= x.match(myVerbs[v],"i");
					if (y.value != "" ){break;}					
				}
			}
		}
</script>
<script>
	$(document).ready(function() {
		$( "#requirements tbody.content" ).sortable({ 
				update: function(event, ui) {
					var reqOrder = $(this).sortable('toArray');
					var reqMoved = $(ui.item).attr('id');
					for (var x=0; x<reqOrder.length; x++){
						if(reqMoved == reqOrder[x]){ var infrontof = reqOrder[x+1]; }
					};
					$.get('update-sort.cfm', {reqMoved:reqMoved,infrontof:infrontof});
				}
		});
		$("#requirements tbody.content").disableSelection();
	    $("#showhide").click(function() {
			$('tr#collapsible').toggle('slow');
			$.ajax({url: "act_updsession.cfm" });
			return false;
		}).next().hide();
		
		$("#stars-wrapper1").stars({
			    captionEl: $("#stars-cap")
		});
			
	});
</script --->
	
<input type="hidden" name="id" ng-model="model.requirement.id" >
		
<table id="capture">
	<tr>
		<td align="right" >
			<label >Project:</label>
		</td>
		<td>	
			<select ng-model="model.requirement.projectid" ng-change="changeProject()" >
				<option ng-repeat="p in model.projects" value="{{p.id}}" > {{p.projectname}}</option>
			</select>
		</td>
		<td align="right" >
			<label >Requirement Group:</label>
		</td>
		<td>
			<input type="text" ng-model="model.requirement.groupname" required="true" message="This is a required field..">
		</td>
	</tr>
	<tr>	
		<!--- here you enter the detail of the requirement --->
		<td align="right" >
			<label >Requirement:</label>
		</td>
		<td colspan="4">	
			<textarea ng-model="model.requirement.requirement"  required="true" cols="80"></textarea>
		</td>
		<td >
			<a ng-click="showhide()" >Show/Hide</a>
		</td>
	</tr>
	<tr class="showhide" >
		<td  align="right" >
			<label >Verb:</label>
		</td>
		<td>	
			<input type="text" ng-model="model.requirement.verb" size="20" >
		</td>
		<td  align="right" >
			<label >Noun:</label>
		</td>
		<td>	
			<input type="text" ng-model="model.requirement.noun" size="20" >				
		</td>
	</tr>
	<tr class="showhide" >
		<td  align="right" >
			<label >Status:</label>
		</td>
		<td>
			<select ng-model="model.requirement.status" ng-options="s.status as s.status for s in model.status" />
		</td>
		<td align="right">
			<label>Estimate:</label>
		</td>
		<td> 
			<div id="stars-wrapper1">
				<input ng-model="model.requirement.estimate" type="radio" name="estimate" value="1" title="Small" >
				<input ng-model="model.requirement.estimate" type="radio" name="estimate" value="2" title="Medium"  >
				<input ng-model="model.requirement.estimate" type="radio" name="estimate" value="3" title="Complex" >
				<input ng-model="model.requirement.estimate" type="radio" name="estimate" value="4" title="Undecided"  >
			</div>
			<span id="stars-cap"></span>
		</td>
	</tr>
		
	<tr>
		<td colspan="5" align="right">
		<input type="submit" name="submit" value="Submit"  ng-click="submitRequirement()" >
		</td>
	</tr>
</table>		


<br />
<br />
<table id="requirements" >
	<tr>
		<th><span class="green">ID</span></th>
		<th><span class="green">Grouping</span></th>
		<th><span class="green">Requirement</span></th>
		<th colspan="2">&nbsp</th>
	</tr>	
	<tbody class="content">	
		<tr ng-repeat="r in model.requirements">
			<td>{{r.id}}</td>
			<td>{{r.groupname}}</td>
			<td>{{r.requirement}}</td>
			<td><a class="edit" ng-click="getRequirement(r.id)" >edit<IMG SRC="images/data_edit.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0 ></a></td>
			<td><a ng-click="deleteRequirement(r.id)">delete<IMG SRC="images/data_delete.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0></a></td>

		</tr>
	</tbody>	
</table>