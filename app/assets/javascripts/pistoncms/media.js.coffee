
Media = 

  initialize: () ->
    console.log 'hello'

    # Toggle Media Upload
    $showBtn = $('#show_media_upload')
    $hideBtn = $('.media-close-btn')

    $showBtn.on 'click', (e) ->
      e.preventDefault()
      Pistoncms.$lightbox.fadeIn(200)

    $hideBtn.on 'click', (e) ->
      e.preventDefault()
      Pistoncms.$lightbox.fadeOut(200)


window.Media = Media