// climatic-ctrl.js @ dep73-calc
// Controller for the climatic tests inputs section

angular.module('app').controller
(
    'ClimaticCtrl', 
    [
        '$scope',
        function($scope) 
        {
   
            // initial array of field groups contains 1 blank block
            $scope.blocks = [{}];
            
            // returns a verbose name for a block to display
            $scope.getName = function($index) 
            {
                return 'Блок ' + $index;
            };
            
            // add block logic
            $scope.clone = function() 
            {
                // if form structure changed after submit attempt the state resets
                $scope.submitted = false;

                $scope.blocks.push({});
            };
    
            // delete block logic
            $scope["delete"] = function(block) 
            {
                var index;

                // if form structure changed after submit attempt the state resets
                $scope.submitted = false;

                // if 0 blocks will remain after deletion
                // a new blank block should be populated after deletion
                if ($scope.blocks.length === 1) 
                {
                   var populateBlank = true;
                }

                // delete field group by index
                index = $scope.blocks.indexOf(block);
                $scope.blocks.splice(index, 1);
                
                // populate a new blank field group if need
                if (populateBlank) 
                {
                    $scope.blocks.push({});
                }
            };
    
            // TODO should get select options from the configuration in DB
            // For now it's hardcoded
            $scope.options = 
            [
                {   
                    id: 1, 
                    name: 'Повышенная температура', 
                    formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.html'
                },
                { 
                    id: 2, 
                    name: 'Пониженная температура', 
                    formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.html'
                },
                { 
                    id: 3, 
                    name: 'Пониженная влажность', 
                    formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.html'
                },
                { 
                    id: 4, 
                    name: 'Повышенная влажность', 
                    formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.html' 
                }
            ];
    
            // Logic on climatic data submition
            $scope.OnSubmit = function()
            {
                $scope.submitted = true;

                // general info should be already submited 
                // else cancel sumbition of climatic and notify user
                
                // If report object exists         
                // Save progress in db
                // Update Status panel
            } 
        }
    ]
);
