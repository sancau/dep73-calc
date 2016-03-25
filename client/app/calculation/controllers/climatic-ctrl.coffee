###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ClimaticCtrl = (ActiveCalculation, LogicService) ->

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
                    # clone the object to prevent unexprected bindings
                    data: JSON.parse JSON.stringify(dataItem)

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

    # resets block data object on type change
    vm.blockTypeChanged = (block) ->
        block.data.values = {}
        return

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
            data = []
            for block in vm.blocks              
                if block.data isnt ''
                    data.push JSON.parse JSON.stringify(block.data)  

            ActiveCalculation.data.climatic.blocks = data

            entity = LogicService.evaluate(ActiveCalculation.data)
            console.log 'TO UPDATE' 
            console.log entity

            CalculationService.update(entity)
                .then(
                        (updatedEntity) ->
                            # update ActiveCalculation with new META
                            for prop, value of updatedEntity
                                ActiveCalculation.data[prop] = value

                            vm.blocks = getBlocks ActiveCalculation.data

                        (error) ->
                            console.log error
                    )

        else
            console.log "Invalid Form"

    return vm   

# controller registration
angular.module 'app.calculation'
    .controller 'ClimaticCtrl', [
        'ActiveCalculation'
        'LogicService'

        ClimaticCtrl
    ]