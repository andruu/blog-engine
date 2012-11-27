window.cachedHeader = ''
window.cachedRecentPosts = ''

jQuery ->

  # Load recent posts
  if window.cachedRecentPosts != ''
    $('ul.recent-posts').append(window.cachedRecentPosts)
  else
    $.getScript('/pages/recent_posts')
  
  if $.cookie('logged_in') == 'true'

    # Check if the header has already been fetched from the server
    if window.cachedHeader != ''
      $('.main-nav').append(window.cachedHeader)
    else
      $.getScript('/users/current')
      
    # Show delete button for comments
    $('.delete').show()
    
  if $('.comments').length  
    $('#comment_name').val($.cookie('comment_name'))
    $('#comment_email').val($.cookie('comment_email'))
    $('#comment_url').val($.cookie('comment_url'))

  $('.close-btn').on 'click', ->
    $(this).parent().hide()
    return false

  $('form[data-update]').on 'submit', ->
    $('.add-comment').attr('disabled', 'disabled')

  $('form[data-update]').on 'ajax:success', (event, data) ->
    container = $(this).data('update')
    $('textarea').val('')
    $('.comment-added').show()
    $(container).append(data)
    $('.add-comment').removeAttr('disabled')

    current_count = parseInt($('.count')[0].innerHTML)
    $('.count').text(current_count + 1)

    $('html, body').animate
      scrollTop: $("#comments").offset().top
    , 200

  $('.bottom-btn').on 'click', ->
    $('html, body').animate
      scrollTop: $(document).height()
    , 200
    return false

  $('.top-btn').on 'click', ->
    $('html, body').animate
      scrollTop: 0
    , 200

  $(window).scroll (e) ->
    if $(window).scrollTop() > 40
      $('.side').addClass 'fixed'
      $('.top-btn').addClass 'show'
    else
      $('.side').removeClass 'fixed'
      $('.top-btn').removeClass 'show'
  
