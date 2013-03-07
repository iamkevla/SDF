'use strict';

myApp.factory('requirements', function( $http, $q ){
	
	var requirements = {
		loadStatus : function(callback){
			var status = [];
			$http({method:'GET', url:'api/v1/index.cfm/status'}).success(function(data){	
				angular.forEach(data.DATA, function(items){
					status.push({ 'status': items[0] });
				});
				callback(status);
			});
		},	
		loadRequirements : function(projectid, callback) {
			requirements= [];
			$http({method:'GET', url:'api/v1/index.cfm/project/' + projectid + '/requirements'}).success(function(data){	
				angular.forEach(data.DATA, function(items){
					requirements.push({ 
						'id': items[0],
						'groupname': items[2].trim(),
						'requirement': items[3].trim(),
						'projectID':items[4],
						'verb': items[5].trim(),
						'noun': items[6].trim(),
						'status': items[9],
						'estimate': items[10]
					});
				});
				callback(requirements);
			});
		},
		delete: function(id){
			var deferred = $q.defer();
			$http({method:'DELETE', url:'api/v1/index.cfm/requirement/'+ id }).success(function(){	
				deferred.resolve('Delete Successful');
			}).error(function(data){ 
				deferred.reject({message:"delete failed", name:"exception"}); 
			});
			return deferred.promise;
		},
		submit: function(projectid, dataPOST){
			var deferred = $q.defer();
			$http({method:'POST', url:'api/v1/index.cfm/project/' + projectid + '/requirements', data:dataPOST })
				.success(function(data){	
					deferred.resolve('Submit Successful');

				}).error(function(data){ 
					deferred.reject({message:"submit failed", name:"exception"});
				});
			return deferred.promise;	
		},
		update: function(id, dataPOST){
			var deferred = $q.defer();
			$http({method:'PUT', url:'api/v1/index.cfm/requirement/' + id, data:dataPOST })
				.success(function(data){	
					deferred.resolve('Submit Successful');
				}).error(function(data){ 
					deferred.reject({message:"submit failed", name:"exception"});
				});
			return deferred.promise;
		}
	};

	return requirements;

});