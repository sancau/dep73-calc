###
    Source: directives/lc-text-input/lc-text-input.coffee 
    Project: dep73-calc
    Description: Custom directive for text input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'lc.directives'
.directive 'lcTextInput', () ->
	replace: on
	restrict: 'E'
	scope: 
		label: '@'
		rows: '@'
		inputId: '@'
		required: '='
		inputObject: '='
		submitted: '='
	templateUrl: 'directives/lc-text-input/lc-text-input-view.html'
	link: (scope) ->