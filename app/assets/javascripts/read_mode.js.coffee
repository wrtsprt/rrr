# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#

markItemAsRead = (id) ->
  $.post 'mark_item_as_read',
    article_id: id
    (data) -> $('body').append "Successfully posted to the page."

window.ready = ( ->
  document.onkeypress = (evt) ->
    evt = evt || window.event
    charCode = evt.keyCode || evt.which
    charStr = String.fromCharCode(charCode)
    if charStr == 'j'
      article_id += 1
      markItemAsRead(article_id)
    else if charStr == 'k'
      article_id -= 1
      markItemAsRead(article_id)
    window.location.hash = "article-#{article_id}"

  article_id = 0

)();



