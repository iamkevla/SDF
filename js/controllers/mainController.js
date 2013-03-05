function mainCtrl($scope, $http, projects){

	var model = {
		projects:[],
		project:{
			id: '',
			projectname: '',
			description: '',
			parentid: '' 
		},
		groups:[],
			group:{
				id: '',
				groupname: '',
				projectid: ''
			},
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
		status: []
		};

	projects.load(function(response){
		model.projects = response; 
	});
	
	$scope.model = model;

}