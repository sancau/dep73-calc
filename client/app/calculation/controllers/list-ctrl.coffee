###
    Source: list/controllers/list-ctrl.coffee
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

ListCtrl = ($state, $http, allCalculations, CalculationAPI, Current) ->

    vm = this
    vm.calculationsList = allCalculations

    vm.showCalculation = (calculation) ->
        $state.go 'calculation', { calculationID: calculation._id }

    vm.delete = (calculation) ->
        if window.confirm('Вы действительно хотите удалить расчёт?')
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

    vm.clone = (calculation) ->
        console.log calculation

        data =
            meta: calculation.meta
            general: calculation.general
            climatic: calculation.climatic
            mechanic: calculation.mechanic
            additional: calculation.additional

        timestamp = new Date()
        timestamp = timestamp.toLocaleString('ru')
        initialName = data.general.name
        data.general.name = "[КЛОНИРОВАНИЕ #{initialName}] (#{timestamp})"

        CalculationAPI.post(data)
            .then(
                    # success
                    (newEntity) ->
                        console.log newEntity
                        $state.go 'calculation', { calculationID: newEntity._id }
                    # error
                    (error) ->
                        console.log error
            )

    vm.createReport = (calculation) ->
        req =
            url: 'http://sqlisp:3000/api/v1/report'
            method: 'POST'
            data: Current.getReport(calculation)

        console.log 'REQUEST DATA: '
        console.log req.data
        vm.monitor = req.data # DEBUG

        $http(req)
            .then(
                (data) ->
                    window.alert 'Отчёт успешно создан и сохранен в папку ТРУДОЁМКОСТЬ РАСЧЁТЫ, которая находится в общей папке документов отдела.'
                    console.log data

                (error) ->
                    window.alert 'При создании отчёта произошла ошибка - свяжитесь с администратором'
                    console.log error
            )

    vm.sortField = null
    vm.sortReverse = false

    vm.sortingClicked = (value) ->
        if value == vm.sortField and vm.sortReverse
            vm.sortField = null
            vm.sortReverse = false
        else if value == vm.sortField
            vm.sortReverse = !vm.sortReverse
        else
            vm.sortField = value
            vm.sortReverse = false

    vm.faDown = (value) -> vm.sortField == value and !vm.sortReverse
    vm.faUp = (value) -> vm.sortField == value and vm.sortReverse

    return vm

# controller registration
angular.module 'app.calculation'
.controller 'ListCtrl', [
    '$state'
    '$http'
    'allCalculations'
    'CalculationAPI'
    'Current'

    ListCtrl
]
