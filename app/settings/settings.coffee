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
                    controller: 'SettingsCtrl'
                    templateUrl: 'settings/views/settings-view.html'
            data:
                pageTitle: 'Профили настроек'
]