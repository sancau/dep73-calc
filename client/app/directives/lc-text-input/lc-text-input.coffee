###
    Source: directives/lc-text-input/lc-text-input.coffee 
    Project: dep73-calc
    Description: Custom directive for text input with build-in validation using Bootstrap
    Author: Alexander Tatchin | github.com/sancau
###

# directive function
lcTextInput = () ->
    replace: on
    restrict: 'E'
    scope: 
        label: '@'
        rows: '@'
        inputId: '@'
        required: '='
        inputObject: '='
        model: '='
        submitted: '='
    templateUrl: 'directives/lc-text-input/lc-text-input-view.jade'
    link: (scope) ->

# directive registration
angular.module 'app.directives'
    .directive 'lcTextInput', lcTextInput
