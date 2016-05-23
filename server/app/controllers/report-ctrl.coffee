
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
    if req.method isnt 'POST'
      res.json { 
        success: false
        message: "Accepts POST requests only, #{req.method} received." 
      } 
    else        
      report = req.body.report
      # build template data object
      templateData = {
        'report.name': report.name
        'report.document': report.document
        'report.type': report.type
        'totalTable.total': report.totalTable.total
        'totalTable.rows': report.totalTable.rows
        'detailTable.total': report.detailTable.total
        'detailTable.rows': report.detailTable.rows
      }

      console.log templateData

      # use docx templater to create a MS Word document
      content = fs.readFileSync(__dirname + '/template.docx', 'binary')
      doc = new Docxtemplater(content)
      doc.setData(templateData)
      doc.render()

      date = new Date().toISOString().slice(0,10).replace(/-/g,"")
      fileName = "/#{report.name}_#{date}.docx"

      buf = doc.getZip().generate { type: 'nodebuffer'}
      fs.writeFileSync(__dirname + '/reports' + fileName, buf)
      
      res.json { success: true }