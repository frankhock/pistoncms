
Media =

  initialize: () ->

    $showBtn      = $('#show_media_upload')
    $hideBtn      = $('.media-close-btn')
    $fakeFileBtn  = $('#fake_file_btn')
    $realFileBtn  = $('#pistoncms_media_file')
    $insertBtn    = $('.media-btn-insert')

    $showBtn.on 'click', (e) ->
      e.preventDefault()
      Pistoncms.openLightbox()

    $hideBtn.on 'click', (e) ->
      e.preventDefault()
      Media.resetMediaForm()

    $(document).bind 'keydown', (e) ->
      if e.which == 27
        Media.resetMediaForm()

    $fakeFileBtn.on 'click', (e) ->
      e.preventDefault()
      $realFileBtn.click()

    $('.media-btn-insert').on 'click', (e) ->
      image = $('.preview-media-image:first-child').html();
      CKEDITOR.instances['pistoncms_post_content'].insertHtml(image);
      Pistoncms.closeLightbox()

    $insertBtn.on 'click', (e) ->
      e.preventDefault()
      Media.resetMediaForm()

  mediaForm: () ->
    $('#new_pistoncms_media')

  previewContainer: () ->
    $('.preview-media-wrap')

  resetMediaForm: () ->
    Pistoncms.closeLightbox()
    Media.mediaForm().show()
    Media.previewContainer().remove()
    Media.uploadDataDiv().remove()

  uploadDataDiv: () ->
    $('.upload-data')

window.Media = Media