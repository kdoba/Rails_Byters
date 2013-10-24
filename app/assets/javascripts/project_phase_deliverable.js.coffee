# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#project_phase_deliverable_deliverable_type_id').change ->
    type = $('#project_phase_deliverable_deliverable_type_id :selected').val()
    uom = $("#project_phase_deliverable_uom_id")
    uom.val(types[type])
