################################################################################
# Created 15 Feb 2017 by Petr Krulis / petrkrulis.cz
################################################################################


class PanView extends Layer

  constructor: (@options={}) ->

    #Defaults
    @options.width ?= 1440
    @options.height ?= 900
    @options.devicePixelRatio ?= 1
    @options.backgroundColor ?= "#fff"

    #Call base class constructor and create layer
    super
      width: @options.width * @options.devicePixelRatio
      height: @options.height * @options.devicePixelRatio
      backgroundColor: @options.backgroundColor
      clip: true
      x: 0
      y: 0

    #Create the device
    Framer.DeviceView.Devices["PanView"] =
      deviceImageWidth: @options.width
      deviceImageHeight: @options.height
      screenWidth: @options.width
      screenHeight: @options.height
      backgroundColor: @options.backgroundColor
      deviceType: Framer.Device.Type.Computer

    #Set the device
    Framer.Device.deviceType = "PanView"
    Framer.Device.contentScale = 1 / @options.devicePixelRatio

    @pixelAlign()
    @draggable.momentum = false
    @draggable.overdrag = false
    @draggable.enabled = false
    @draggable.constraints =
      x: -@width + @width * 0.1
      y: -@height + @width * 0.1
      width: 3 * @width - 2 * @width * 0.1
      height: 3 * @height - 2 * @width * 0.1

    panView = this

    #Press & hold space to enable dragging
    document.addEventListener 'keypress', (event) ->
      if event.keyCode == 32
        panView.draggable.enabled = true
        document.body.style.cursor = "-webkit-grab"

    #Relase space to disable dragging
    document.addEventListener 'keyup', (event) ->
      panView.draggable.enabled = false
      document.body.style.cursor = "auto"

    #Press space & alt simultaneously to reset the position
    document.addEventListener 'keydown', (event) ->
      if event.keyCode == 32 && event.altKey
        panView.x = 0
        panView.y = 0

#Export the class
exports.PanView = PanView
