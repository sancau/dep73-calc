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
        type: calculation.general.type.label

        totalTable: do () ->
          table = {}
          table.rows = [] 

          if calculation.climatic.blocks.length > 0
            table.rows.push {
              type: 'Климатические'
              labor: parseFloat(calculation.climatic.results.pdays) # pdays
            }
          if calculation.mechanic.blocks.length > 0
            table.rows.push {
              type: 'Механические'
              labor: parseFloat(calculation.mechanic.results.pdays) #pdays
            }
          table.rows.push 
            type: 'Подготовительно-заключительные работы'
            labor: calculation.additional.preparationLabor #pdays

          table.total = 0
          for row in table.rows
            table.total += row.labor
            
          return table

        detailTable: do () ->
          table = {}
          table.rows = []

          # climatic details
          for block in calculation.climatic.blocks
            table.rows.push {
              type: block.type.name
              documentItem: block.values.documentItem
              labor: block.totalLabor
            }

          # mech details
          for block in calculation.mechanic.blocks
            table.rows.push {
              type: block.type.name
              documentItem: block.values.documentItem
              labor: block.totalLabor
            }

          table.rows.push {
            type: 'Подготовительно-заключительные работы'
            documentItem: ''
            labor: calculation.additional.preparationLabor
          }

          table.total = 0
          for row in table.rows
            table.total += row.labor

          return table

    calculation: {}



