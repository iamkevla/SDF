<!DOCTYPE html >
<html >
<head>
<title>jQuery Cards</title>
<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.7/jquery-ui.min.js"></script>
<!---style>
	.demo ul { list-style-type: none; margin: 0; padding: 0; margin-bottom: 10px; }
	.demo li { margin: 5px; padding: 5px; width: 550px; }
</style--->
<script>
	$(document).ready(function() {
		$( "#requirements" ).sortable({ 
				update: function(event, ui) {
					var reqOrder = $(this).sortable('toArray');
					var reqMoved = $(ui.item).attr('id');
					for (var x=0; x<reqOrder.length; x++){
						if(reqMoved == reqOrder[x]){ var infrontof = reqOrder[x+1]; }
					};
					$.get('update-sort.cfm', {reqMoved:reqMoved,infrontof:infrontof});
				}
		});
	});
</script>
</head>
<body>
	
	<div class="demo">
		<ul id="requirements">
			<li id="req1" class="ui-state-default">Ability to add a Project. The Project entity will be used as a container to help with the management of Requirements</li>
			<li id="req2" class="ui-state-default">Ability to add a Requirement. This should include a description, a Group name and key verb and noun captured. This is to help with code stub generation.</li>
			<li id="req3" class="ui-state-default">Ability to view All Requirements for a chosen Project. This will assist with the management of Requirements whether it be editing, deleting or prioritising. </li>
			<li id="req4" class="ui-state-default">Ability to prioritise Requirements </li>
			<li id="req5" class="ui-state-default">Ability to Edit a Requirement while maintaining a history. </li>
		</ul>
	</div><!-- End demo -->

</body>
</html>
