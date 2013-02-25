<!DOCTYPE html>
<html lang="en" ng-app="myApp">
<head>
		<meta name="author" content="Kevin Vlahos" />
		<title>SDF > Home</title>
		<link rel="stylesheet" href="stylesheet.css" type="text/css" />
		<link rel="shortcut icon" href="images/briefcase.ico" type="image/x-icon" />
	</head>
	<body >
		<div id="content">
			<cfinclude template="header.cfm">
		
			<cfinclude template="menu.cfm">
		
			<div ng-view ></div>

			<br>
			<cfinclude template="footer.cfm">
			
		</div> <!--- /content --->	

		<script src="http://ajax.googleapis.com/ajax/libs/angularjs/1.0.4/angular.min.js" ></script>
		<script src="js/app.js" ></script>
		<script src="js/polyfill.js" ></script>
		<script src="js/mainController.js" ></script>
		<script src="js/groupController.js" ></script>
	 	<script src="js/projectController.js" ></script>
	 	<script src="js/requirementController.js" ></script>

	</body>
</html>