###
    Source: api/calculation-resource.coffee 
    Project: dep73-calc
    Description: CalculationResource using $resource
    Author: Alexander Tatchin | github.com/sancau
###

# definition
CalculationResource = ($resource, AppConfig) ->

    url = AppConfig.database.resources.calculationsUrl

    config = 
        query: 
            method: 'GET'
            isArray: no

    return $resource("#{url}/:id", { id: '@_id'}, config)

# registration
angular.module 'app'
.factory 'CalculationResource', [
        '$resource'
        'AppConfig'

        CalculationResource
    ]
