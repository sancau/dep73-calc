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
    )

module.exports = CalculationSchema

