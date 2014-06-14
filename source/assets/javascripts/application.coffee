# -------------------------------------
#   Slidescore Module
# -------------------------------------

@Slidescore ?= {}

Slidescore = do ->

  # -------------------------------------
  #   Variables
  # -------------------------------------

  options: {}

  index = 0

  shortcuts =
    'h'     : 72
    'j'     : 74
    'k'     : 75
    'l'     : 76
    'next'  : 39
    'prev'  : 37
    'space' : 32
    'q'     : 16
    'esc'   : 27

  # -------------------------------------
  #   Init
  #   -> Initialize the module
  #
  #   options - the options object
  # -------------------------------------

  init = (options) ->
    Slidescore.options = options
    Slidescore.slidesLength = Slidescore.options.slides.length
    setEvents()
    setLocation() if window.location.hash

  # -------------------------------------
  #   Set Events
  #   -> Set up the event handlers
  # -------------------------------------

  setEvents = ->
    $(document).on 'keydown', (e) ->
      switch e.which
        when shortcuts.h then setSlide(1)
        when shortcuts.j then nextSlide()
        when shortcuts.next then nextSlide()
        when shortcuts.space then nextSlide()
        when shortcuts.k then prevSlide()
        when shortcuts.prev then prevSlide()
        when shortcuts.l then setSlide(Slidescore.slidesLength)
        when shortcuts.q then modal('open')
        when shortcuts.esc then modal('close')

    Slidescore.options.modal.on 'click', (e) ->
      e.preventDefault()
      modal('close')

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
    unless index == Slidescore.slidesLength
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
      scrollTop: parseInt( $(to).offset().top - Slidescore.options.offsetPadding )
    }, Slidescore.options.scrollSpeed)

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
    Slidescore.options.modal.toggleClass('is-active') if action == 'open'
    Slidescore.options.modal.removeClass('is-active') if action == 'close'

  # -------------------------------------
  #   Public Methods
  # -------------------------------------

  init: init

# -------------------------------------
#   Document Ready
# -------------------------------------

$ ->
  options =
    slides: $('section')
    scrollSpeed: 250
    offsetPadding: 40
    modal: $('.modal')

  Slidescore.init(options)

