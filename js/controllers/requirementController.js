'use strict';

function requirementCtrl( $scope, groups, requirements ){

	var model = $scope.$parent.model;

	model.showhide = true;

	$scope.toggleShowhide = function(){
		model.showhide = !model.showhide;
	};

	var loadStatus = function() {
		requirements.loadStatus(function(response){
			model.status = response;
		});
	}();


	function loadRequirements() {
		requirements.loadRequirements( model.requirement.projectid, function(response){
			model.requirements = response;
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
		requirements.delete(id).then(function(){
			loadRequirements();
			groups.load(function(response){
				model.groups = response;
			});
		}, function(){
			alert(e.message); 
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
			requirements.submit( model.requirement.projectid, dataPOST )
				.then(function(){
					loadRequirements();
				}, function(){
					alert(e.message) 
				});
		} else {
			requirements.update(model.requirement.id, dataPOST )
				.then(function(){
					loadRequirements();
					resetRequirement();
				}, function(){
					alert(e.message); 
				});
		}
	};	
} // requirementCtrl