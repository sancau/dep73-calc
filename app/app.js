// app.js @ dep73-calc 
// Main application module

angular.module
(   
    'app', 
    [
        'dm.stickyNav', 
        'ngAnimate', 
        'ui.bootstrap',
        'lc.directives',
        'app.calculation',
        'ui.router'
    ]
)

.config
(
    [
        '$stateProvider', 
        '$urlRouterProvider', 
        function($stateProvider, $urlRouterProvider) 
        {
            $urlRouterProvider.otherwise( '/' );
        }
    ]
)

.controller
( 
    'AppCtrl', 
    [
        '$scope', 
        '$location', 
        function($scope, $location) 
        {
            $scope.$on
            (
                '$stateChangeSuccess', 
                function(event, toState, toParams, fromState, fromParams)
                {
                    if (angular.isDefined(toState.data.pageTitle)) 
                    {
                        $scope.pageTitle = toState.data.pageTitle + ' | ЦНИИ РТК';
                    }
                }
            );
        }
    ]
);