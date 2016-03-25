
###
    Source: calculation/services/type-options.coffee 
    Project: dep73-calc
    Description: Test type options to be shared in some of the app.calculation ctrls
    Author: Alexander Tatchin | github.com/sancau
###

typeOptions = 
    options: [
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

angular.module 'app.calculation'
    .constant 'TypeOptions', typeOptions

