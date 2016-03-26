###
    Source: calculation/services/active-calculation.coffee 
    Project: dep73-calc
    Description: A singleton object to store current culculation data
                 This data is to be shared between Ctrls of app.calculation                  
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation'
    .factory 'Current', () ->       
        calculation: {}



