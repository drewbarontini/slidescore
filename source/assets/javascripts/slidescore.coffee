# *************************************
#
#   Namespace
#
# *************************************

@Slidescore = {}

# *************************************
#
#   Module
#
# *************************************

@Slidescore = do ->

  # -------------------------------------
  #   Private Variables
  # -------------------------------------

  _settings       = {}
  _index          = 0
  _slidesLength   = 0
  _shortcuts      =
    'h'     : 72
    'j'     : 74
    'k'     : 75
    'l'     : 76
    'next'  : 39
    'prev'  : 37
    'space' : 32
    'q'     : 191
    'esc'   : 27

  # -------------------------------------
  #   Initialize
  # -------------------------------------

  init = ( options ) ->
    _settings = $.extend
      $slides       : $( 'section' )
      $modal        : $( '.modal' )
      $progress     : $( '.progress' )
      scrollSpeed   : 250
      offsetPadding : 40
      activeClass   : 'is-active'
    , options

    _slidesLength = _settings.$slides.length

    _setEventHandlers()
    _setLocation() if window.location.hash
    _updateProgress()
    _fixBrokenImages()

  # -------------------------------------
  #   Set Events
  # -------------------------------------

  _setEventHandlers = ->

    # ----- Keyboard Shortcuts ----- #

    $( document ).on 'keydown', ( event ) ->
      switch _getKeyCode( event )
        when _shortcuts.h                   then _gotoSlide( 1 )
        when _shortcuts.j                   then _gotoSlide( 'next' )
        when _shortcuts.next                then _gotoSlide( 'next' )
        when _shortcuts.space               then _gotoSlide( 'next' )
        when _shortcuts.k                   then _gotoSlide( 'prev' )
        when _shortcuts.prev                then _gotoSlide( 'prev' )
        when _shortcuts.l                   then _gotoSlide( _slidesLength )
        when event.shiftKey && _shortcuts.q then _modal( 'open' )
        when _shortcuts.esc                 then _modal( 'close' )

    # ----- Modal Close ----- #

    _settings.$modal.on 'click', ( event ) ->
      event.preventDefault()

      _modal( 'close' )

  # -------------------------------------
  #   Get Key Code
  # -------------------------------------

  _getKeyCode = ( event ) ->
    event    = event  || window.event
    charCode = event.keyCode || event.which

    charCode

  # -------------------------------------
  #   Set Location
  # -------------------------------------

  _setLocation = ->
    _index = window.location.hash.replace( '#', '' )

    _scrollTo( _index )

  # -------------------------------------
  #   Update Progress
  # -------------------------------------

  _updateProgress = ->
    progress = Math.round ( ( _index / _slidesLength ) * 100 )

    _settings.$progress.css( 'width', "#{ progress }%" )

  # -------------------------------------
  #   Goto Slide
  # -------------------------------------

  _gotoSlide = ( slide ) ->
    switch slide
      when 'next'
        _index++ unless _index == _slidesLength
      when 'prev'
        _index-- unless _index == 1
      else
        _index = slide

    _update()

  # -------------------------------------
  #   Update
  # -------------------------------------

  _update = ->
    _scrollTo()
    _changeUrl()
    _updateProgress()

  # -------------------------------------
  #   Scroll To
  # -------------------------------------

  _scrollTo = ( i = _index ) ->
    to = $( "section[data-id='#{ i }']" )

    $( 'body, html' ).animate
      scrollTop : parseInt( $(to).offset().top - _settings.offsetPadding )
    , _settings.scrollSpeed

  # -------------------------------------
  #   Change URL
  # -------------------------------------

  _changeUrl = -> window.location.href = "##{ _index }"

  # -------------------------------------
  #   Modal
  # -------------------------------------

  _modal = ( action ) ->
    _settings.$modal.toggleClass( _settings.activeClass ) if action == 'open'
    _settings.$modal.removeClass( _settings.activeClass ) if action == 'close'

  # -------------------------------------
  #   Set Broken Images
  #   -> Sets a placehold image for unloaded images
  # -------------------------------------

  _fixBrokenImages = ->
    $( 'img' ).error ->
      $(@).attr( 'src', 'http://placehold.it/1024x768/000/000/' )

  # -------------------------------------
  #   Public Methods
  # -------------------------------------

  init : init
