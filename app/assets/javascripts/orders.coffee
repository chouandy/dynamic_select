# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  filter_township = ->
    county = $('#order_county_id :selected').text()
    escaped_county = county.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
    options = $(township).filter("optgroup[label='#{escaped_county}']").html()
    if options
      $('#order_township_id').html(options)
      $('#order_township_id').parent().show()
    else
      $('#order_township_id').empty()
      $('#order_township_id').html('<option value=""></option>')
      $('#order_township_id').parent().hide()

  $('#order_township_id').parent().hide()
  township = $('#order_township_id').html()

  if $('#order_county_id').val() != ''
    filter_township()
  $('#order_county_id').change ->
    filter_township()


