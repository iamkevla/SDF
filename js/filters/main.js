'use strict';

myApp.filter('boldify', function(){
	return function(text, verb, noun){
		return (text
			.replace( verb.trim(), '<b>' + verb + '</b>' )
			.replace( noun.trim(), '<b>' + noun + '</b>' )
		);
	};
});