handle_new_data = (data) ->
  article = data[0]
  $('#current_article #title').html(article.title)
  $('#current_article #body').html(article.content)
  $('#current_article #meta #article_id').html(article.id)

next_article = ->
  $.post 'mark_item_as_read',
    article_id: $('#current_article #meta #article_id').html()
    (data) ->
      $('body').append "Successfully posted to the page."
      get_new_article()

get_new_article = ->
  $.getJSON '/read_mode/get.json', handle_new_data

$ ->
  console.log 'doc ready'
  get_new_article()

window.ready = ( ->
  document.onkeypress = (evt) ->
    evt = evt || window.event
    charCode = evt.keyCode || evt.which
    charStr = String.fromCharCode(charCode)
    if charStr == 'j'
      console.log 'j'
      next_article()
    else if charStr == 'k'
      console.log 'k'
)();
