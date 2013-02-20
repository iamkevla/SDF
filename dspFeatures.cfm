<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-2" />
	<meta name="author" content="Kevin Vlahos" />
	<title>SDF - Feature Maps</title>
	<link rel="stylesheet" href="stylesheet.css" type="text/css" />
	<script src="./lib/prototype.js" type="text/javascript"></script>	
 	<script src="./lib/scriptaculous.js?load=builder,dragdrop,effects" type="text/javascript"></script>
	<script src="cropper.js" type="text/javascript"></script>
	
	<script type="text/javascript" charset="utf-8">
		
		// setup the callback function
		function onEndCrop( coords, dimensions ) {
			document.Wireframe.x1.value = coords.x1;
			document.Wireframe.y1.value = coords.y1;
			document.Wireframe.x2.value = coords.x2;
			document.Wireframe.y2.value = coords.y2;
			document.Wireframe.width.value = dimensions.width;
			document.Wireframe.height.value = dimensions.height;
		}
				
		// Absolute positioned example
		Event.observe(
			window,
			'load',
			function() {
				new Cropper.Img( 'testAbsImage', { onEndCrop: onEndCrop } );
				new Draggable( 'test-abs' );
			}
		);		
		
		if( typeof(dump) != 'function' ) {
			Debug.init(true, '/');
			
			function dump( msg ) {
				//Debug.raise( msg );
			};
		} else dump( '---------------------------------------\n' );
		
		
	</script>

	
	<!---  get a list of distinct feature blocks for a Grouping. We do it here as we modify javascript code accordingly --->
	<cfstoredproc datasource="#ds#" procedure="ap_getFeatures" >
		<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@GroupID" value="#session.groupid#">
		<cfprocresult name="Features" >
	</cfstoredproc>
	
	

	
	<script type="text/javascript">
		
      moveListener = function()
      {
      if (ColdFusion.Window != null)
      { 
      	<cfoutput query="Features">
      	var w_#features.id# = ColdFusion.Window.getWindowObject('#features.id#');
      	w_#features.id#.on('move',setCoords_#features.id#,w_#features.id#);
      	</cfoutput>
      }
      }
      <cfoutput query="Features">
      setCoords_#features.id# = function(ob,x,y)
      { 
      	document.myForm.Xcoord_#Features.ID#.value=x;	
      	document.myForm.Ycoord_#Features.ID#.value=y;
      }
      </cfoutput>
	
		function changeProject(id){
			window.location.href='actChangeProject.cfm?ProjectID='+id;
		}

		function changeGroup(id){
			window.location.href='actChangeGroup.cfm?GroupID='+id;
		}
		
		function DrawLinHor( x, y, size, color){
			var str;
			if (x>=0 && y>=0 && size>0){
			str = '<div style="position:absolute; left:' + x + 'px; top:' + y + 'px; width:' + size + 'px; height:1px;background-color:' + color + '"><table height=1 width=' + size + '></table></div>\n';
			} else {
			str = '';
			}
			document.write(str);
		}
		
		function DrawLinVert( x, y, size, color){
			var str;
			if (x>=0 && y>=0 && size>0){
			str = '<div style="position:absolute; left:' + x + 'px; top:' + y + 'px; width:1px; height:' + size + 'px;background-color:' + color + '"><table height=' + size + ' width=1></table></div>\n';
			} else {
			str = '';
			}
			document.write(str);
		}
	
   </script>

	
</head>
<body onload="javascript:moveListener()"  >
	<div id="content">
	
		<cfinclude template="header.cfm">
	
		<cfinclude template="menu.cfm">
		
	<div class="padding">
		<h2 align="right"><span class="green">Feature Maps</span></h2>
	</div>
	<br />	
	

	

<cfform name="area" >
<table width="100%"  >
	<tr>
		<td align="right">Project:&nbsp;</td>
		<td>
			<!--- get a list of projects to display in a drop box --->
			<cfstoredproc datasource="#ds#" procedure="ap_getProjects" >
				<cfprocresult name="Projects">
			</cfstoredproc>

			<cfselect name="projectID" onchange="javascript:changeProject(document.getElementById('projectID').value);"  >
				<cfoutput query="projects">
					<option value="#projects.id#" <cfif session.projectID eq projects.id>selected</cfif> >#projects.projectname#</option>
				</cfoutput>
			</cfselect>
		</td>
		<td align="right" >Grouping:&nbsp;</td>
		<td>
			<cfstoredproc datasource="#ds#" procedure="ap_getGroups">
				<cfprocresult name="Groups">
			</cfstoredproc>
			
			<cfselect name="groupID" onchange="javascript:changeGroup(document.getElementById('groupID').value);"  >
					<cfoutput query="groups">
						<option value="#groups.id#" <cfif session.groupID eq groups.id>selected</cfif> >#groups.groupname#</option>
					</cfoutput>
			</cfselect>
	</tr>
</table>
</cfform>



<div id="links" align="right">
	<p>
		&nbsp;|&nbsp;<a href="#" title="link two features" onClick="javascript:ColdFusion.Window.show('linkFeatures');">link</a>
		&nbsp;|&nbsp;<a href="#" title="creates a wireframe" onClick="document.Wireframe.submit();">wireframe</a>
		&nbsp;|&nbsp;<a href="actGenerateFeatures.cfm" title="auto generates feature blocks from existing requirements" >refresh</a>
	&nbsp;|&nbsp;<a href="#" title="saves current arrangement of feature blocks" onClick="document.myForm.submit();">save</a>
	
	
	</p>
</div>

<div id="test-abs" style="position:absolute; TOP:200px; LEFT:230px; background-image:url(./images/layout_grid2.gif);" > 
<!---<div id="test-abs" class="workbench" > --->
<div id="testAbsWrap">
<!---><div style="background-image:url(./images/layout_grid.gif);" >	--->
	<img style="position:absolute;"  id="testAbsImage" width="800" height="550" />
</div>

<div >	
	
		<!--- now add all wireframes --->
	<cfstoredproc datasource="#ds#" procedure="ap_getWireframes">
		<cfprocparam dbvarname="@ProjectID" cfsqltype="CF_SQL_INTEGER" value="#session.projectID#">
		<cfprocparam dbvarname="@GroupID" cfsqltype="CF_SQL_INTEGER" value="#session.groupID#">
		<cfprocresult name="WireFrames" >
	</cfstoredproc>
	
	<cfoutput query="WireFrames" >
	
		<CFWINDOW initshow="true" name="wf_#WireFrames.ID#" height="#WireFrames.height#" width="#WireFrames.Width#" 
		title="#WireFrames.Name#" resizable="false" 
		x="#WireFrames.X1#" y="#WireFrames.Y1#" closable="false"  
        headerStyle="background-color: black;" >edit this</CFWINDOW> 	

	</cfoutput>	
	
<cfoutput query="Features" >	
	
	<cfif Features.Xcoord eq "" ><cfset Features.Xcoord = 200+(10*Features.ID)></cfif>
	<cfif Features.Ycoord eq "" ><cfset Features.Ycoord = 200+(10*Features.ID)></cfif>
	
	<!--- build a string consisting of relevant requirements ---->
	<cfstoredproc datasource="#ds#" Procedure="ap_getReferences" >
		<cfprocparam cfsqltype="CF_SQL_INTEGER" dbvarname="@FeatureID" value="#Features.ID#" >
		<cfprocresult name="qryIDs">
	</cfstoredproc>
	
	<cfset lstIDS = "" >
	<cfloop query="qryIDs" >
		<cfset lstIDs = lstIDs & "<a href=dspRequirements.cfm?id="&#qryIDs.RequirementID#&">"&#qryIDs.RequirementID#&"</a>, " >
	</cfloop>
	
	<CFWINDOW initshow="true" name="#Features.ID#" height="60" width="150" 
		title="#Features.Feature#" resizable="false" 
		x="#Features.Xcoord#" y="#Features.Ycoord#" closable="false"  
        headerStyle="background-color: #Features.Colour#;" >Req: #lstIDs#&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href="actDownComplexity.cfm?id=#features.ID#">-</a>/<a href="actUpComplexity.cfm?id=#features.ID#">+</a></CFWINDOW> 

	</cfoutput>	


	<cfwindow initshow="false"  name="linkFeatures" modal="true" height="200" width="200" title="Link Features" resizable="false" >
		<cfform name="form" method="post" action="actLink.cfm">	
		<cfselect name="FirstFeature">
			<option value="1">test</option>
		</cfselect><br />
		<cfselect name="secondFeature">
			<option value="1">test</option>
		</cfselect><br />
		
		<input type="submit" value="submit" name="submit">
		</cfform>
	</cfwindow>



	
	
	</div>


	<form name="myForm" action="actUpdateFeatures.cfm" method="post">

		<cfoutput query="Features">					
			<input name="Xcoord_#features.ID#" type="hidden" value="#Features.Xcoord#" >
			<input name="Ycoord_#Features.ID#" type="hidden" value="#Features.Ycoord#" >
		</cfoutput>

	</form>



	<form name="Wireframe" action="actWireframe.cfm" method="post">	
		<input type="hidden" name="x1" id="x1" />
		<input type="hidden" name="y1" id="y1" />
		<input type="hidden" name="x2" id="x2" />
		<input type="hidden" name="y2" id="y2" />
		<input type="hidden" name="width" id="width" />
		<input type="hidden" name="height" id="height" />
	</form>


<div style="position:absolute;TOP:580px;">
	<cfinclude template="footer.cfm">
</div>
</div>
</body>
</html>