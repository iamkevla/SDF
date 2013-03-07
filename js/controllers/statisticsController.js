'use strict';

function statisticsCtrl($scope, $http){

	var model = $scope.$parent.model;


	function load(){
		model.statistics = [];
		$http({method:'GET', url:'api/v1/index.cfm/statistics/' + model.project.id + '?dbname=' + model.project.projectname }).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.statistics.push({ 
								"suite" : items[0],
								"success": items[1],
								"testcount": items[2],
								"failurecount": items[3],
								"errorcount": items[4],
								"starttime": items[5],
								"stoptime": items[6]
				 });
			});
		});
	};


	function newCounts(){
		model.newCounts = [];
		$http({
			method:'GET', 
			url:'api/v1/index.cfm/statistics/' + 
				model.project.id + 
				'?dbname=' + model.project.projectname +
				'&method=new'
			}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.newCounts.push({ 
								"sumreq" : items[0],
								"dayreq": items[1],
								"projectname": items[2]
				 });
			});
		});
	};

	function newChanged(){
		model.changedCounts = [];
		$http({
			method:'GET', 
			url:'api/v1/index.cfm/statistics/' + 
				model.project.id + 
				'?dbname=' + model.project.projectname +
				'&method=changed'
			}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.changedCounts.push({ 
								"sumreq" : items[0],
								"dayreq": items[1],
								"projectname": items[2]
				 });
			});
		});
	};

	$scope.model = model;

	$scope.loadData = function(){
		load();
		newCounts();
		newChanged();
	};


} // statisticsCtrl