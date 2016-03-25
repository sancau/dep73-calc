
###
    Source: calculation/services/logic.coffee 
    Project: dep73-calc
    Description: Holds the domain specific logic of app.calculation
    Author: Alexander Tatchin | github.com/sancau
###

LogicService = () ->

    logicService = {}

    # Performs calculation evaluation
    logicService.evaluate = (calculation) -> 

        evalClimaticBlock = (block, preset) ->

            if block.type.name in ['Повышенная температура', 'Пониженная темепратура']
                
                labor = 0
                workTemp = block.values.workTemp
                edgeTemp = block.values.edgeTemp
                
                if workTemp > preset.normalConditions.temp
                    labor += (workTemp - preset.normalConditions.temp) / preset.upSpeed 
                else 
                    labor += (preset.normalConditions.temp - workTemp) / preset.downSpeed

                if block.values.edgeTime isnt 0

                    if edgeTemp > workTemp
                        labor += (edgeTemp - workTemp) / preset.upSpeed
                    else
                        labor += (workTemp - edgeTemp) / preset.downSpeed

                return +((labor / 60 + block.values.workTime + block.values.edgeTime).toFixed 2)

            if block.type.name in ['Повышенная влажность', 'Пониженная влажность']

                return block.values.humTime + preset.humExtra

            if block.type.name is 'Технологическая операция'

                return block.values.operationTime

        # Hardcoded default preset for now. Presets UI / API to be implemented
        preset = 
            upSpeed: 1
            downSpeed: 1
            humExtra: 2
            normalConditions:
                temp: 20
                hum: 50

        totalClimatic = 0
        for block in calculation.climatic.blocks

            block.totalLabor = Math.round evalClimaticBlock block, preset

            totalClimatic += block.totalLabor
        
        results = 
            hours: totalClimatic
            pdays: (totalClimatic * 2 / 8).toFixed 1

        calculation.climatic.results = results

        return calculation

    return logicService 


angular.module 'app.calculation'
    .factory 'LogicService', [

        LogicService
    ]
