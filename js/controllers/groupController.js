function groupCtrl($scope, groups){

	var model = $scope.$parent.model;

	groups.load(function(response){
		model.groups = response;
	});

	$scope.getGroup = function(id){
		groups.get(model.groups,id, function(response){
			model.group.id = response.id; 
			model.group.groupname = response.groupname; 
		});
	}; // getGroup

	$scope.deleteGroup = function(id){
		groups.delete(id).then(function(){	
			groups.load(function(response){
				model.groups = response;
			});
		}, function(data){ 
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
			groups.add(dataPOST).then(function(){
				groups.load(function(response){
					model.groups = response;
				});
			}, function(){  
				alert('submit failed');
			});
		} else {
			groups.update( model.group.id, dataPOST ).then(function(){	
				groups.load(function(response){
					model.groups = response;
				});
			}, function(){
				alert('update failed');
			});
		}
	};
	
} // groupCtrl