function projectCtrl( $scope, $http ){

	var model = {
		projects: [],
		project:{
			id: '',
			projectname: '',
			description: '',
			parentid: '' 
		}
	};

	$scope.model = model;


	$http({method:'GET', url:'api/v1/index.cfm/projects'}).success(function(data){	
		angular.forEach(data.DATA, function(items){
			model.projects.push({ 
				'id': items[0],
				'projectname': items[1],
				'description': items[2], 
				'parentid': items[3], 
				'dbserver': items[4],
				'dbname': items[5]
			});
		});
	});

	$scope.getProject = function(id){
		var project = model.projects.filter(function(p){
			return (p.id === id);
		});
		model.project.id = project.id; 
	};



/*
	<!--- check if it is a request to edit --->
	<cfif isdefined("url.id")>
		<cfquery dbtype="query" name="Project" >
			select id, ProjectName, description, parentid from Projects where id = #url.id#
		</cfquery>
	<cfelse>
		<cfset Project.id = ""  >
		<cfset Project.ProjectName ="">
		<cfset Project.Description ="">
		<cfset Project.parentID = "" >
	</cfif>
*/
	
}

if (!Array.prototype.filter)
{
  Array.prototype.filter = function(fun /*, thisp */)
  {
    "use strict";
 
    if (this == null)
      throw new TypeError();
 
    var t = Object(this);
    var len = t.length >>> 0;
    if (typeof fun != "function")
      throw new TypeError();
 
    var res = [];
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in t)
      {
        var val = t[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, t))
          res.push(val);
      }
    }
 
    return res;
  };
}