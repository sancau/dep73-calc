// Main application module

// Labour Calculator Application Object
app = angular.module
(   
    'app', 
    [
        'dm.stickyNav', 
        'ngAnimate', 
        'ui.bootstrap',
        'lc.directives'
    ]
);

// Controls tbe section of inputs for general information
app.controller('GeneralCtrl', function($scope) {

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
    $scope.OnSubmit = function(){
        $scope.submitted = true;

        // Create new report in db
        // Save progress in db
        // Update Status panel
    } 
});

// Controls the section of inputs for climatic tests
app.controller('ClimaticCtrl', function($scope) {
   
    // initial array of field groups contains 1 blank block
    $scope.blocks = [{}];
    
    // returns a verbose name for a block to display
    $scope.getName = function($index) {
        return 'Блок ' + $index;
    };
    
    // add block logic
    $scope.clone = function() {
        // if form structure changed after submit attempt the state resets
        $scope.submitted = false;

        $scope.blocks.push({});
    };
    
    // delete block logic
    $scope["delete"] = function(block) {
        var index;

        // if form structure changed after submit attempt the state resets
        $scope.submitted = false;

        // if 0 blocks will remain after deletion
        // a new blank block should be populated after deletion
        if ($scope.blocks.length === 1) {
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
    $scope.options = [
        {   
            id: 1, 
            name: 'Повышенная температура', 
            formView: 'views/temperature-form.html'
        },
        { 
            id: 2, 
            name: 'Пониженная температура', 
            formView: 'views/temperature-form.html'
        },
        { 
            id: 3, 
            name: 'Пониженная влажность', 
            formView: 'views/humidity-form.html'
        },
        { 
            id: 4, 
            name: 'Повышенная влажность', 
            formView: 'views/humidity-form.html' 
        }
    ];
    
    // Logic on climatic data submition
    $scope.OnSubmit = function(){
        $scope.submitted = true;

        // general info should be already submited 
        // else cancel sumbition of climatic and notify user
        
        // If report object exists         
        // Save progress in db
        // Update Status panel
    } 
});
