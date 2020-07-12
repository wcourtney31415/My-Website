module Desktop.Colors exposing (dropNavColor, grayFortyTwo)

import Color as C
import Element as E
import HelperFunctions exposing (convertColor)


grayFortyTwo : E.Color
grayFortyTwo =
    convertColor <| C.rgb255 42 42 42


dropNavColor : E.Color
dropNavColor =
    convertColor <| C.rgb255 105 108 112
