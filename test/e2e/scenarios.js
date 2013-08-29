'use strict';

/* http://docs.angularjs.org/guide/dev_guide.e2e-testing */
describe('myApp', function() {

  beforeEach(function() {
    browser().navigateTo('/projects/');
  });

  it(' should automatically redirect to /main when location hash/fragment is empty', function() {
    expect(browser().location().url()).toBe("/main");
  });


  describe('main', function() {

    beforeEach(function() {
      browser().navigateTo('#/main');
    });

    it(' should render main when user navigates to /main', function() {
      expect(element('[ng-view] h2:first').text()).toBe('What is this?');
    });

    it(' should be able to click readme to get for details', function(){
      expect(element('[ng-view] div[ng-show="showIntro"]').attr('style')).toBe("display:none");
      element('[ng-view] a.readm:first').click();
      expect(element('[ng-view] div[ng-show="showIntro"]').attr('style')).toBe("");
    });

    it(' should be able to navigate to #/projects by using the menu', function(){
      element('a[href="#/projects"]:first').click();
      expect(browser().location().url()).toBe("/projects");
    });

  });

  describe('projects', function() {

    beforeEach(function() {
      browser().navigateTo('#/projects');
    });

    it(' should render #/projects when user navigates to /projects', function() {
      expect(element('[ng-view] label:first').text()).toBe("Project Name:");
    });

    it(' should have the ability to view projects', function(){
      expect(element('tr').count()).toBeGreaterThan(5);
    });

    it(' should be able to add a Project', function(){
       input('model.project.projectname').enter('jacksparrow');
       input('model.project.description').enter('jacksparrow is a Project');
       element('input[value="Submit"]:first').click();
       expect(element('tr:last > td:first').text()).toMatch("jacksparrow");
    });

    it(' should be able to edit a Project', function(){
      element('tr:last > td:last > div a:first').click();
      input('model.project.description').enter('jacksparrow is a Project that has been edited');
      element('input[value="Update"]:first').click();
      element('tr:last > td:last > div a:first').click();
      expect( element('textarea[ng-model="model.project.description"]').val() )
        .toBe('jacksparrow is a Project that has been edited');
    });

   it(' should be able to delete a Project', function(){
      element('tr:last > td:last > div a:last').click();
      expect(element('tr:last > td:first').text()).not().toMatch("jacksparrow");
    });

  });

  describe('groups', function(){

    beforeEach(function() {
      browser().navigateTo('#/groups');
    });

    it(' should render #/groups when user navigates to /groups', function() {
      expect(element('[ng-view] label:first').text()).toMatch("Grouping:");
    });

    it(' should have the ability to view groups', function(){
      expect(element('tr').count()).toBeGreaterThan(10);
    });

  });

  describe('requirements', function(){

    beforeEach(function() {
      browser().navigateTo('#/requirements');
    });

    it(' should render #/requirements when user navigates to /requirements', function() {
      expect(element('[ng-view] label:first').text()).toMatch("Project:");
    });

    it(' should have the ability to view requirements', function(){
      expect(element('tr').count()).toBeGreaterThan(10);
    });

    it(' should have the ability to select another project requirements to view', function(){
      select('model.requirement.projectid').option('SDF');
      expect(element('tr:last > td:first').text()).toBe("90");
    });

    it(' should have the ability to add a new Requirement', function(){
       select('model.requirement.projectid').option('SDF');
       expect(element('tr').count()).toBe(20);
       input('model.requirement.requirement').enter('This is a test requirement');
       element('input[value="Submit"]:first').click();
       expect(element('tr').count()).toBe(21);
    });

    it(' should have the ability to edit a Requirement', function(){
      select('model.requirement.projectid').option('SDF');
      element('tr:last > td:last > div a:first').click();
      input('model.requirement.requirement').enter('edited');
      element('input[value="Submit"]:first').click();
      sleep(1);
      element('tr:last > td:last > div a:first').click();
      expect( element('textarea[ng-model="model.requirement.requirement"]').val()).toBe('edited');
    });

    it(' should be able to delete a Requirement', function(){
      select('model.requirement.projectid').option('SDF');
      expect(element('tr').count()).toBe(21);
      element('tr:last > td:last > div a:last').click();
      expect(element('tr').count()).toBe(20);
    });

  });

});
