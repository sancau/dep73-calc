###
    Source: directives/lc-string-input/lc-string-input.coffee 
    Project: dep73-calc
    Description: Custom directive for string input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'lc.directives'
.directive 'lcStringInput', () ->
	replace: on
	restrict: 'E'
	scope: 
		label: '@'
		inputId: '@'
		required: '='
		inputObject: '='
		submitted: '='
	templateUrl: 'directives/lc-string-input/lc-string-input-view.html'
	link: (scope) ->