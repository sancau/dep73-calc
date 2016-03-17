###
    Source: api/presets-resource.coffee 
    Project: dep73-calc
    Description: An abstraction over $http to manage 
                presets db interactions using 
                $resourse from ngResourse module
    Author: Alexander Tatchin | github.com/sancau
###

# Settings resource definition
PresetsResource = ($resource, AppConfig) ->

    url = AppConfig.database.resources.presetsUrl

    return $resource(url, {}, {})

# Calculation resource registration
angular.module 'app'
.factory 'PresetsResource', [
        '$resource'
        'AppConfig'

        PresetsResource
    ]
