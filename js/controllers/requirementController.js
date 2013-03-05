'use strict';

function requirementCtrl( $scope, $http, groups ){

	var model = $scope.$parent.model;

	model.showhide = true;

	$scope.toggleShowhide = function(){
		model.showhide = !model.showhide;
	};

	var loadStatus = function() {
		model.status= [];
		$http({method:'GET', url:'api/v1/index.cfm/status'}).success(function(data){	
			angular.forEach(data.DATA, function(items){
				model.status.push({ 'status': items[0] });
			});
		});
	}();


	function loadRequirements() {
		model.requirements= [];
		$http({method:'GET', url:'api/v1/index.cfm/project/' + model.requirement.projectid + '/requirements'}).success(function(data){	
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
	};
	loadRequirements();

	$scope.changeProject = function(){
		loadRequirements();
		resetRequirement();
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
		//model.requirement.projectid = requirement[0].projectid; 
	}; // getRequirement

	$scope.deleteRequirement = function(id){
		$http({method:'DELETE', url:'api/v1/index.cfm/requirement/'+id}).success(function(){	
			groups.load(function(response){
				model.groups = response;
			});
		}).error(function(data){ 
			alert('delete failed') 
		});
	};

	function resetRequirement(){
		model.requirement.id = ''; 
		model.requirement.requirement= ''; 
		model.requirement.groupname = ''; 
		model.requirement.verb = ''; 
		model.requirement.noun = ''; 
		model.requirement.status = ''; 
		model.requirement.estimate = ''; 
	}				

	$scope.submitRequirement = function(){
		var dataPOST = {
			'id': model.requirement.id,
			'requirement' : model.requirement.requirement,
			'groupname' : model.requirement.groupname,
			'verb' : model.requirement.verb,
			'noun' : model.requirement.noun,
			'status' : model.requirement.status,
			'estimate' : model.requirement.estimate,
			'projectid' : model.requirement.projectid
		};

		if (model.requirement.id === '' ){
			$http({method:'POST', url:'api/v1/index.cfm/project/' + model.requirement.projectid + '/requirements', data:dataPOST })
				.success(function(data){	
					loadRequirements();

				}).error(function(data){ 
					alert('submit failed') 
				});
		} else {
			$http({method:'PUT', url:'api/v1/index.cfm/requirement/' + model.requirement.id, data:dataPOST })
				.success(function(data){	
					loadRequirements();
					resetRequirement();
				}).error(function(data){ 
					alert('update failed') 
				});
		}
	};

	$scope.update = function( event, ui ) {
		$http({ 
			method: 'PUT',
			url: 'api/v1/index.cfm/requirement/' + ui.item.attr('data-id'),
			data: { infrontof: ui.item.next().attr('data-id') }
		});
    };
	
} // requirementCtrl