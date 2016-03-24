###
    Source: api/calculation-service.coffee 
    Project: dep73-calc
    Description: Service to provide DAL methods for calculations 
    Author: Alexander Tatchin | github.com/sancau
###

CalculationService = ($resource, AppConfig, CalculationResource) ->

    # we use this if we need to provide etag to the server
    # don't need to make instances so just a function here
    getEtagResource = (etag) ->

        url = AppConfig.database.resources.calculationsUrl
    
        etagConfig = 
            query: 
                method: 'GET'
                isArray: yes
            delete:
                method: 'DELETE'
                headers: { 'If-Match': etag }
            update:
                method: 'PUT'
                headers: { 'If-Match': etag }

        return $resource("#{url}/:id", { id: '@_id'}, etagConfig)

    # service definition
    service = {}

    service.getAll = () -> 
        CalculationResource.query().$promise

    service.getOne = (id) -> 
        CalculationResource.get({ id: id }).$promise

    service.create = (data) -> 

        entity = new CalculationResource
        console.log entity

        for prop, value of data
            entity[prop] = value

        return entity.$save()

    # using etag resource version
    service.update = (entity) ->
        getEtagResource(entity._etag).get({ id: entity._id })
            .$promise.then(
                (dbEntity) ->

                    # adds changes to the instance
                    for i in ['general', 'climatic', 'meta']
                        for prop, value of entity[i]
                            dbEntity[i][prop] = value
                            
                    # ISSUE | NOT CRITICAL
                    # should remove meta fields from entity to pass server validation
                    # eve framework pitfall? 
                    for i in ['_created', '_etag', '_links', '_updated']
                        delete dbEntity[i]

                    console.log dbEntity

                    # return update promise
                    return dbEntity.$update()

                (error) ->
                    console.log error
            )

    # using etag resource version
    service.delete = (entity) ->
        getEtagResource(entity._etag).get({ id: entity._id })
            .$promise.then(
                (entity) ->
                    return entity.$delete()                        
                (error) ->
                    console.log error
            )    

    return service

# service registration
angular.module 'app'
.factory 'CalculationService',
    [
        '$resource'
        'AppConfig'
        'CalculationResource'

        CalculationService
    ]