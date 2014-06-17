# -------------------------------------
#   Slidescore Module
# -------------------------------------

@Slidescore ?= {}

Slidescore = do ->

  # -------------------------------------
  #   Variables
  # -------------------------------------

  settings = {}

  index = 0

  shortcuts =
    'h'     : 72
    'j'     : 74
    'k'     : 75
    'l'     : 76
    'next'  : 39
    'prev'  : 37
    'space' : 32
    'q'     : 191
    'esc'   : 27

  slidesLength = 0

  # -------------------------------------
  #   Init
  #   -> Initialize the module
  # -------------------------------------

  init = ->
    slidesLength = settings.slides.length
    setEvents()
    setLocation() if window.location.hash
    fixBrokenImages()

  # -------------------------------------
  #   Set Options
  #   -> Sets the options object
  #
  #   options - the options object
  # -------------------------------------

  setOptions = (options) ->
    settings = options

  # -------------------------------------
  #   Set Events
  #   -> Set up the event handlers
  # -------------------------------------

  setEvents = ->
    $(document).on 'keydown', (e) ->
      switch getKeyCode(e)
        when shortcuts.h then setSlide(1)
        when shortcuts.j then nextSlide()
        when shortcuts.next then nextSlide()
        when shortcuts.space then nextSlide()
        when shortcuts.k then prevSlide()
        when shortcuts.prev then prevSlide()
        when shortcuts.l then setSlide(slidesLength)
        when e.shiftKey && shortcuts.q then modal('open')
        when shortcuts.esc then modal('close')

    settings.modal.on 'click', (e) ->
      e.preventDefault()
      modal('close')

  # -------------------------------------
  #   Get Key Code
  #   -> Return the appropriate key code
  #
  #   e - The event object
  # -------------------------------------

  getKeyCode = (e) ->
    e = e || window.event
    charCode = e.keyCode || e.which
    charCode

  # -------------------------------------
  #   Set Location
  #   -> Sets the appropriate hash URL
  # -------------------------------------

  setLocation = ->
    index = window.location.hash.replace('#', '')
    scrollTo(index)

  # -------------------------------------
  #   Set Slide
  #   -> Set the specific slide
  #
  #   number - the slide number
  # -------------------------------------

  setSlide = (number) ->
    index = number
    scrollTo()
    changeUrl()

  # -------------------------------------
  #   Next Slide
  #   -> Move to the next slide
  # -------------------------------------

  nextSlide = ->
    unless index == slidesLength
      index++
      scrollTo()
      changeUrl()

  # -------------------------------------
  #   Previous Slide
  #   -> Move to the previous slide
  # -------------------------------------

  prevSlide = ->
    unless index == 1
      index--
      scrollTo()
      changeUrl()

  # -------------------------------------
  #   Scroll To
  #   -> Animate the scroll
  #
  #   i - the slide index number
  # -------------------------------------

  scrollTo = (i = index) ->
    to = $("section[data-id='#{i}']")

    $('body, html').animate({
      scrollTop: parseInt( $(to).offset().top - settings.offsetPadding )
    }, settings.scrollSpeed)

  # -------------------------------------
  #   Change URL
  #   -> Update the URL hash
  # -------------------------------------

  changeUrl = -> window.location.href = "##{index}"

  # -------------------------------------
  #   Modal
  #   -> Show the keyboard shortcuts modal
  #
  #   action - 'open' or 'close'
  # -------------------------------------

  modal = (action) ->
    settings.modal.toggleClass('is-active') if action == 'open'
    settings.modal.removeClass('is-active') if action == 'close'

  # -------------------------------------
  #   Set Broken Images
  #   -> Sets a placehold image for unloaded images
  # -------------------------------------

  fixBrokenImages = ->
    $('img').error ->
      $(@).attr('src', "http://placehold.it/1024x768/000/000/")

  # -------------------------------------
  #   Public Methods
  # -------------------------------------

  init: init
  setOptions: setOptions

# -------------------------------------
#   Document Ready
# -------------------------------------

$ ->
  options =
    slides: $('section')
    scrollSpeed: 250
    offsetPadding: 40
    modal: $('.modal')

  Slidescore.setOptions(options)
  Slidescore.init()

