###
    Source: directives/lc-select-input/lc-select-input.coffee 
    Project: dep73-calc
    Description: Custom directive for select input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'lc.directives'
.directive 'lcSelectInput', () ->
	replace: on
	restrict: 'E'
	scope: 
		label: '@'
		inputId: '@'
		required: '='
		inputObject: '='
		options: '='
		selectedOption: '='
		submitted: '='
	templateUrl: 'directives/lc-select-input/lc-select-input-view.html'
	link: (scope) ->