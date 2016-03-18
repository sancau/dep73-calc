###
    Source: api/calculation-resource.coffee 
    Project: dep73-calc
    Description: CalculationResource using $resource
    Author: Alexander Tatchin | github.com/sancau
###

# definition
CalculationResource = ($resource, AppConfig) ->
 
    resource =
        # wrapper to receive params likes etag, token, etc
        etag: (etag) ->

            url = AppConfig.database.resources.calculationsUrl

            etagConfig = 
                query: 
                    method: 'GET'
                    isArray: no
                delete:
                    method: 'DELETE'
                    headers: { 'If-Match': etag }

            console.log 'asd'

            return $resource("#{url}/:id", { id: '@_id'}, etagConfig)

        # no headers version of resource
        plain: () ->

            url = AppConfig.database.resources.calculationsUrl

            plainConfig = 
                query: 
                    method: 'GET'
                    isArray: no

            return $resource("#{url}/:id", { id: '@_id'}, plainConfig)

    return resource

# registration
angular.module 'app'
.factory 'CalculationResource', [
        '$resource'
        'AppConfig'

        CalculationResource
    ]
