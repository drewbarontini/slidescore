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
    'h' : 72
    'j' : 74
    'k' : 75
    'l' : 76

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
        when shortcuts.k then prevSlide()
        when shortcuts.l then setSlide(Slidescore.slidesLength)

  # -------------------------------------
  #   Set Location
  #   -> Sets the appropriate hash URL
  #
  #   i - the slide index number
  # -------------------------------------

  setLocation = ->
    i = window.location.hash.replace('#', '')
    scrollTo(i)

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
      scrollTop: parseInt( $(to).offset().top )
    }, Slidescore.options.scrollSpeed)

  # -------------------------------------
  #   Change URL
  #   -> Update the URL hash
  # -------------------------------------

  changeUrl = -> window.location.href = "##{index}"

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

  Slidescore.init(options)

