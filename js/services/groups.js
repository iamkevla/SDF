myApp.factory('groups', function( $http ){
	
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
			} // load
		}; // groups

	return groups;

});