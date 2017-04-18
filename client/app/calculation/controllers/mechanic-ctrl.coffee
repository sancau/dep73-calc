###
    Source: calculation/controllers/mechanic-ctrl.coffee
    Project: dep73-calc
    Description: Controller for mechanic tests inputs section
    Author: Alexander Tatchin | github.com/sancau
###

# controller function
MechanicCtrl = (LogicService, Current) ->

    vm = this

    # Form block type options
    vm.options =
    [
        {
            id: 1
            name: 'Резонансные исследования (снятие АЧХ)'
        }
        {
            id: 2
            name: 'Вибро-прочность'
        }
        {
            id: 3
            name: 'Вибро-устойчивость'
        }
        {
            id: 4
            name: 'Ударная прочность - однократные удары'
        }
        {
            id: 5
            name: 'Ударная прочность - многократные удары'
        }
        {
            id: 6
            name: 'Ударная устойчивость - однократные удары'
        }
        {
            id: 7
            name: 'Ударная устойчивость - многократные удары'
        }
        {
            id: 8
            name: 'Транспортная тряска'
        }
        {
            id: 9
            name: 'Технологическая вибрация'
        }
    ]

    # Forms views urls depending on block type
    formsUrls = []

    for i in vm.options
        formsUrls.push {
            typeID: i.id
            formView: 'calculation/views/mechanic-partial/time-only-form.jade'
        }


    # Populates blocks array based on calculation data
    getBlocks = (mechanicData) ->
        blocks = []
        # if there's no mechanic data -> populate 1 empty block
        if mechanicData.blocks.length is 0
            blocks = [{data: ''}]
        else
            # parse object and populate blocks
            for item in mechanicData.blocks
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
        if window.confirm('Вы действительно хотите удалить блок?')
            # If form structure changed after submit attempt the state resets
            vm.submitted = off

            # Delete field group by index
            index = vm.blocks.indexOf block
            vm.blocks.splice index, 1

            # If 0 blocks remains after deletion
            # then a new blank block should be populated after deletion
            vm.blocks.push {data: ''} if vm.blocks.length is 0

    # Logic on mechanic data submission
    vm.saveChanges = () ->

        # flag signals that form was submitted by the user
        vm.submitted = on

        # check each block of form to be valid
        dataValid = yes
        for block in vm.blocks
            if not block.mechanicForm.$valid
                dataValid = no

        # depending on the validation status perform proper logic
        if dataValid
            data = []
            for block in vm.blocks
                if block.data isnt ''
                    data.push JSON.parse JSON.stringify(block.data)

            Current.calculation.mechanic.blocks = data

            Current.calculation = LogicService.evaluate(Current.calculation)

            Current.calculation.save()
                .then(
                        (data) ->
                            console.log 'Update successfull'
                            window.alert('Изменения сохранены')
                        (error) ->
                            console.log error
                            window.alert('Изменения НЕ сохранены (ошибка)')
                    )
        else
            console.log "Invalid Form"

    # Initial array of field groups contains 1 blank block
    vm.blocks = getBlocks Current.calculation.mechanic

    return vm

# controller registration
angular.module 'app.calculation'
    .controller 'MechanicCtrl', [
        'LogicService'
        'Current'

        MechanicCtrl
    ]
