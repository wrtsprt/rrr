class @Reader

  constructor: ->
    console.log 'constructor called'
    @unread ||= new Array()
    @read ||= new Array()
    @currentArticle ||= {}
    @loadedArticleIds = {}

  initializeReader: =>
    @fetchNewArticle()
    @bind_command_keys()
    @nextArticle()


  nextArticle: =>
    @fetchNewArticle()
    @update_stats()
    @updateUi()

  previousArticle: ->
    console.log 'previousArticle called'
    if @read.length > 0
      @unread.push(@currentArticle)
      @currentArticle = @read.pop()
    else
      console.log 'nothing left in read'
    @updateUi()

  verifyBuffer: =>
    console.log 'verifyBuffer called'

  unreadCount: =>
    @unread.length

  updateUi: =>
    console.log 'update UI'
    unless @currentArticle
      @currentArticle = @unread.pop()
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
    for article in data
      console.log 'adding article to unread ' + article.title

      if @loadedArticleIds[article.id] == 1
        console.log 'article already loaded'
      else
        @unread.unshift(article)
        @loadedArticleIds[article.id] = 1
    @updateUi()

  nextPressed: =>
    console.log ' pressed next '
    $.post 'read_mode/mark_item_as_read',
      article_id: @currentArticle.id

    if @unread.length > 0
      console.log ' current article pushed to read: ' + @currentArticle.title
      @read.push(@currentArticle)
      @currentArticle = @unread.pop()
      console.log ' new current article: '  + @currentArticle.title
    else
      console.log 'nothing left in unread'

    @updateUi()
    @fetchNewArticle()

  fetchNewArticle: =>
    $.getJSON '/read_mode/get.json?number=5', @handle_new_data

  update_stats: =>
    $('#buffered-count').html(@unreadCount())
    $.getJSON '/read_mode/stats.json', (data) ->
      console.log 'got stats?!'
      $('#unread_count').html(data.count)

  openArticleInNewTab: =>
    console.log 'open article in new tab'
    win = window.open(@currentArticle.url).blur();

  bind_command_keys: =>
    document.onkeypress = (evt) =>
      evt = evt || window.event
      charCode = evt.keyCode || evt.which
      charStr = String.fromCharCode(charCode)
      if charStr == 'j'
        console.log 'j'
        @nextPressed()
      else if charStr == 'k'
        console.log 'k'
        @previousArticle()
      else if charStr == 'v'
        console.log 'v'
        @openArticleInNewTab()

document_loaded = ->
  console.log 'document loaded'
  myReader = new Reader()
  myReader.initializeReader()

$(document).on 'page:load', document_loaded
$(document).ready(document_loaded)
