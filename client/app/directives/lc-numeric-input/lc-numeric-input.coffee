###
    Source: directives/lc-numeric-input/lc-numeric-input.coffee 
    Project: dep73-calc
    Description: Custom directive for numeric input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

# directive function
lcNumericInput = () ->
    replace: on
    restrict: 'E'
    scope: 
        label: '@'
        inputId: '@'
        required: '='
        inputObject: '='
        model: '='
        submitted: '='
        value: '@'
        min: '@'
        max: '@'
        step: '@'
    templateUrl: 'directives/lc-numeric-input/lc-numeric-input-view.jade'
    link: (scope) ->


# directive registration
angular.module 'lc.directives'
    .directive 'lcNumericInput', lcNumericInput 