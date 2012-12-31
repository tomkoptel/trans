zoomeLevel = ->
  screenCssPixelRatio = (window.outerWidth - 8) / window.innerWidth
  if screenCssPixelRatio <= 0.25
    zoomLevel = "-6"
  else if screenCssPixelRatio <= 0.34
    zoomLevel = "-5"
  else if screenCssPixelRatio <= 0.50
    zoomLevel = "-4"
  else if screenCssPixelRatio <= 0.67
    zoomLevel = "-3"
  else if screenCssPixelRatio <= 0.76
    zoomLevel = "-2"
  else if screenCssPixelRatio <= 0.92
    zoomLevel = "-1"
  else if screenCssPixelRatio <= 1.10
      zoomLevel = "0"
  else if screenCssPixelRatio <= 1.32
      zoomLevel = "1"
  else if screenCssPixelRatio <= 1.58
      zoomLevel = "2"
  else if screenCssPixelRatio <= 1.90
      zoomLevel = "3"
  else if screenCssPixelRatio <= 2.28
      zoomLevel = "4"
  else if screenCssPixelRatio <= 2.70
      zoomLevel = "5"
  else
      zoomLevel = "unknown"
  console.log screenCssPixelRatio
  zoomLevel

castels_bottom_padding = (level)->
  padding_bottom_dict =
    "0": "0px"
    "-1": "30px"
    "-2": "115px"
    "-3": "193px"
    "-4": "450px"
    "-5": "1025px"
    "-6": "1534px"
  if parseInt(level) > 0
    padding_bottom = 0
  else
    padding_bottom = padding_bottom_dict[level]
  padding_bottom

arms_dimens = (level) ->
  dimens_dict =
    "0":
      width: "281px"
      height: "450px"
    "-1":
      width: "306px"
      height: "510px"
    "-2":
      width: "346px"
      height: "580px"
    "-3":
      width: "383px"
      height: "614px"
    "-4":
      width: "515px"
      height: "827px"
    "-5":
      width: "795px"
      height: "1273px"
    "-6":
      width: "1031px"
      height: "1723px"

  if parseInt(level) > 0
    dimens = dimens_dict["0"]
  else
    dimens = dimens_dict[level]
  dimens


$(document).ready ->
  zoom = document.documentElement.clientWidth / window.innerWidth

  $(window).resize ->
    level = zoomeLevel()
    console.log level
    bottom_padding = castels_bottom_padding(level)
    dimens = arms_dimens(level)
    $("#header").css("padding-bottom", bottom_padding)
    $("#arms").css("width", dimens.width)
    $("#arms").css("height", dimens.height)

