###
 	Source: app.coffee 
 	Project: dep73-calc
 	Description: Main application module
 	Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app', [
	'dm.stickyNav'
	'ngAnimate'
	'ui.bootstrap'
	'lc.directives'
	'app.calculation'
	'app.list'
	'ui.router'
]
.config [
	'$stateProvider'
	'$urlRouterProvider'

	($stateProvider, $urlRouterProvider) ->
		$urlRouterProvider.otherwise '/'
]
