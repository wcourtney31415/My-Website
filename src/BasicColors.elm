module BasicColors exposing (shadowColor)

import Color as C
import Element as E
import HelperFunctions exposing (convertColor)


shadowColor : E.Color
shadowColor =
    convertColor <| C.rgb255 90 90 90
