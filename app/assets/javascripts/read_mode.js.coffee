handle_new_data = (data) ->
  update_stats()
  article = data[0]
  $('#current_article #title').html(article.title)
  $('#current_article #body').html(article.content)
  $('#current_article #meta #article_id').html(article.id)

next_article = ->
  $.post 'mark_item_as_read',
    article_id: $('#current_article #meta #article_id').html(),
    (data) ->
      get_new_article()

get_new_article = ->
  $.getJSON '/read_mode/get.json', handle_new_data

update_stats = ->
  $.getJSON '/read_mode/stats.json', (data) ->
    console.log 'got stats back'
    console.dir data
    console.log data.count
    $('#unread_count').html(data.count)

bind_navigation_keys = ->
  document.onkeypress = (evt) ->
    evt = evt || window.event
    charCode = evt.keyCode || evt.which
    charStr = String.fromCharCode(charCode)
    if charStr == 'j'
      console.log 'j'
      next_article()
    else if charStr == 'k'
      console.log 'k'

document_loaded = ->
  console.log 'document loaded'
  get_new_article()
  update_stats()
  bind_navigation_keys()

$(document).on 'page:load', document_loaded
$(document).ready(document_loaded)
