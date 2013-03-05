myApp.factory('projects', function( $http ){
	
	var projects = {
			load : function(callback){
				var projects = [];
				$http({method:'GET', url:'api/v1/index.cfm/projects'}).success(function(data){	
					angular.forEach(data.DATA, function(items){
						projects.push({ 
							'id': items[0],
							'projectname': items[1],
							'description': items[2], 
							'parentid': items[3], 
							'dbserver': items[4],
							'dbname': items[5]
						});
					});
					callback(projects);
				});
			},
			get : function(projects, id, callback){
				var project = projects.filter( function(p){
					return (p.id === id);
				});
				callback(angular.copy(project[0]));
			},
			delete : function(id){
				$http({method:'DELETE', url:'api/v1/index.cfm/project/' + id }).success(function(){	
					return true;
				}).error(function(data){ 
					throw {message:"delete failed", name:"exception"}; 
				});
			},
			add : function(dataPOST){
				$http({method:'POST', url:'api/v1/index.cfm/projects', data:dataPOST }).success(function(){	
					return true;
					}).error(function(){ 
						throw {message:"submit failed", name:"exception"}; 
					});
			},	
			update : function(id, dataPOST) {
				$http({method:'PUT', url:'api/v1/index.cfm/project/' + id, data:dataPOST }).success(function(data){	
					return true;
				}).error(function(data){ 
					throw {message:"update failed", name:"exception"}; 
				});
			}	
		}; //projects

	return projects;

});