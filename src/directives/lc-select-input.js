// select input directive definition

angular.module('lc.directives').directive('lcSelectInput', function(){
	return {
		replace: true,
		restrict: 'E',
		scope: {
			label: '@',
			inputId: '@',
			inputObject: '=',
			options: '=',
			selectedOption: '=',
			required: '=',
			submitted: '=',
		},
		templateUrl: 'views/directives/lc-select-input-view.html',
		link: function(scope) {}
	};
});