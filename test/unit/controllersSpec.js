'use strict';

/* jasmine specs for controllers go here */

describe('test Controllers', function(){
 
  beforeEach(function(){        
    this.addMatchers({
      toEqualData: function(expected) {
        return angular.equals(this.actual, expected);
      }
    });
  });

  // load the controller's module    
  beforeEach(angular.mock.module('myApp'));
  
  describe('mainCtrl', function(){

      var scope,
          ctrl, 
          $httpBackend,        
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

      var baseAPI = "api/v1/index.cfm/";  

      beforeEach(inject(function( _$httpBackend_, $rootScope, $controller, projects){
        $httpBackend = _$httpBackend_;
      
        //load projects
        $httpBackend.expectGET( baseAPI + 'projects').respond( mockProjects() );
      
        scope = $rootScope.$new();
        ctrl = $controller( 'mainCtrl', { $scope:scope, projects:projects })
      }));

      it('should initialise model', function(){
        expect(scope.model).toBeDefined();
      });

      it('should be able to load projects', function(){
        $httpBackend.flush();
        expect( scope.model.projects[0] )
          .toEqualData({ 
              "id": 1,
              "projectname": "Mumbles",
              "description": "",
              "parentid": null,
              "dbserver": "localhost",
              "dbname": "Mumbles"
          });
      });
  }); // mainCtrl


  describe('projectCtrl - setup ', function(){

    var scope,
        ctrl, 
        $httpBackend,        
        mockProjects = function() {          
          return { "COLUMNS": 
                      ["ID","PROJECTNAME","DESCRIPTION","PARENTID","DBSERVER","DBNAME"],
                    "DATA":[
                      [1,"Mumbles","",null,"localhost","Mumbles"],
                      [2,"SDF","Something about SDF",null,"localhost","SDF"],
                      [73,"Collections OB Campaigns","Outbound Dialler",null,null,null],
                      [116,"testname","Some text required here",null,null],
                    ]
                 };     
        };

    var baseAPI = "api/v1/index.cfm/"; 

    beforeEach(inject(function( _$httpBackend_, $rootScope, $controller){
      $httpBackend = _$httpBackend_;

      //mock post projects
      $httpBackend.expectPOST( baseAPI + 'projects').respond(201, '');
      $httpBackend.expectGET( baseAPI + 'projects').respond( mockProjects() );

      
      $rootScope.model = {project:{}};
      scope = $rootScope.$new();
      ctrl = $controller( 'projectCtrl', { $scope: scope });
    }));

    it('should be able to add new project', function(){
      scope.model.project.id = '';
      scope.model.project.projectname = 'testname';
      scope.model.project.description = 'Some text required here';
      scope.model.project.parentid = '';
      scope.submit();
      $httpBackend.flush();
    });
  }); //projectCtrl - setup

  describe('projectCtrl -- editing...', function(){

    var scope,
        ctrl, 
        $httpBackend,        
        mockEditedProjects = function() {          
          return { "COLUMNS": 
                      ["ID","PROJECTNAME","DESCRIPTION","PARENTID","DBSERVER","DBNAME"],
                    "DATA":[
                      [1,"Mumbles","",null,"localhost","Mumbles"],
                      [2,"SDF","Something about SDF",null,"localhost","SDF"],
                      [73,"Collections","Blah Blah",null,null,null],
                      [116,"testname","Some text required here",null,null],
                    ]
                 };     
        };

    var baseAPI = "api/v1/index.cfm/"; 

    beforeEach(inject(function( _$httpBackend_, $rootScope, $controller){
      $httpBackend = _$httpBackend_;

      $httpBackend.expectPUT( baseAPI + 'project/73' ).respond(201, '');
      $httpBackend.expectGET( baseAPI + 'projects').respond( mockEditedProjects() );

      $rootScope.model = {project:{},
                          projects:[
                            {id:73, projectname: "Collections OB Campaigns", description: "Outbound Dialler" },
                            {id:116, projectname: "testname", description: "Some text required here" }
                        ]};
      scope = $rootScope.$new();
      ctrl = $controller( 'projectCtrl', { $scope: scope });
    }));

    it('should be able to get existing project', function(){
      scope.getProject(73);
      expect(scope.model.project).toEqualData({id:73, projectname: "Collections OB Campaigns", description: "Outbound Dialler" });
    });

    it('should be able to edit an existing project', function(){
      scope.getProject(73);
      scope.model.project.projectname = 'Collections';
      scope.model.project.description = 'Blah Blah';
      scope.update();
      $httpBackend.flush();
      expect(scope.model.projects[2]).toEqualData({ id : 73, projectname : 'Collections', description : 'Blah Blah', parentid : null, dbserver : null, dbname : null });
    });

  }); // projectCtrl  - editing...
  
  describe('projectCtrl -- delete...', function(){

    var scope,
        ctrl, 
        $httpBackend,        
        mockDeletedProjects = function() {          
          return { "COLUMNS": 
                      ["ID","PROJECTNAME","DESCRIPTION","PARENTID","DBSERVER","DBNAME"],
                    "DATA":[
                      [1,"Mumbles","",null,"localhost","Mumbles"],
                      [73,"Collections","Blah Blah",null,null,null],
                      [116,"testname","Some text required here",null,null],
                    ]
                 };     
        };

    var baseAPI = "api/v1/index.cfm/"; 

    beforeEach(inject(function( _$httpBackend_, $rootScope, $controller){
      $httpBackend = _$httpBackend_;

      $httpBackend.expectDELETE( baseAPI + 'project/2' ).respond(201, '');
      $httpBackend.expectGET( baseAPI + 'projects').respond( mockDeletedProjects() );

      $rootScope.model = {
                            projects:[],
                            project:{}
                          };
      scope = $rootScope.$new();
      ctrl = $controller( 'projectCtrl', { $scope: scope });
    }));

    it('should be able to get existing project', function(){
      scope.deleteProject(2);
      $httpBackend.flush();
      expect(scope.model.projects.length).toBe(3);
    });

  }); // projectCtrl  - editing...

}); // test Controllers