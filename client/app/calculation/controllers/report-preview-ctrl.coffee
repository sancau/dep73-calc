reportPreviewCtrl = (Current) ->
    vm = this
    vm.report = Current.getReport(Current.calculation).report
    return vm

# controller registration
angular.module 'app.calculation'
    .controller 'ReportPreviewCtrl', [
        'Current'
        reportPreviewCtrl
    ]