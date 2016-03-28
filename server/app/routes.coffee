###
    Source: app/routes.coffee 
    Project: dep73-calc
    Description: Routing configuration 
    Author: Alexander Tatchin | github.com/sancau
###

baseUrl = '/api/v1'
controllers = require './controllers'

module.exports = 

    # DB endpoints
    "#{baseUrl}/calculation": controllers.calculationCtrl
    "#{baseUrl}/preset": controllers.presetCtrl
    "#{baseUrl}/user": controllers.userCtrl
    
    # BL endpoints
    # "#{baseUrl}/login" : controllers.loginCtrl
    "#{baseUrl}/admin/init": controllers.initCtrl

