'use strict';

myApp.factory('projects', function( $http, $q ){
	
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
			'delete' : function(id){
				var deferred = $q.defer();
				$http({method:'DELETE', url:'api/v1/index.cfm/project/' + id }).success(function(){	
					deferred.resolve('Delete Successful');
				}).error(function(data){ 
					deferred.reject({message:"delete failed", name:"exception"}); 
				});
				return deferred.promise;
			},
			add : function(dataPOST){
				var deferred = $q.defer();
				$http({method:'POST', url:'api/v1/index.cfm/projects', data:dataPOST }).success(function(){	
					deferred.resolve('Add Successful');
				}).error(function(){ 
					deferred.reject({message:"submit failed", name:"exception"}); 
				});
				return deferred.promise;
			},	
			update : function(id, dataPOST) {
				var deferred = $q.defer();
				$http({method:'PUT', url:'api/v1/index.cfm/project/' + id, data:dataPOST }).success(function(data){	
					deferred.resolve('Update Successful');
				}).error(function(data){ 
					deferred.reject({message:"update failed", name:"exception"}); 
				});
				return deferred.promise;
			}	
		}; //projects

	return projects;

});