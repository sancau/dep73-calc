###
    Source: directives/lc-numeric-input/lc-numeric-input.coffee 
    Project: dep73-calc
    Description: Custom directive for numeric input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'lc.directives'
.directive 'lcNumericInput', () ->
	replace: on
	restrict: 'E'
	scope: 
		label: '@'
		inputId: '@'
		required: '='
		inputObject: '='
		submitted: '='
		value: '@'
		min: '@'
		max: '@'
		step: '@'
	templateUrl: 'directives/lc-numeric-input/lc-numeric-input-view.html'
	link: (scope) ->