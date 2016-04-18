###
    Source: app/models/calculation.coffee 
    Project: dep73-calc
    Description: Calculation db model
    Author: Alexander Tatchin | github.com/sancau
###

mongoose = require 'mongoose'

CalculationSchema = new mongoose.Schema(
        meta:
            type: {}
            required: true
        climatic:
            type: {}
            required: true
        general: 
            type: {}
            required: true
        mechanic: 
            type: {}
            required: true
        additional: 
            type: {} 
            required: true
    )

module.exports = CalculationSchema

