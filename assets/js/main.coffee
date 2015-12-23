---
---

$ ->

  $('[data-toggle="tooltip"]').tooltip()

  $popovers = $('[data-toggle="popover"]')
  $popovers.popover()

  $popovers.on 'click', (e) ->
    e.preventDefault()
    $popovers.not(this).popover('hide')

  $(document).on 'click', (e) ->
    $popovers.each ->
      if (!$(this).is(e.target) && $(this).has(e.target).length is 0 && $('.popover').has(e.target).length is 0)
        $(this).popover('hide')

  client = undefined

  $popovers.on 'shown.bs.popover', ->

    $copy = $('.popover .copy')

    $copy.on 'click', (e) ->
      e.preventDefault()

    $copy.tooltip
      title: 'Copy to clipboard'
      placement: 'bottom'
      trigger: 'manual'

    $('.popover .clip-wrap').on 'mouseenter', -> $copy.tooltip('show')
    $('.popover .clip-wrap').on 'mouseleave', -> $copy.tooltip('hide')

    client = new ZeroClipboard($copy)
    client.on 'ready', () ->

      client.on 'copy', (event) ->
        $copy.attr('title', 'Copied !').tooltip('fixTitle').tooltip('show')
        setTimeout (-> $copy.tooltip('hide')), 500

      client.on 'aftercopy', (event) ->
        $copy.attr('title', 'Copy to clipboard').tooltip('fixTitle')


  $('.ability-item .logo').on 'click', (e) ->
    e.preventDefault()

  $('#portfolio-gallery').on 'show.bs.modal', (event) ->
    $button = $(event.relatedTarget)
    $(this).find('.expanded').attr('src', $button.data('image'))
    $(this).find('.expanded').attr('title', $button.data('title'))
