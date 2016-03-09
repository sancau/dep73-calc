###
    Source: calculation/active-calculation.coffee 
    Project: dep73-calc
    Description: A singleton object to store current culculation data
                 This data can be shared by all the app.calculation controllers
                 The data object is implied to be feeded with the server data by 
                 the calculation service (API)
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation'

.factory 'ActiveCalculation', () ->
    name: "ActiveCalculation"
    purpose: "DataSharing"


