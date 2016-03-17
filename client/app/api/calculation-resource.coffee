###
    Source: api/calculation-resource.coffee 
    Project: dep73-calc
    Description: An abstraction over $http to manage 
                calculations db interactions using 
                $resourse from ngResourse module
    Author: Alexander Tatchin | github.com/sancau
###

# Calculation resource definition
CalculationResource = ($resource, AppConfig) ->

    url = AppConfig.database.resources.calculationsUrl

    config = 
        query: 
            method: 'GET'
            isArray: no

    return $resource("#{url}/:id", { id: '@_id'}, config)

# Calculation resource registration
angular.module 'app'
.factory 'CalculationResource', [
        '$resource'
        'AppConfig'

        CalculationResource
    ]
