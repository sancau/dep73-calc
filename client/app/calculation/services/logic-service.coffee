
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

        evalBlock = (block, preset) ->

            if block.type.name in ['Повышенная температура', 'Пониженная температура']
                
                labor = 0
                start = end = preset.normalConditions.temp
                
                temp1 = block.values.workTemp
                time1 = block.values.workTime
                
                temp2 = block.values.workTemp2
                time2 = block.values.workTime2
                
                temp3 = block.values.edgeTemp
                time3 = block.values.edgeTime
                
                current = start
                calcPhase = (current, temp, time, preset, ignoreZero=false) ->
                    if time is 0 and not ignoreZero then return 0
                    result = 0
                    if temp >= current
                        result += (temp - current) / preset.upSpeed 
                    else 
                        result += (current - temp) / preset.downSpeed
                    result += time * 60

                    return result

                # PHASE 1
                labor += calcPhase(current, temp1, time1, preset)                
                console.log 'labor after phase 1: ' + labor
                current = temp1
                
                # PHASE 2
                labor += calcPhase(current, temp2, time2, preset)                
                console.log 'labor after phase 2: ' + labor
                if time2 isnt 0
                    current = temp2

                # PHASE 3
                labor += calcPhase(current, temp3, time3, preset)
                console.log 'labor after phase 3: ' + labor
                if time3 isnt 0
                    current = temp3

                # PHASE 4
                labor += calcPhase(current, end, 0, preset, true)
                console.log 'labor after phase 4: ' + labor

                return +((labor / 60).toFixed 2)               

            if block.type.name in ['Повышенная влажность', 'Пониженная влажность']

                return block.values.humTime + preset.humExtra

            if block.type.name is 'Технологическая операция'

                return block.values.operationTime

            if block.type.name is 'Изменение температуры'
                # NOT IMPLEMENTED
                return 0

            else 
                console.log 'else'
                console.log block.values
                return block.values.phaseTime

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
            console.log block.totalLabor
            totalClimatic += block.totalLabor
        
        results = 
            hours: totalClimatic
            pdays: (totalClimatic * 2 / 8).toFixed 1

        calculation.climatic.results = results

        totalMechanic = 0
        for block in calculation.mechanic.blocks

            block.totalLabor = Math.round evalBlock block, preset
            console.log block.totalLabor
            totalMechanic += block.totalLabor
        
        results = 
            hours: totalMechanic
            pdays: (totalMechanic * 2 / 8).toFixed 1

        calculation.mechanic.results = results

        return calculation

    return logicService 


angular.module 'app.calculation'
    .factory 'LogicService', [

        LogicService
    ]
