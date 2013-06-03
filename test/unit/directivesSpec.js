'use strict';

/* jasmine specs for directives go here */
describe('directives', function() {
  beforeEach(module('myApp'));

  // jasmine matcher for expecting an element to have a css class
  // https://github.com/angular/angular.js/blob/master/test/matchers.js
  beforeEach(function() {
    this.addMatchers({
      toHaveClass: function(cls) {
        this.message = function() {
          return "Expected '" + angular.mock.dump(this.actual) + "' to have class '" + cls + "'.";
        };

        return this.actual.hasClass(cls);
      }
    });
  });

  describe('stars', function(){
    var element, scope;

    it(' should be able make a star', inject(function($rootScope, $compile) {

      scope = $rootScope;

      scope.$apply(function() {
        scope.estimate = 1;
      });

      element = angular.element('<stars rating="estimate" max="5" />');
      element = $compile(element)(scope);
     
      scope.$digest();

      //expect(element.toString()).toBe('[[object HTMLElement]]');
      expect(element.find('ul') ).toHaveClass('rate');
      expect(element.find('li') ).toHaveClass('selected');

    })); // it 
  });


  describe('sortable', function(){
    var element, scope, tmpl, $httpBackend;

    it(' should be able make a sortable table', inject(function( $rootScope, $compile ) {

      scope = $rootScope;

      tmpl = '<table sortable > ' + 
                '<tr class="item" data-id="1"  ><td>1</td></tr> ' +
                '<tr class="item" data-id="2"  ><td>2</td></tr> ' +
             '</table>  ';

      element = angular.element(tmpl);
      //element = $compile(element)( scope ); // TODO cant get this to work
     
      //scope.$digest();

      //expect(element.toString()).toBe('[[object HTMLElement]]');
      //expect(element.find('ul') ).toHaveClass('rate');
      //expect(element.find('li') ).toHaveClass('selected');

    })); // it 
  });

}); //describe 'directive: stars'
