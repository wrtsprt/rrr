# markItemAsRead = (id) ->
#   $.post 'mark_item_as_read',
#     article_id: id
#     (data) -> $('body').append "Successfully posted to the page."

handle_new_data = (data) ->
  console.log 'handle new datat'
  console.dir data
  article = data[0]
  $('#current_article #title').html(article.title)
  $('#current_article #body').html(article.content)

$ ->
  console.log 'doc ready'
  $.getJSON '/read_mode/get.json', handle_new_data

# window.ready = ( ->
#   document.onkeypress = (evt) ->
#     evt = evt || window.event
#     charCode = evt.keyCode || evt.which
#     charStr = String.fromCharCode(charCode)
#     if charStr == 'j'
#       article_id += 1
#       markItemAsRead(article_id)
#     else if charStr == 'k'
#       article_id -= 1
#       markItemAsRead(article_id)
#     window.location.hash = "article-#{article_id}"
#
#   article_id = 0
#
# )();



