class @Reader

  constructor: ->
    console.log 'constructor called'
    @unread ||= new Array()
    @read ||= new Array()
    @currentArticle ||= {}

  addData: (data) ->
    console.log 'addData called'
    console.dir data
    @unread.unshift(data)

  nextArticle: =>
    console.log 'nextArticle called'
    if @unread.length > 0
      @read.push(@currentArticle)
      @currentArticle = @unread.pop()
    else
      console.log 'nothing left in unread'
    @update_stats()
    @fetchNewArticle()
    @updateUi()

  previousArticle: ->
    console.log 'previousArticle called'
    if @read.length > 0
      @unread.push(@read.pop())
    else
      console.log 'nothing left in read'

  verifyBuffer: =>
    console.log 'verifyBuffer called'

  unreadCount: =>
    @unread.length

  updateUi: =>
    article = @currentArticle
    $('#current_article #title').html(article.title)
    $('#current_article #body').html(article.content)
    $('#current_article #meta #article_id').html(article.id)
    $('#current_article #source a').attr('href',article.url)
    $('#debug-output #source').html(article)

    readArticles = ''
    for article in @read
      readArticles += '<li>' + article.title + ' </li>'

    $('#read').html('<ul>' + readArticles + '</ul>')
    $('#debug_read_count').html(@read.length)

    unreadArticles = ''
    for article in @unread
      unreadArticles += '<li>' + article.title + ' </li>'

    $('#unread').html('<ul>' + unreadArticles + '</ul>')
    $('#debug_unread_count').html(@unread.length)

  handle_new_data: (data) =>
    article = data[0]
    @addData(article)

  next_article: =>
    @nextArticle()
    $.post 'mark_item_as_read',
      article_id: $('#current_article #meta #article_id').html(),
      (data) =>
        @get_new_article()

  fetchNewArticle: =>
    $.getJSON '/read_mode/get.json', @handle_new_data

  update_stats: =>
    $('#buffered-count').html(@unreadCount())
    $.getJSON '/read_mode/stats.json', (data) ->
      console.log 'got stats back'
      console.dir data
      console.log data.count
      $('#unread_count').html(data.count)

  bind_navigation_keys: =>
    document.onkeypress = (evt) =>
      evt = evt || window.event
      charCode = evt.keyCode || evt.which
      charStr = String.fromCharCode(charCode)
      if charStr == 'j'
        console.log 'j'
        @next_article()
      else if charStr == 'k'
        console.log 'k'
        @previousArticle()

document_loaded = ->
  console.log 'document loaded'
  window.myReader = new Reader()
  window.myReader.fetchNewArticle()
  window.myReader.update_stats()
  window.myReader.bind_navigation_keys()
  window.myReader.nextArticle()

$(document).on 'page:load', document_loaded
$(document).ready(document_loaded)
