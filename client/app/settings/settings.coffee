###
    Source: settings/settings.coffee 
    Project: dep73-calc
    Description: app.settings module definition
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.settings', [
    'ui.router'
]

.config [
    '$stateProvider'

    ($stateProvider) ->
        $stateProvider.state 'settings',
            url: '/settings'
            views: 
                'main':
                    controller: 'SettingsCtrl as settings'
                    templateUrl: 'settings/views/settings-view.jade'
            data:
                pageTitle: 'Профили настроек'
]