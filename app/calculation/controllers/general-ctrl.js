// general-ctrl.js @ dep73-calc
// Controller for the general information inputs section

angular.module('app').controller
(
    'GeneralCtrl', 
    [
        '$scope',
        function($scope) 
        {
            // TODO should get select options from the configuration in DB
            // For now it's hardcoded
            $scope.options = [
                { 
                    label: 'Квалификационные',
                    value: '1'
                },
                { 
                    label: 'Конструкторско-доводческие',
                    value: '2'
                },
                { 
                    label: 'Периодические',
                    value: '3'
                },
                { 
                    label: 'Приёмо-сдаточные',
                    value: '4'
                },
                { 
                    label: 'Предварительные',
                    value: '5'
                },
                { 
                    label: 'Типовые',
                    value: '6'
                },
                { 
                    label: 'Иное',
                    value: '7'
                },
            ];

            // Logic on general data submition
            $scope.OnSubmit = function()
            {
                $scope.submitted = true;

                // Create new report in db
                // Save progress in db
                // Update Status panel
            } 
        }
    ]
);