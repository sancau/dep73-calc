// text area input directive definition

angular.module('lc.directives').directive('lcTextInput', function(){
	return {
		replace: true,
		restrict: 'E',
		scope: {
			label: '@',
			rows: '@',
			inputId: '@',
			required: '=',
			inputObject: '=',
			submitted: '=',
		},
		templateUrl: 'directives/lc-text-input/lc-text-input-view.html',
		link: function(scope) {}
	};
});