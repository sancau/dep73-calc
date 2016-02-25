// Main application module

// Labour Calculator Application Object
angular.module
(   
    'app', 
    [
        'dm.stickyNav', 
        'ngAnimate', 
        'ui.bootstrap',
        'lc.directives',
        'app.calculation',
       	// TODO 'app.listview',
        'ui.router'
    ]
)

.config( function myAppConfig ( $stateProvider, $urlRouterProvider ) {
  $urlRouterProvider.otherwise( '/' );
})

.run( function run () {
})

.controller( 'AppCtrl', function AppCtrl ( $scope, $location ) {
  $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams){
    if ( angular.isDefined( toState.data.pageTitle ) ) {
      $scope.pageTitle = toState.data.pageTitle + ' | ЦНИИ РТК' ;
    }
  });
})

;