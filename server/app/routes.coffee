baseUrl = '/api/v1'

module.exports = 

    # DB endpoints
    "#{baseUrl}/calculation": require './controllers/CalculationController'
    "#{baseUrl}/preset": require './controllers/PresetController'
    "#{baseUrl}/user": require './controllers/UserController'
    
    # BL endpoints
    "#{baseUrl}/admin/init": require './controllers/InitController'
