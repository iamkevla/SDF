'use script';

myApp.directive("sortable", function($http){

	var update = function( event, ui ) {
		$http({ 
			method: 'PUT',
			url: 'api/v1/index.cfm/requirement/' + ui.item.attr('data-id'),
			data: { infrontof: ui.item.next().attr('data-id') }
		});
    }; // update

	return{
		restrict: "A",
		link: function(scope, element, attrs){
			element.sortable({
				cursor: 'move',
    			update: update,
    			axis: 'y'
			});
		} //link
	}; //return

}); // directive sortable