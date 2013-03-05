function statisticsCtrl($scope, $http){

	var model = $scope.$parent.model;

	model.statistics = [];

	$scope.load = function(){
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


} // statisticsCtrl