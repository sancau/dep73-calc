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
            If $scope.generalInfoForm is valid then
            push the data from $scope.generalInfoForm to
            the $scope.calucation >> CalculationObject 

            Create new report in db
            Save progress in db
            Represent changes at the status panel

            Close current accordion group,
            open next group of inputs
        ###

        # if $scope.generalInfoForm.$valid
        #     CalculationObject.name = $scope.generalInfoForm.name.$modelValue
        #     CalculationObject.type = $scope.generalInfoForm.type.$modelValue
        #     CalculationObject.doc = $scope.generalInfoForm.doc.$modelValue
        #     CalculationObject.comment = $scope.generalInfoForm.comment.$modelValue

        #     if CalculationObject.ID is ''              
        #         ### 
        #             Go to the server and post the new calculation
        #             Then redirect to the calculation/:id 
        #         ###
        #     else
        #         ###
        #             1. Put request to the server that will update the calculation object
        #             so the status panel will update too 
        #         ###


# controller registration
angular.module 'app.calculation'
    .controller 'GeneralCtrl', [
        '$scope'

        GeneralCtrl
    ]