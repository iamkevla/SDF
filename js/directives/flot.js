'use script';

myApp.directive('chart', function(){
    return{
        restrict: 'E',
        scope:{
        	data : '=',
        	opts : '='
        },
        link: function(scope, elem, attrs){  

            var chart = null;

            scope.$watch('data', function(v){
                if(!chart){
                    chart = $.plot(elem, v , scope.opts);
                    elem.show();
                }else{
                    chart.setData(v);
                    chart.setupGrid();
                    chart.draw();
                }
            }); 
     		//elem.plot( scope.data, scope.opts ).data("plot");
            //elem.show();
        }
    };
});