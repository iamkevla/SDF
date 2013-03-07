'use strict';

/* jasmine specs for filters go here */
describe('filters >', function() {

  	beforeEach(angular.mock.module('myApp'));

    it('should replace text with strong ', inject(function($filter) {
    	var boldify = $filter('boldify');
    	expect( boldify('some text to process', 'process', 'text') ).toBe('some <b>text</b> to <b>process</b>');
    }));

});