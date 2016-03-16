###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ClimaticCtrl = (ActiveCalculation) ->

    vm = this

    # DEBUG
    console.log "ClimaticCtrl loaded"

    # form block type options
    vm.options = 
    [
        {   
            id: 1 
            name: 'Повышенная температура' 
        }
        { 
            id: 2 
            name: 'Пониженная температура' 
        }
        { 
            id: 3 
            name: 'Пониженная влажность' 
        }
        { 
            id: 4 
            name: 'Повышенная влажность' 
        }
        { 
            id: 5 
            name: 'Технологическая операция' 
        }
    ]

    # forms views urls depending on block type
    formsUrls = 
    [
        {   
            typeID: 1 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.jade'
        }
        { 
            typeID: 2 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.jade'
        }
        { 
            typeID: 3 
            formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.jade'
        }
        { 
            typeID: 4 
            formView: 'calculation/views/climatic-partial/sub-partials/humidity-form.jade' 
        }
        { 
            typeID: 5  
            formView: 'calculation/views/climatic-partial/sub-partials/operation-form.jade' 
        }        
    ]

    # Function to parse ActiveCalculation object and populate blocks array
    getBlocks = (data) ->
        blocks = []        
        # if there's no climatic data -> populate 1 empty block
        if data.climatic.blocks.length is 0
            blocks = [{data: ''}]
        else
            # parse object and populate blocks
            for dataItem in data.climatic.blocks
                thisBlock = 
                    data: dataItem

                blocks.push thisBlock

        return blocks 

    # Initial array of field groups contains 1 blank block
    vm.blocks = getBlocks ActiveCalculation.data

    # Returns a verbose name for a block to display
    vm.getName = (index) ->
        # ISSUE | NOT CRITICAL Why it invoked so many times??? 
        # DEBUG  
        # console.log 'getName() invoked'

        "Блок #{index}"

    # returns the form view url for a block type
    vm.getFormUrl = (typeID, block) ->
        
        # ISSUE | NOT CRITICAL Why it invoked so many times??? 
        # DEBUG 
        # console.log 'getFormUrl() invoked'

        return (i.formView for i in formsUrls when i.typeID is typeID)[0]

    # Add block logic
    vm.clone = () ->

        # if no data entered in existing block user cant add another 
        hasEmptyBlock = no
        for block in vm.blocks
            if not block.data.type
                hasEmptyBlock = yes
        if hasEmptyBlock then return console.log "there's an empty block to use | ClimaticCtrl clone()"

        # If form structure changed after submit attempt the state resets
        vm.submitted = off
        vm.blocks.push {data: ''}

    # Delete block logic
    vm.delete = (block) ->
        # If form structure changed after submit attempt the state resets
        vm.submitted = off

        # Delete field group by index
        index = vm.blocks.indexOf block
        vm.blocks.splice index, 1

        # If 0 blocks remains after deletion 
        # then a new blank block should be populated after deletion
        vm.blocks.push {data: ''} if vm.blocks.length is 0

    # Logic on climatic data submission
    vm.saveChangesButtonContent = 'Сохранить' 
    vm.saveChanges = () ->

        # flag signals that form was submitted by the user
        vm.submitted = on

        # check each block of form to be valid 
        dataValid = yes
        for block in vm.blocks 
            if not block.climaticForm.$valid
                dataValid = no

        # depending on the validation status perform proper logic
        if dataValid
            # TODO save changes logic
            # DEBUG
            console.log "Save changes logic to go | ClimaticCtrl.saveChanges()"
            console.log "DATA TO SAVE:" 

            data = []
            for block in vm.blocks

                data.push block.data  

            # data to POST 
            # DEBUG 
            console.log data

            # Update climatic data section of the ActiveCalculation
            # PUT ActiveCalculation object to server

        else
            # TODO handle the validation error
            console.log "Form is invalid | ClimaticCtrl.saveChanges()"

    return vm   

# controller registration
angular.module 'app.calculation'
    .controller 'ClimaticCtrl', [
        'ActiveCalculation'

        ClimaticCtrl
    ]