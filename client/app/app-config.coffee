###
    Source: app-config.coffee 
    Project: dep73-calc
    Description: An AngularJS constant that contains application 
        configuration data such as baseUrl, database setup, etc
    Author: Alexander Tatchin | github.com/sancau
###

appConfig = 

    # Database related configuration settings
    database:
        dbName: ''
        baseUrl: ''

        resources: 
            calculationsUrl: '../test/fake-api/calculations/calculations.json'
            presetsUrl: '../test/fake-api/presets/presets.json'

angular.module 'app'
.constant 'AppConfig', appConfig