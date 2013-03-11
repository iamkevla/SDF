<!DOCTYPE html>
<html lang="en" ng-app="myApp">
	<head>
		<meta name="author" content="Kevin Vlahos" />
		<title>SDF > Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.0/css/bootstrap.min.css" rel="stylesheet">
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
		<link rel="shortcut icon" href="images/briefcase.ico" type="image/x-icon" />
	</head>
	<body ng-controller="mainCtrl" >
		<div class="container" >
			<cfinclude template="header.cfm">
			<cfinclude template="menu.cfm">
			<div ng-view ></div>
			<cfinclude template="footer.cfm">
		</div> <!--- /container --->	

		<script src="http://code.jquery.com/jquery-1.9.1.min.js" ></script>
		<script src="js/bootstrap.min.js" ></script>		
	 	<script src="js/jquery-ui-1.10.1.custom.min.js"></script>
	 	<script src="https://raw.github.com/flot/flot/master/jquery.flot.js"></script>
	 	<script src="https://raw.github.com/flot/flot/master/jquery.flot.time.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.5/angular.min.js" ></script>
		<script src="https://raw.github.com/angular-ui/angular-ui/master/build/angular-ui.min.js"></script>
		<script src="js/app.js" ></script>
		<script src="js/polyfill.js" ></script>
		<script src="js/controllers/mainController.js" ></script>
		<script src="js/controllers/groupController.js" ></script>
	 	<script src="js/controllers/projectController.js" ></script>
	 	<script src="js/controllers/requirementController.js" ></script>
	 	<script src="js/controllers/statisticsController.js" ></script>
	 	<script src="js/filters/main.js" ></script>
	 	<script src="js/services/projects.js" ></script>
	 	<script src="js/services/groups.js" ></script>
	 	<script src="js/services/requirements.js" ></script>
	 	<script src="js/directives/stars.js" ></script>
	 	<script src="js/directives/sortable.js" ></script>
	 	<script src="js/directives/flot.js" ></script>
	 	<script src="js/directives/typeahead.js" ></script>
	</body>
</html>