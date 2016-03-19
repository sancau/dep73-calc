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
            isArray: no
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


#############################################################

# version to pass ETAG
# definition
CalculationResourceEtag = ($resource, AppConfig) ->

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
                update:
                    method: 'PUT'
                    headers: { 'If-Match': etag }

            return $resource("#{url}/:id", { id: '@_id'}, etagConfig)

    return resource

# registration
angular.module 'app'
.factory 'CalculationResourceEtag', [
        '$resource'
        'AppConfig'

        CalculationResourceEtag
    ]
