//
// test/midway/appSpec.js
//
describe("Midway: Testing Modules", function() {
  describe("App Module:", function() {

    var module;
    beforeEach(function() {
      module = angular.module("myApp");
    });

    it("should be registered", function() {
      expect(module).not.toEqual(null);
    });

  });
});