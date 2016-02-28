###
 	Source: app-ctrl.coffee 
 	Project: dep73-calc
 	Description: Main application controller
 	Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app'
	.controller 'AppCtrl', [
		'$scope'
		'$location'

		($scope, $location) ->

			# initial pageTitle value
			$scope.pageTitle = "ЦНИИ РТК"

			# change of state affects pageTitle value
			$scope.$on '$stateChangeSuccess', (event, toState, toParams, fromState, fromParams) ->
				if angular.isDefined toState.data.pageTitle
					$scope.pageTitle = "#{toState.data.pageTitle} | ЦНИИ РТК"
	]
	