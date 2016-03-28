test = (req, res, next) ->
    console.log 'works'
    do next

another = (req, res, next) ->
    console.log 'another'
    do next

module.exports = 
    test: test
    another: another