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
        dbName: 'dep73-calc'
        baseApiUrl: 'http://127.0.0.1:8000/api/v1'

        resources: 
            calculationsUrl: 'http://127.0.0.1:8000/api/v1/calculation' 
            
            #DEBUG
            presetsUrl: '../test/fake-api/presets/presets.json'
            #DEBUG '../test/fake-api/calculations/calculations.json'

angular.module 'app'
.constant 'AppConfig', appConfig