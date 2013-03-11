'use strict';

myApp.factory('groups', function( $http, $q ){
	
	var groups = {
			load : function(callback){
				var groups = [];
				$http({method:'GET', url:'api/v1/index.cfm/groups'}).success(function(data){	
					angular.forEach(data.DATA, function(items){
						groups.push({ 
							'id': items[0],
							'groupname': items[1],
							'projectid': items[2],
							'projectname':items[3]
						}); // groups.push
					}); //angular.forEach
				}); // http
				callback(groups);
			}, // load
			typeahead : function( projectid, callback){
				var typeahead = [];
				$http({method:'GET', url:'api/v1/index.cfm/groups'}).success(function(data){	
					angular.forEach(data.DATA, function(items){
						if( projectid == items[2] ) {
							typeahead.push( items[1] ); 
						} //if
					}); //angular.forEach
				}); // http
				callback( typeahead );
			}, // tyepahead
			get : function(groups, id, callback){
				var group = groups.filter( function(g){
					return (g.id === id);
				});
				callback(angular.copy(group[0]));
			}, // get
			delete : function(id){
				var deferred = $q.defer();
				$http({method:'DELETE', url:'api/v1/index.cfm/group/'+id}).success(function(){	
					deferred.resolve('Delete Successful');
				}).error(function(data){ 
					deferred.reject({message:"delete failed", name:"exception"}); 
				});
				return deferred.promise;
			}, //delete
			add : function(dataPOST){
				var deferred = $q.defer();
				$http({method:'POST', url:'api/v1/index.cfm/groups', data:dataPOST }).success(function(){	
					deferred.resolve('Add Successful');
				}).error(function(){ 
					deferred.reject({message:"submit failed", name:"exception"}); 
				});
				return deferred.promise;
			},	
			update : function(id, dataPOST) {
				var deferred = $q.defer();
				$http({method:'PUT', url:'api/v1/index.cfm/group/' + id, data:dataPOST }).success(function(){	
					deferred.resolve('Update Successful');
				}).error(function(data){ 
					deferred.reject({message:"update failed", name:"exception"}); 
				});
				return deferred.promise;
			}	// update
		}; // groups

	return groups;

});