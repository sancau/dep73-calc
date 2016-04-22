###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

ListCtrl = ($state, $http, allCalculations, CalculationAPI) ->
    
    vm = this
    vm.calculationsList = allCalculations

    vm.showCalculation = (calculation) ->
        $state.go 'calculation', { calculationID: calculation._id }

    vm.delete = (calculation) -> 
        CalculationAPI.one(calculation._id).get().
            then(
                (entity) ->
                    entity.remove()
                        .then(                        
                            # success
                            (data) ->  
                                vm.calculationsList.pop calculation
                            # error
                            (error) ->
                                console.log error
                        )
                (error) ->
                    console.log error                    
            )

    vm.createReport = (calculation) ->
        req = 
            url: 'http://localhost:3000/api/v1/report'
            method: 'GET'
            params: 
                calculation: calculation

        vm.monitor = calculation

        console.log vm.monitor

        $http(req)
            .then(
                (data) -> 
                    window.alert 'Отчёт создан!'

                (error) ->
                    window.alert 'Ошибка!'
                    console.log error
            )

    return vm

# controller registration
angular.module 'app.calculation'
.controller 'ListCtrl', [
    '$state'
    '$http'
    'allCalculations'
    'CalculationAPI'

    ListCtrl
]
