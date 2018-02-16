class @Reader

  constructor: ->
    @unread ||= new Array()
    @read ||= new Array()
    @loadedArticleIds = {}

    @tag = $('#reader').data('tag') || ""

  initializeReader: =>
    @fetchNewArticle()
    @bind_command_keys()
    @nextArticle()


  nextArticle: =>
    @fetchNewArticle()
    @updateUi()
    @update_stats()

  previousArticle: ->
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
    unless @currentArticle
      @currentArticle = @unread.pop()
    article = @currentArticle
    return unless article
    $('#current_article #title').html(article.title)
    $('#current_article #subscription_name').html(article.subscription_name)
    $('#current_article #published_at').html(article.published_at)
    $('#current_article #body').html(article.content)
    $('#current_article #meta #article_id').html(article.id)
    $('#current_article #source a').attr('href',article.url)

  handle_new_data: (data) =>
    data = data.items
    for article in data
      if @loadedArticleIds[article.id] == 1
      else
        @unread.unshift(article)
        @loadedArticleIds[article.id] = 1
    @updateUi()
    @update_stats()

  nextPressed: =>
    if @currentArticle && @currentArticle.id
      $.post '/read_mode/mark_item_as_read',
        article_id: @currentArticle.id

    if @unread.length > 0
      @read.push(@currentArticle)
      @currentArticle = @unread.pop()
    else
      console.log 'nothing left in unread'

    @updateUi()
    @fetchNewArticle()

  fetchNewArticle: =>
    $.getJSON '/read_mode/get.json?number=5&tag=' + @tag || "", @handle_new_data

  update_stats: =>
    $('#buffered-count').html(@unreadCount())
    $.getJSON '/read_mode/stats.json', (data) ->
      $('#unread_count').html(data.count)
    $.getJSON '/read_mode/stats.json?tag=tech', (data) ->
      $('#tech-count').html('(' + data.count + ')')
    $.getJSON '/read_mode/stats.json?tag=lifehacker', (data) ->
      $('#lifehacker-count').html('(' + data.count + ')')
    $.getJSON '/read_mode/stats.json?tag=rest', (data) ->
      $('#rest-count').html('(' + data.count + ')')

  openArticleInNewTab: =>
    console.log 'open article in new tab'
    win = window.open(@currentArticle.url).blur();

  bind_command_keys: =>
    document.onkeypress = (evt) =>
      evt = evt || window.event
      charCode = evt.keyCode || evt.which
      charStr = String.fromCharCode(charCode)
      if charStr == 'j'
        @nextPressed()
      else if charStr == 'k'
        @previousArticle()
      else if charStr == 'v'
        @openArticleInNewTab()

document_loaded = ->
  myReader = new Reader()
  myReader.initializeReader()

$(document).on 'page:load', document_loaded
$(document).on 'turbolinks:load', document_loaded

$(document).ready(document_loaded)
