'use strict';

function projectCtrl( $scope, projects ){

	var model = $scope.$parent.model;

	$scope.getProject = function(id){
		projects.get(model.projects, id, function(response){
			model.project = response; 
		});
	};

	$scope.deleteProject = function(id){
		try{
			projects['delete'](id)
				.then(function(){
					projects.load(function(response){
						model.projects = response; 
					}); })
				.then(function(){ $scope.resetProject(); });

		} catch (e) {
			alert(e.message);
		}
	};

	$scope.resetProject = function(){
		model.project.id = '';
		model.project.projectname = '';
		model.project.description = '';
		model.project.parentid = '';
	};

	$scope.submit = function(){

		var dataPOST = angular.copy(model.project);

		try{
			projects.add(dataPOST)
				.then(function(){
					projects.load(function(response){
						model.projects = response; 
					}); })
				.then(function(){ $scope.resetProject(); });
		} catch(e) {
			alert(e.message);
		}
	};

	$scope.update = function(){

		var dataPOST = angular.copy(model.project);

		try{
			projects.update( model.project.id, dataPOST).then(function(){
				projects.load(function(response){
					model.projects = response; 
				});
			});
		} catch(e) {
			alert(e.message); 
		}

	};
}