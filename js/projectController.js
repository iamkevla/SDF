function projectCtrl( $scope, $http ){

	var model = {
		projects:[],
		project:{
			id: '',
			projectname: '',
			description: '',
			parentid: '' 
		}
	};

	$scope.model = model;

	var loadProjects = function(){
		model.projects= [];
		$http({method:'GET', url:'api/v1/index.cfm/projects'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.projects.push({ 
					'id': items[0],
					'projectname': items[1],
					'description': items[2], 
					'parentid': items[3], 
					'dbserver': items[4],
					'dbname': items[5]
				});
			});
		});
	};
	loadProjects();

	$scope.getProject = function(id){
		var project = model.projects.filter( function(p){
			return (p.id === id);
		});
		model.project.id = project[0].id; 
		model.project.projectname = project[0].projectname; 
		model.project.description = project[0].description; 
		model.project.parentid = project[0].parentid; 
	};

	$scope.deleteProject = function(id){
		$http({method:'DELETE', url:'api/v1/index.cfm/project/'+id}).success(function(){	
			loadProjects();
		}).error(function(data){ 
			alert('delete failed') 
		});
	};

	$scope.submit = function(){
		var dataPOST = {
			'id': model.project.id,
			'projectname' : model.project.projectname,
			'description': model.project.description,
			'parentid': model.project.parentid
		};

		if (model.project.id === '' ){
			$http({method:'POST', url:'api/v1/index.cfm/projects', data:dataPOST })
				.success(function(data){	
					loadProjects();
				}).error(function(data){ 
					alert('submit failed') 
				});
		} else {
			$http({method:'PUT', url:'api/v1/index.cfm/project/'+ model.project.id, data:dataPOST })
				.success(function(data){	
					loadProjects();
				}).error(function(data){ 
					alert('update failed') 
				});
		}
	};


}