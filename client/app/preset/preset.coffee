###
    Source: preset/preset.coffee 
    Project: dep73-calc
    Description: app.preset module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.preset', [
    'ui.router'
]

.config [
    '$stateProvider'

    ($stateProvider) ->
        $stateProvider.state 'preset',
            url: '/preset'
            views: 
                'main':
                    controller: 'PresetCtrl as preset'
                    templateUrl: 'preset/preset-view.jade'
            data:
                pageTitle: 'Профили настроек'
]