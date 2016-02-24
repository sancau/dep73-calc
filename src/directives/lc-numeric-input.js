// text area input directive definition

angular.module('lc.directives').directive('lcNumericInput', function(){
	return {
		replace: true,
		restrict: 'E',
		scope: {
			label: '@',
			inputId: '@',
			required: '=',
			inputObject: '=',
			submitted: '=',
			value: '@',
			min: '@',
			max: '@',
			step: '@',
		},
		templateUrl: 'views/directives/lc-numeric-input-view.html',
		link: function(scope) {}
	};
});