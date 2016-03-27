mongoose = require 'mongoose'

# Create model schema
PresetSchema = new mongoose.Schema(
        name:
            type: String
            required: true
    )

# Export the model schema
module.exports = PresetSchema
