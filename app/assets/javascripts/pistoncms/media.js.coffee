
Media =

  initialize: () ->

    $showBtn        = $('#show_media_upload')
    $hideBtn        = $('.media-close-btn')
    $fakeFileBtn    = $('#fake_file_btn')
    $realFileBtn    = $('#pistoncms_media_file')
    $insertBtn      = $('.media-btn-insert')
    featureBtn     = '#featured_image_btn'
    $featureSelect  = $('.select-media-thumb')
    removeFtImg    = '#remove_featured_image'

    $showBtn.on 'click', (e) ->
      e.preventDefault()
      Pistoncms.openLightbox()

    $(document).on 'click', featureBtn, (e) ->
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

    $featureSelect.on 'click', (e) ->
      e.preventDefault()
      val = $(this).attr('data-id')
      Media.setFeaturedImage(val)
      Media.resetMediaForm()
      Media.addFeaturedThumb($(this).attr('src'))

    $(document).on 'click', removeFtImg, (e) ->
      e.preventDefault()
      $(removeFtImg).remove()
      Media.removeFeaturedImage()
      Media.removeFeaturedThumb()

  #
  # Add/Remove Featured Thumb
  #

  addFeaturedThumb: (src) ->
    src = src.replace('thumb_', '')
    img = '<img  src="' + src + '" />'
    $('#featured_image_thumbnail').html(img)

  removeFeaturedThumb: () ->
    $('#featured_image_thumbnail img').remove()

  featuredImageBtn: () ->
    $('#featured_image_btn')

  featuredImageField: () ->
    $('#pistoncms_post_featured_image')

  mediaForm: () ->
    $('#new_pistoncms_media')

  previewContainer: () ->
    $('.preview-media-wrap')

  resetMediaForm: () ->
    Pistoncms.closeLightbox()
    Media.mediaForm().show()
    Media.previewContainer().remove()
    Media.uploadDataDiv().remove()

  removeFeaturedImage: () ->
    Media.featuredImageField().val("")
    addLink = '<a href="javascript:void" id="featured_image_btn">Set featured image</a>'
    Media.featuredImageField().before(addLink)


  setFeaturedImage: (value) ->
    Media.featuredImageBtn().remove()
    removeLink = "<a href='javascript:void(0)' id='remove_featured_image'>Remove featured image</a>"
    Media.featuredImageField().before(removeLink)
    Media.featuredImageField().val(value)

  uploadDataDiv: () ->
    $('.upload-data')

window.Media = Media