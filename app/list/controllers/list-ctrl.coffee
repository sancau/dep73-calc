###
    Source: list/controllers/list-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for the listview
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ListCtrl = ($scope) ->
	$scope.testvar = "История расчётов"

# controller registration
angular.module 'app.list'
.controller 'ListCtrl', [
    '$scope'

    ListCtrl
]
