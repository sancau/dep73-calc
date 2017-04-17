
###
    Source: api/api.coffee
    Project: dep73-calc
    Description: Defines server API interaction services
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'api', [
    'restangular'
]

.config [
    'RestangularProvider'

    (RestangularProvider, APIBaseURL) ->
        RestangularProvider
            .setBaseUrl 'http://sqlisp:3000/api/v1'
]

.factory 'ConfiguredRestangular', [
    'Restangular'

    (Restangular) ->
        Restangular.withConfig (RestangularConfigurer) ->
            RestangularConfigurer.setRestangularFields {
                id: '_id'
            }
]

.factory 'CalculationAPI', [
    'ConfiguredRestangular'

    (ConfiguredRestangular) ->
        ConfiguredRestangular.service('calculation')
]

.factory 'PresetAPI', [
    'ConfiguredRestangular'

    (ConfiguredRestangular) ->
        ConfiguredRestangular.service('preset')
]

.factory 'UserAPI', [
    'ConfiguredRestangular'

    (ConfiguredRestangular) ->
        ConfiguredRestangular.service('user')
]
