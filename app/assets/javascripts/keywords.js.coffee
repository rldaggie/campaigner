# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  theTable = $('#table-keywords').dataTable({
    "sDom": "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap",
    "iDisplayLength": 200,
    "oLanguage": {
      "sLengthMenu": "_MENU_ records per page"
    }
  })
  
  $('.delete-keyword').bind 'ajax:complete', ->
    theRow = $(this).closest('tr')[0]
    theTable.fnDeleteRow(theTable.fnGetPosition(theRow))