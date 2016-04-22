
###
    Source: app/controllers/report-ctrl.coffee 
    Project: dep73-calc
    Description: 
            Handles docx templating to create a calculation report
            Using docxtemplater module from npm
    Author: Alexander Tatchin | github.com/sancau
###

fs = require 'fs' 
Docxtemplater = require 'docxtemplater'

module.exports = (app, route) ->
  (req, res) -> 
    content = fs.readFileSync(__dirname + '/template.docx', 'binary')

    doc = new Docxtemplater(content)

    doc.setData(
    	'name': 'WORKS!'
    )

    doc.render()

    buf = doc.getZip().generate { type: 'nodebuffer'}

    fs.writeFileSync(__dirname + "/output.docx", buf)

    res.json { success: true }