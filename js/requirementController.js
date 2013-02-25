function requirementCtrl( $scope, $http ){

	var model = {
			requirements:[],
			requirement:{
				id: '',
				groupname: '',
				requirement: '',
				projectid: 1,
				verb : '',
				noun : '',
				status: '',
				estimate : ''
			},
			groups:[],
			projects:[],
			status: []
		};

	var loadGroups = function(){
		model.groups= [];
		$http({method:'GET', url:'api/v1/index.cfm/groups'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.groups.push({ 
					'id': items[0],
					'groupname': items[1],
					'projectid': items[2],
					'projectname':items[3]
				});
			});
		});
	}(); // loadGroups


	var loadStatus = function(){
		model.status= [];
		$http({method:'GET', url:'api/v1/index.cfm/status'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.status.push({ 'status': items[0] });
			});
		});
	};
	loadStatus();

	var loadRequirements = function(){
		model.requirements= [];
		$http({method:'GET', url:'api/v1/index.cfm/project/'+model.requirement.projectid+'/requirements'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.requirements.push({ 
					'id': items[0],
					'groupname': items[2],
					'requirement': items[3],
					'projectID':items[4],
					'verb': items[5],
					'noun': items[6],
					'status': items[9],
					'estimate': items[10]
				});
			});
		});
	}; // loadRequirements
	loadRequirements();

	var loadProjects = function(){
		model.projects= [];
		$http({method:'GET', url:'api/v1/index.cfm/projects'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.projects.push({ 
					'id': items[0],
					'projectname': items[1]
				});
			});
		});
	};
	loadProjects();

	$scope.model = model;

	$scope.changeProject = function(){
		loadRequirements();
	};

	$scope.getRequirement = function(id){
		var requirement = model.requirements.filter( function(r){
			return (r.id === id);
		});
		model.requirement.id = requirement[0].id; 
		model.requirement.requirement = requirement[0].requirement; 
		model.requirement.groupname = requirement[0].groupname; 
		model.requirement.verb = requirement[0].verb; 
		model.requirement.noun = requirement[0].noun; 
		model.requirement.status = requirement[0].status; 
		model.requirement.estimate = requirement[0].estimate; 
		model.requirement.projectID = requirement[0].projectID; 
	}; // getRequirement

	$scope.deleteRequirement = function(id){
		$http({method:'DELETE', url:'api/v1/index.cfm/requirement/'+id}).success(function(){	
			loadGroups();
		}).error(function(data){ 
			alert('delete failed') 
		});
	};

	$scope.submitRequirement = function(){
		var dataPOST = {
			'id': model.requirement.id,
			'requirement' : model.requirement.requirement,
			'groupname' : model.requirement.groupname,
			'verb' : model.requirement.verb,
			'noun' : model.requirement.noun,
			'status' : model.requirement.status,
			'estimate' : model.requirement.estimate
		};

		if (model.requirement.id === '' ){
			$http({method:'POST', url:'api/v1/index.cfm/project/'+model.requirement.projectid+'/requirements', data:dataPOST })
				.success(function(data){	
					loadRequirements();
				}).error(function(data){ 
					alert('submit failed') 
				});
		} else {
			$http({method:'PUT', url:'api/v1/index.cfm/requirement/' + model.requirement.id, data:dataPOST })
				.success(function(data){	
					loadRequirements();
				}).error(function(data){ 
					alert('update failed') 
				});
		}
	};
	
} // groupCtrl