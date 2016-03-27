mongoose = require 'mongoose'

# Create model schema
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

# Export the model schema
module.exports = CalculationSchema

