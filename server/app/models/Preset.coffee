mongoose = require 'mongoose'

PresetSchema = new mongoose.Schema(
        name:
            type: String
            required: true
    )

module.exports = PresetSchema
