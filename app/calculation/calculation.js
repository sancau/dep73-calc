// calculation.js @ dep73-calc
// app.calculation module definition

angular.module
(
    'app.calculation', 
    [
        'ui.router',
        'ui.bootstrap'
    ]
)

.config
(   
    [
        '$stateProvider',
        function($stateProvider) 
        {
            $stateProvider 
            
            .state
            (
                'calculation', 
                {
                    url: '/calculation',        
                    views: 
                    {
                        "main": 
                        {
                            controller: 'ClimaticCtrl',
                            templateUrl: 'calculation/views/calculation-view.html'
                        }
                    },
                    data:{ pageTitle: 'Расчёт трудоёмкости' }
                }
            );
        }
    ]
);