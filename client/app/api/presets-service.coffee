###
    Source: api/presets-service.coffee 
    Project: dep73-calc
    Description: Service to provide DAL methods for presets
    Author: Alexander Tatchin | github.com/sancau
###

PresetsService = ($resource, AppConfig, PresetsResource) ->

    # we use this if we need to provide etag to the server
    # don't need to make instances so just a function here
    getEtagResource = (etag) ->

        url = AppConfig.database.resources.presetsUrl
    
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

    # service definition
    service = {}

    service.getAll = () -> 
        PresetsResource.query().$promise

    service.getOne = (id) -> 
        PresetsResource.get({ id: id }).$promise

    service.create = (data) -> 

        entity = new PresetsResource
        console.log entity

        for prop, value of data
            entity[prop] = value

        return entity.$save()

    # using etag resource version
    service.update = (entity) ->
        getEtagResource(entity._etag).get({ id: entity._id })
            .$promise.then(
                (dbEntity) ->
                           
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
.factory 'PresetsService',
    [
        '$resource'
        'AppConfig'
        'PresetsResource'

        PresetsService
    ]