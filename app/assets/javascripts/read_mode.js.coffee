# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  get_json = (url) ->
        $.getJSON "#{url}.json"

window.ready = ( ->
  document.onkeypress = (evt) ->
    evt = evt || window.event
    charCode = evt.keyCode || evt.which
    charStr = String.fromCharCode(charCode)
    if charStr == 'j'
      console.log 'j'
    else if charStr == 'k'
      console.log 'k'


)();



