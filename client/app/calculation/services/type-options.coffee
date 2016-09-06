
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
            forReport: 'Квалификационных'
            value: '1'
        }
        {
            label: 'Конструкторско-доводческие'
            forReport: 'Конструкторско-доводческих'
            value: '2'
        }
        {
            label: 'Периодические'
            forReport: 'Периодических'
            value: '3'
        }
        {
            label: 'Приёмо-сдаточные'
            forReport: 'Приёмо-сдаточных'
            value: '4'
        }
        {
            label: 'Предварительные'
            forReport: 'Предварительных'
            value: '5'
        }
        {
            label: 'Типовые'
            forReport: 'Типовых'
            value: '6'
        }
        {
            label: 'Иное'
            forReport: ''
            value: '7'
        }
    ]

angular.module 'app.calculation'
    .constant 'TypeOptions', typeOptions
