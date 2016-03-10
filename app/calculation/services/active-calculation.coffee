###
    Source: calculation/active-calculation.coffee 
    Project: dep73-calc
    Description: A singleton object to store current culculation data
                 This data can be shared by all the app.calculation controllers
                 The data object is implied to be feeded with the server data by 
                 the calculation service (API)
    Author: Alexander Tatchin | github.com/sancau
###

angular.module 'app.calculation'

.factory 'ActiveCalculation', () ->
	
	data: ''

	typeOptions: [
        { 
            label: 'Квалификационные'
            value: '1'
        }
        { 
            label: 'Конструкторско-доводческие'
            value: '2'
        }
        { 
            label: 'Периодические'
            value: '3'
        }
        { 
            label: 'Приёмо-сдаточные'
            value: '4'
        }
        { 
            label: 'Предварительные'
            value: '5'
        }
        { 
            label: 'Типовые'
            value: '6'
        }
        { 
            label: 'Иное'
            value: '7'
        }
    ]


