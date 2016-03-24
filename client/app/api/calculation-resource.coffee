###
    Source: api/calculation-resource.coffee 
    Project: dep73-calc
    Description: CalculationResource using $resource
    Author: Alexander Tatchin | github.com/sancau
###

# definition
CalculationResource = ($resource, AppConfig) ->
 
    url = AppConfig.database.resources.calculationsUrl

    plainConfig = 
        query: 
            method: 'GET'
            isArray: yes
        update:
            method: 'PUT'

    return $resource("#{url}/:id", { id: '@_id'}, plainConfig)

# registration
angular.module 'app'
.factory 'CalculationResource', [
        '$resource'
        'AppConfig'

        CalculationResource
    ]