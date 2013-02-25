function groupCtrl($scope, $http){

	var model = {
			groups:[],
			group:{
				id: '',
				groupname: '',
				projectid: ''
			},
			projects:[]
		};

	$scope.model = model;

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
	}; // loadGroups
	loadGroups();

	$scope.getGroup = function(id){
		var group = model.groups.filter( function(p){
			return (p.id === id);
		});
		model.group.id = group[0].id; 
		model.group.groupname = group[0].groupname; 
		model.group.groupname = group[0].groupname; 
	}; // getGroup

	$scope.deleteGroup = function(id){
		$http({method:'DELETE', url:'api/v1/index.cfm/group/'+id}).success(function(){	
			loadGroups();
		}).error(function(data){ 
			alert('delete failed') 
		});
	};

	$scope.submitGroup = function(){
		var dataPOST = {
			'id': model.group.id,
			'groupname' : model.group.groupname,
			'projectid': model.group.projectid
		};

		if (model.group.id === '' ){
			$http({method:'POST', url:'api/v1/index.cfm/groups', data:dataPOST })
				.success(function(data){	
					loadGroups();
				}).error(function(data){ 
					alert('submit failed') 
				});
		} else {
			$http({method:'PUT', url:'api/v1/index.cfm/group/' + model.group.id, data:dataPOST })
				.success(function(data){	
					loadGroups();
				}).error(function(data){ 
					alert('update failed') 
				});
		}
	};
	
} // groupCtrl