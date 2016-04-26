###
    Source: calculation/controllers/climatic-ctrl.coffee 
    Project: dep73-calc
    Description: Controller for climatic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
ClimaticCtrl = (LogicService, Current) ->

    vm = this

    # Form block type options
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
        {
            id: 6
            name: 'Повышенное давление'
        }
        {
            id: 7
            name: 'Пониженное давление'
        }
        {
            id: 8
            name: 'Термовакуумные испытания'
        }
        {
            id: 9
            name: 'Испытания на воздействие инея и росы'
        }
        {
            id: 10
            name: 'Дополнительная температурная погрешность'
        }
        {
            id: 11
            name: 'Испытания на воздействие солнечной радиации'
        }
        {
            id: 12
            name: 'Испытания на воздействие пыли'
        }
        {
            id: 13
            name: 'Изменение температуры'
        }
    ]

    # Forms views urls depending on block type
    formsUrls = 
    [
        {   
            typeID: 1 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form.jade'
        }
        { 
            typeID: 2 
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-form-minus.jade'
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
        {
            typeID: 13
            formView: 'calculation/views/climatic-partial/sub-partials/temperature-change-form.jade' 
        }        
    ]

    for i in [6,7,8,9,10,11,12]
        formsUrls.push {
            typeID: i
            formView: 'calculation/views/climatic-partial/sub-partials/time-only-form.jade' 
        }


    # Populates blocks array based on calculation data
    getBlocks = (climaticData) ->
        blocks = []        
        # if there's no climatic data -> populate 1 empty block
        if climaticData.blocks.length is 0
            blocks = [{data: ''}]
        else
            # parse object and populate blocks
            for item in climaticData.blocks
                thisBlock = 
                    # clone the object to prevent unexprected bindings
                    data: JSON.parse JSON.stringify(item)

                blocks.push thisBlock

        return blocks 

    # Returns a verbose name for a block to display
    vm.getName = (index) ->
        "Этап #{index}"

    # Returns form view url for a block type
    vm.getFormUrl = (typeID) ->
        (i.formView for i in formsUrls when i.typeID is typeID)[0]

    # Resets block data object on type change
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
        if hasEmptyBlock 
            return console.log "there's an empty block to use | ClimaticCtrl clone()"

        # If form structure changed after submit attempt so the state resets
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

            Current.calculation.climatic.blocks = data

            Current.calculation = LogicService.evaluate(Current.calculation)

            Current.calculation.save()
                .then(
                        (data) ->   
                            console.log 'Update successfull'
                        (error) ->
                            console.log error
                    )
        else
            console.log "Invalid Form"

    # Initial array of field groups contains 1 blank block
    vm.blocks = getBlocks Current.calculation.climatic

    return vm   

# controller registration
angular.module 'app.calculation'
    .controller 'ClimaticCtrl', [
        'LogicService'
        'Current'

        ClimaticCtrl
    ]