// text area input directive definition

angular.module('lc.directives').directive('lcStringInput', function(){
	return {
		replace: true,
		restrict: 'E',
		scope: {
			label: '@',
			inputId: '@',
			required: '=',
			inputObject: '=',
			submitted: '=',
		},
		templateUrl: 'views/directives/lc-string-input-view.html',
		link: function(scope) {}
	};
});