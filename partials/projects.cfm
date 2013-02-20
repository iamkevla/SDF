<br />	
	
	
	
	
	<!--- check if it is a request to edit --->
	<cfif isdefined("url.id")>
		<cfquery dbtype="query" name="Project" >
			select id, ProjectName, description, parentid from Projects where id = #url.id#
		</cfquery>
	<cfelse>
		<cfset Project.id = ""  >
		<cfset Project.ProjectName ="">
		<cfset Project.Description ="">
		<cfset Project.parentID = "" >
	</cfif>

	
	<cfform action="actAddEditProject.cfm" method="post">
		<cfoutput>
		<input type="hidden" name="id" value="#project.id#">
		<table id="capture">
			<tr>
			<td align="right">
				<label>Project Name:&nbsp</label>
			</td>
			<td>	
				<input name="Project" id="Project"
					 validate="maxlength"  
					 maxlength="50" required="true" size="50"
					 message="The project name is too long or is empty. Max 50 characters."
					 value="#Project.ProjectName#" >	 
			</td>
		</tr>
		<tr>	
			<td align="right">
				<label>Objectives:&nbsp</label>
			</td>
			<td>
		<textarea id="description" name="description" maxlength="255" cols="80">#Project.Description#</textarea>
			</td>
		</cfoutput>

		</tr>
		<tr>
			<td align="right">
				<label>Parent project:&nbsp</label>
			</td>
			<td>
		<cfselect name="ParentID" >
			<option value="" <cfif project.parentid eq "">selected</cfif> ></option>
			<cfoutput query="Projects">
				<cfif projects.id neq project.id> <!--- do not include itself in list of parent project --->
				<option value="#Projects.ID#" <cfif Project.parentid eq Projects.ID >selected</cfif> >#Projects.ProjectName#</option>
				</cfif>
			</cfoutput>
		</cfselect>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input type="submit" name="submit" value="Submit" ></td>
		</tr>
		</table>	
	</cfform>
	

	
	<br />
	<br />
	<br />
	<table cellpadding="5">
		<tr>
			<td>
				<table>
					
					<cfoutput query="Projects" >
					<tr height="24">
						<td width='250'>#Projects.Projectname#&nbsp;</td>
						<td><a href='dspProjects.cfm?id=#Projects.id#'>edit&nbsp;&nbsp;</a></td>
						<td><a href='actDeleteProject.cfm?id=#Projects.id#'>delete</a></td>
		
					</tr>
					</cfoutput>
				</table>
			</td>
		</tr>	
	</table>