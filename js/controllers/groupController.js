function groupCtrl($scope, $http, groups){

	var model = $scope.$parent.model;

	groups.load(function(response){
		model.groups = response;
	});

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
			groups.load(function(response){
				model.groups = response;
			});
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
					groups.load(function(response){
						model.groups = response;
					});
				}).error(function(data){ 
					alert('submit failed') 
				});
		} else {
			$http({method:'PUT', url:'api/v1/index.cfm/group/' + model.group.id, data:dataPOST })
				.success(function(data){	
					groups.load(function(response){
						model.groups = response;
					});
				}).error(function(data){ 
					alert('update failed') 
				});
		}
	};
	
} // groupCtrl