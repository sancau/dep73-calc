###
  Source: calculation/services/active-calculation.coffee 
  Project: dep73-calc
  Description: A singleton object to store current culculation data
         This data is to be shared between Ctrls of app.calculation                  
  Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation'
  .factory 'Current', () ->
    getReport: (calculation) ->
      report:
        name: calculation.general.name
        document: calculation.general.document
        type: calculation.general.type.label.toLowerCase()

        totalTable: do () ->
          table = {}
          table.rows = [] 

          if calculation.climatic.blocks.length > 0
            table.rows.push {
              type: 'Климатические'
              labor: do () ->
                num = parseFloat(calculation.climatic.results.pdays) / 20 # pm
                rounded = Math.round( num * 10) / 10
                if rounded is 0 then rounded = 0.1
                return rounded
            }
          if calculation.mechanic.blocks.length > 0
            table.rows.push {
              type: 'Механические'
              labor: do () ->
                num = parseFloat(calculation.mechanic.results.pdays) / 20 # pm
                rounded = Math.round( num * 10) / 10
                if rounded is 0 then rounded = 0.1
                return rounded
            }
          table.rows.push 
            type: 'Подготовительно-заключительные работы'
            labor: do () ->
              num = calculation.additional.preparationLabor / 20 #pm
              rounded = Math.round( num * 10) / 10
              if rounded is 0 then rounded = 0.1
              return rounded

          table.total = 0
          for row in table.rows
            table.rows[table.rows.indexOf(row)].index = table.rows.indexOf(row) + 1
            table.total += row.labor
          table.total = Math.round( table.total * 10) / 10

          return table

        detailTable: do () ->
          table = {}
          table.rows = []

          # climatic details
          for block in calculation.climatic.blocks
            table.rows.push {
              type: block.type.name
              documentItem: block.values.documentItem
              comment: do () -> 
                unless block.values.phaseComment? 
                  return ''
                return block.values.phaseComment
              labor: Math.round(block.totalLabor * 2 / 8)
            }

          # mech details
          for block in calculation.mechanic.blocks
            table.rows.push {
              type: block.type.name
              documentItem: block.values.documentItem
              comment: do () -> 
                unless block.values.phaseComment? 
                  return ''
                return block.values.phaseComment
              labor: Math.round(block.totalLabor * 2 / 8)
            }

          table.rows.push {
            type: 'Подготовительно-заключительные работы'
            documentItem: ''
            comment: ''
            labor: calculation.additional.preparationLabor
          }

          table.total = 0
          for row in table.rows
            table.rows[table.rows.indexOf(row)].index = table.rows.indexOf(row) + 1
            table.total += row.labor

          return table

    calculation: {}



