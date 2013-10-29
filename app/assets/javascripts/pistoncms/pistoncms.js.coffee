$(document).ready ->

  Pistoncms =

    $lightbox: $('#pistoncms_lightbox')

    closeLightbox: () ->
      this.$lightbox.fadeOut(200)

    openLightbox: () ->
      this.$lightbox.fadeIn(200)


  window.Pistoncms = Pistoncms