<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="author" content="Kevin Vlahos" />
	<title>SDF - Requirements</title>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js"></script>
	<script type="text/javascript" src="lib/jquery.ui.stars.js?v=3.0.0b38"></script>
	<link rel="stylesheet" type="text/css" href="jquery.ui.stars.css?v=3.0.0b38"/>
	<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>

	<script language="javascript">
		
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
</script>
	
</head>
<body onLoad="giveFocus()" >
	<div id="content">
		<cfinclude template="header.cfm">
	
		<cfinclude template="menu.cfm">
	
		<br>
		<br>	

	<cfform name="myForm" action="actAddEditReq.cfm" method="post">
		<cfoutput>
		<input type="hidden" name="id" <cfif isdefined("url.id")>value="#url.id#"</cfif>>
		</cfoutput>
		
				
		<cfstoredproc datasource="#ds#" procedure="ap_getRequirements">
			<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@projectID" value="#session.projectID#">
			<cfprocresult name="getRequirements">
		</cfstoredproc>
		
		<!--- check if it is a request to edit if so get the specific details so that they can be loaded into the controls--->
		<cfif isdefined("url.id")>
			<cfquery dbtype="query" name="Requirement" >
				select requirement, groupname, projectID, verb, noun, [status], estimate from getRequirements where id = #url.id#
			</cfquery>
		<cfelse>	
			<cfquery datasource="#ds#" name="groupname">
				select groupname from tblGroups with (nolock) where id = #session.groupid#;
			</cfquery>
			<cfset requirement.requirement = "" >
			<cfset requirement.groupname = #groupname.groupname# >
			<cfset requirement.projectID = #session.projectID# >
			<cfset requirement.verb =  "" >
			<cfset requirement.noun = "" >
			<cfset requirement.status = "" >
			<cfset requirement.estimate = "" >
		</cfif>	
		
		<!--- get a list of projects to display in a drop box --->
		<cfstoredproc datasource="#ds#" procedure="ap_getProjects" >
			<cfprocresult name="Projects">
		</cfstoredproc>
		<table id="capture">
			<tr>
				<td align="right" >
					<label >Project:</label>
				</td>
				<td>	
					<cfif isdefined("url.id")>
						<cfselect name="projectID" onchange="javascript:myOpen();" >
							<cfoutput query="projects">
								<option value="#projects.id#" <cfif Requirement.ProjectID eq Projects.id>selected</cfif> >#projects.projectname#</option>			
							</cfoutput>
						</cfselect>
					<cfelse>
						<cfselect name="projectID" onchange="javascript:myOpen();"  >
							<cfoutput query="projects">
								<option value="#projects.id#" <cfif session.projectID eq projects.id>selected</cfif> >#projects.projectname#</option>
							</cfoutput>
						</cfselect>
					</cfif>	
				</td>
	
				<cfstoredproc datasource="#ds#" procedure="ap_getGroups" >
					<cfprocresult name="groups">
				</cfstoredproc>
				<cfset lstGroup = ValueList(groups.GroupName,",") >
				
				<td align="right" >
					<label >Requirement Group:</label>
				</td>
				<td>
					<cfinput name="Group" type="text" Value="#Requirement.GroupName#" 
						autosuggest="#lstGroup#" required="true" message="This is a required field..">
				</td>
				<!---
				<td>
					<input name="filtered" type="checkbox" <cfif session.filtered eq "true"  >checked</cfif> onClick="javascript:window.location.href='actChangeFilter.cfm'"  ><label>&nbsp;Filtered</label>
				</td>
				--->
				<!--- end of groupings --->
			</tr>
			<tr>	
				<!--- here you enter the detail of the requirement --->
				<td align="right" >
					<label >Requirement:</label>
				</td>
				<td colspan="4">	
					<textarea id="Requirement" name="Requirement"  
						required="true" cols="80" 
						onKeyUp="javascript:lookForVerb(this.value, document.myForm.verb);lookForNoun(this.value, document.myForm.noun);"><cfif isdefined("Requirement.requirement")><cfoutput>#Requirement.requirement#</cfoutput></cfif></textarea>
				</td>
			<td >
					<a id="showhide" >Show/Hide</a>
				</td>
			</tr>
				<tr id="collapsible" <cfif session.showhide > style="display:none" </cfif> >
					<cfoutput>		
					<td  align="right" >
						<label >Verb:</label>
					</td>
					<td>	
						<input type="text" name="verb" size="20" <cfif isdefined("url.id")>value="#requirement.verb#"</cfif>>
					</td>
					<td  align="right" >
						<label >Noun:</label>
					</td>
					<td>	
						<input type="text" name="noun" size="20" <cfif isdefined("url.id")>value="#requirement.noun#"</cfif>>				
					</td>
	
					</cfoutput>
				</tr>
				<tr  id="collapsible" <cfif session.showhide >style="display:none"</cfif> >
					<td  align="right" >
						<label >Status:</label>
					</td>
					<td>
						<cfquery datasource="#ds#" name="qrystatus" >
							select [status] from tblStatus with (nolock) order by ID asc;
						</cfquery>
						<cfselect name="status" >
								<option value="" <cfif requirement.status eq "" > selected </cfif> ></option>
							<cfoutput query="qrystatus">
								<option value="#qrystatus.status#" <cfif #qrystatus.status# eq requirement.status> selected </cfif> >#qrystatus.status#</option>
							</cfoutput>
						</cfselect>
					</td>
					<td align="right">
						<label>Estimate:</label>
					</td>
					<td> 
						<div id="stars-wrapper1">
							<input type="radio" name="estimate" value="1" title="Small" <cfif requirement.estimate eq 1 > checked </cfif> >
							<input type="radio" name="estimate" value="2" title="Medium" <cfif requirement.estimate eq 2 > checked </cfif> >
							<input type="radio" name="estimate" value="3" title="Complex" <cfif requirement.estimate eq 3 > checked </cfif> >
							<input type="radio" name="estimate" value="4" title="Undecided" <cfif requirement.estimate eq 4 > checked </cfif> >
						</div><span id="stars-cap"></span>
					</td>
				</tr>
			
			<tr>
				<td colspan="5" align="right">
				<input type="submit" name="submit" value="Submit"  >
				</td>
			</tr>
		</table>		

		
	</cfform>
	<br />
	<br />
	<cfif session.filtered eq "true">
		<cfquery name="getRequirements" dbtype="query">
			Select * from getRequirements where groupid = #session.groupID#
		</cfquery>
	</cfif>
	
	<br />
	<table id="requirements" >
		<tr>
			<!---cfif session.filtered eq "false">	
				<th colspan="2">&nbsp</th>
			</cfif--->
			<th><span class="green">ID</span></th>
			<th><span class="green">Grouping</span></th>
			<th><span class="green">Requirement</span></th>
			<!---<th><span class="green">Verb</th>
			<th><span class="green">Noun</th>--->
			<th colspan="2">&nbsp</th>
		</tr>	
	<tbody class="content">	
		<cfoutput query="getRequirements">
		<tr id='#getRequirements.id#'>
			<!---<cfif session.filtered eq "false">
				<cfif getRequirements.currentrow neq 1>
				<td><a href="actUpQueue.cfm?id=#getRequirements.id#">up<IMG SRC="images/up_plus.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0></a></td>
				<cfelse>
				<td>&nbsp</td>
				</cfif>
				<cfif getRequirements.currentrow neq getRequirements.recordcount >
				<td><a href="actDownQueue.cfm?id=#getRequirements.id#">down<IMG SRC="images/down_minus.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0></a></td>
				<cfelse>
				<td>&nbsp</td>
				</cfif>
			</cfif>--->
			<td>#getRequirements.id#</td>
			<td>#getRequirements.groupname#</td>
			<td>      
				<cfif trim(getRequirements.verb) neq '' >
					<cfset keyword = getRequirements.verb >
					<cfset oldResults = getRequirements.requirement >
					<cfset part1 = REReplaceNoCase(VARIABLES.oldResults, "(([^A-Za-z])(#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "\2<b>\3</b>\4", "ALL")>
					<cfif Left(VARIABLES.part1, Len(Trim(VARIABLES.keyword))) IS Trim(VARIABLES.keyword)>           
						<cfset part1 = REReplaceNoCase(VARIABLES.part1, "((#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "<b >\2</b>\3", "ONE")>       
					</cfif>
				<cfelse>
					<cfset part1 = getRequirements.requirement >
				</cfif>
				<cfif trim(getRequirements.noun) neq '' >
					<cfset keyword = getRequirements.noun >
					<cfset oldResults = part1 >
					<cfset newResults = REReplaceNoCase(VARIABLES.oldResults, "(([^A-Za-z])(#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "\2<b>\3</b>\4", "ALL")>
					<cfif Left(VARIABLES.newResults, Len(Trim(VARIABLES.keyword))) IS Trim(VARIABLES.keyword)>           
						<cfset newResults = REReplaceNoCase(VARIABLES.newResults, "((#Trim(VARIABLES.keyword)#)([^A-Za-z]))", "<b>\2</b>\3", "ONE")>       
					</cfif>
				<cfelse>
					<cfset newResults = part1 >
				</cfif>	
				#newResults#
			</td>
		<!---	<td>#getRequirements.Verb#</td>
			<td>#getRequirements.Noun#</td> --->
			<td><a class="edit" href="#cgi.SCRIPT_NAME#?id=#getRequirements.id#" >edit<IMG SRC="images/data_edit.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0 ></a></td>
			<td><a href="actDeleteReq.cfm?id=#getRequirements.id#">delete<IMG SRC="images/data_delete.ico" ALT="" WIDTH=16 HEIGHT=16 BORDER=0></a></td>

		</tr>
		<cfif getRequirements.Version neq "" >
		<tr><td colspan="10" ><hr></td><td>Version #getRequirements.Version#</td></tr>
		</cfif>
		</cfoutput>
	</tbody>	
	</table>

	<cfinclude template="footer.cfm">

</div>
</body>
</html>