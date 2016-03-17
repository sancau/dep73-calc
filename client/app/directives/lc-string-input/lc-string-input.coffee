###
    Source: directives/lc-string-input/lc-string-input.coffee 
    Project: dep73-calc
    Description: Custom directive for string input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

# directive function
lcStringInput = () ->
    replace: on
    restrict: 'E'
    scope: 
        label: '@'
        inputId: '@'
        model: '='
        required: '='
        inputObject: '='
        submitted: '='
    templateUrl: 'directives/lc-string-input/lc-string-input-view.jade'
    link: (scope) ->    

# directive registration
angular.module 'lc.directives'
    .directive 'lcStringInput', lcStringInput
