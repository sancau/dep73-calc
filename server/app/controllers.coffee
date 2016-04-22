###
    Source: app/controllers.coffee 
    Project: dep73-calc
    Description: Controllers bootstrap script
    Author: Alexander Tatchin | github.com/sancau
###

module.exports = 
    calculationCtrl: require './controllers/calculation-ctrl'
    presetCtrl: require './controllers/preset-ctrl'
    userCtrl: require './controllers/user-ctrl'
    initCtrl: require './controllers/init-ctrl'
    loginCtrl: require './controllers/login-ctrl'
    reportCtrl: require './controllers/report-ctrl'