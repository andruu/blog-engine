jQuery ->

  # console.log $('#comments h3').text().split(' ')[0]
  # console.log $('.comment-count .count').text()

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
