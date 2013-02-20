'use strict';

// Declare app level module which depends on filters, and services
angular.module('myApp', []).
  config(['$routeProvider', function($routeProvider) {
  	$routeProvider
  		.when('/main', {templateUrl: 'partials/main.cfm', controller: mainCtrl})
    	.when('/groups', {templateUrl: 'partials/groups.cfm', controller: groupCtrl})
    	.when('/projects', {templateUrl: 'partials/projects.cfm', controller: projectCtrl})
    	.when('/requirements', {templateUrl: 'partials/requirements.cfm', controller: projectCtrl})
    	.otherwise({redirectTo: '/main'});
  }]);