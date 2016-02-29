###
    Source: calculation/controllers/general-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for general information inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
GeneralCtrl = ($scope) ->

    # TODO >> Should get select options from the configuration in DB
    # For now it's hardcoded
    $scope.options = [
        { 
            label: 'Квалификационные'
            value: '1'
        }
        { 
            label: 'Конструкторско-доводческие'
            value: '2'
        }
        { 
            label: 'Периодические'
            value: '3'
        }
        { 
            label: 'Приёмо-сдаточные'
            value: '4'
        }
        { 
            label: 'Предварительные'
            value: '5'
        }
        { 
            label: 'Типовые'
            value: '6'
        }
        { 
            label: 'Иное'
            value: '7'
        }
    ]

    # Logic on general data submission
    $scope.OnSubmit = () ->
        $scope.submitted = on

        ###
            Create new report in db
            Save progress in db
            Update status panel
        ###


# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'
        GeneralCtrl
    ]