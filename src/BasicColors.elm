module BasicColors exposing (shadowColor, white)

import Color as C
import Element as E
import HelperFunctions exposing (convertColor)


shadowColor : E.Color
shadowColor =
    convertColor <| C.rgb255 90 90 90


white : E.Color
white =
    convertColor C.white
