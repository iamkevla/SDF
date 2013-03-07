'use strict';

describe('Services', function() {
	beforeEach(angular.mock.module('myApp'));

	describe(' Projects', function(){

		var $httpBackend,        
         	mockProjects = function() {          
	            return { "COLUMNS": 
	                        ["ID","PROJECTNAME","DESCRIPTION","PARENTID","DBSERVER","DBNAME"],
	                      "DATA":[
	                        [1,"Mumbles","",null,"localhost","Mumbles"],
	                        [2,"SDF","Something about SDF",null,"localhost","SDF"],
	                        [73,"Collections OB Campaigns","Outbound Dialler",null,null,null]
	                      ]
	                   };     
	          };

		beforeEach(inject(function( _$httpBackend_ ){
	        $httpBackend = _$httpBackend_;
	        $httpBackend.expectGET( 'api/v1/index.cfm/projects').respond( mockProjects() );
      	}));

		it(' should be able to load projects service', inject(function(projects){
			expect(projects).not.toEqual(null);
			expect(typeof projects.get).toBe('function');
	    }));	

	  	it(' should be able to load projects', inject(function( projects ){
	  		var myProjects;
	  		projects.load(function(response){
	  			myProjects = response;
	  		});
	  		$httpBackend.flush();
	  		expect(myProjects.length).toBe(3);
	  	}));
	  
		it(' should be able to get a specifc project from projects ', inject(function(projects){
			var project, myProjects;
			projects.load(function(response){
	  			myProjects = response;
	  		});
	  		$httpBackend.flush();
			projects.get(myProjects, 2, function(response){
				project = response;
			});

			expect( project ).toMatch({id:2, projectname:"Tester", description:"my second project"});

		}));
	});	

	describe(' Groups', function(){

		var $httpBackend,   
			mockGroups = {
				"COLUMNS":
					["ID","GROUPNAME","PROJECTID","PROJECTNAME"],
				"DATA":[
					[1,"User Management",1,"Mumbles"],
					[2,"Communication",null,null],
					[3,"Non Functional",1,"Mumbles"] 
				]
			};		

		beforeEach(inject(function( _$httpBackend_ ){
	        $httpBackend = _$httpBackend_;
	        $httpBackend.expectGET( 'api/v1/index.cfm/groups').respond( mockGroups );
      	}));		

		it(' should be able to load groups service', inject(function(groups){
			expect(groups).not.toEqual(null);
			expect(typeof groups.get).toBe('function');
	    }));

	   	it(' should be able to load groups', inject(function( groups ){
	  		var myGroups;
	  		groups.load(function(response){
	  			myGroups = response;
	  		});
	  		$httpBackend.flush();
	  		expect(myGroups.length).toBe(3);
	  	}));
	  
		it(' should be able to get a specifc project from projects ', inject(function(groups){
			var group, myGroups;
	  		groups.load(function(response){
	  			myGroups = response;
	  		});
	  		$httpBackend.flush();
			groups.get(myGroups, 2, function(response){
				group = response;
			});

			expect( groups ).toMatch({id:2, groupname:"Tester" });

		}));
	});	


	describe(' Requirements', function(){

		var $httpBackend,   
			mockRequirements = {
				"COLUMNS":
					["ID","GROUPID","GROUPNAME","REQUIREMENT","PROJECTID","VERB","NOUN","QUEUE","VERSION","STATUS","ESTIMATE"],
				"DATA":[
					[1,1,"User Management","The ability for an User to Login assuming they know what the username and password is.",1,"Login","User",0,null,null,null],
					[3,2,"Communication","Ability for user to View timeline of mumbles. Should be list of most recent mumbles.",1,"View","Mumbles",1,null,null,null],
					[226,2,"Communication","Ability to view mumbles and see replies below original mumble.",1,"view","Mumbles",2,null,"In Analysis",3]
				]
			};		

		beforeEach(inject(function( _$httpBackend_ ){
	        $httpBackend = _$httpBackend_;
	        $httpBackend.expectGET( 'api/v1/index.cfm/project/1/requirements').respond( mockRequirements );
      	}));		

		it(' should be able to load requirements service', inject(function(requirements){
			expect(requirements).not.toEqual(null);
	    }));

	   	it(' should be able to load requirements', inject(function( requirements ){
	  		var myRequirements;
	  		requirements.loadRequirements(1, function(response){
	  			myRequirements = response;
	  		});
	  		$httpBackend.flush();
	  		expect(myRequirements.length).toBe(3);
	  	}));
	});	
});