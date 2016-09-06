###
    Source: app/models/preset.coffee 
    Project: dep73-calc
    Description: Preset db model
    Author: Alexander Tatchin | github.com/sancau
###

mongoose = require 'mongoose'

PresetSchema = new mongoose.Schema(
        name:
            type: String
            required: true
    )

module.exports = PresetSchema
