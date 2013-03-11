'use strict';

function statisticsCtrl($scope, $http, $q){

	var model = $scope.$parent.model;

	model.newCounts = [];
	model.changedCounts = [];

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
		var deferred = $q.defer();
		model.newCounts = [];
		$http({
			method:'GET', 
			url:'api/v1/index.cfm/statistics/' + 
				model.project.id + 
				'?dbname=' + model.project.projectname +
				'&method=new'
			}).success(function(data){	
				angular.forEach(data.DATA, function(items){
					model.newCounts.push( [(new Date(items[1])).getTime(), items[0] ]);
				}); //forEach
			deferred.resolve();	
		}); //http
		return deferred.promise;	
	};


	function newChanged(){
		var deferred = $q.defer();
		model.changedCounts = [];
		$http({
			method:'GET', 
			url:'api/v1/index.cfm/statistics/' + 
				model.project.id + 
				'?dbname=' + model.project.projectname +
				'&method=changed'
			}).success(function(data){	
				angular.forEach(data.DATA, function(items){
					model.changedCounts.push( [(new Date(items[1])).getTime(), items[0] ]);
				});
			deferred.resolve();
		});
		return deferred.promise;
	};

	var startDate = new Date();
	startDate.setDate(startDate.getDate()-7);

	var stack = true, bars = true;

	model.opts = { 
		xaxis: {
			mode: "time",
			minTickSize: [1, "day"],
			min: startDate.getTime(),
			max: (new Date()).getTime(),
			timeformat: "%a",
			timezone: "browser"
		},
		series: {
			stack: stack,
			bars: {show: bars, barWidth: 10.0 }
		}
	};
	model.data = [];


	$scope.loadData = function(){
		load();
		$q.all([newCounts(), newChanged()]).then(function(){

			model.data = [ 
				{ 
					label: "New", 
					data: model.newCounts
				},
		  		{ 
		  			label: "Changed", 
		  			data: model.changedCounts
		  		}
		  	]; 
		});
	};

	$scope.model = model;


} // statisticsCtrl
