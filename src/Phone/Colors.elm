module Phone.Colors exposing
    ( darkerBlue
    , gradientColor1
    , gray
    , grayThirtyFour
    , lighterBlue
    , lighterGray
    , lightestBlue
    , myNameColor
    , theBackground
    , viewHeaderCol
    )

import Color as C
import Element as E
import HelperFunctions exposing (convertColor)


theBackground : E.Color
theBackground =
    convertColor <| C.rgb255 194 194 194


gradientColor1 : E.Color
gradientColor1 =
    convertColor <| C.rgb255 228 228 228


myNameColor : E.Color
myNameColor =
    convertColor <| C.rgb255 52 89 127


grayThirtyFour : E.Color
grayThirtyFour =
    convertColor <| C.rgb255 234 234 234


gray : E.Color
gray =
    convertColor <| C.rgb255 200 200 200


viewHeaderCol : E.Color
viewHeaderCol =
    convertColor <| C.rgb255 101 147 193


darkerBlue : E.Color
darkerBlue =
    convertColor <| C.rgb255 65 115 164


lighterBlue : E.Color
lighterBlue =
    convertColor <| C.rgb255 102 148 194


lighterGray : E.Color
lighterGray =
    convertColor <| C.rgb255 230 230 230


lightestBlue : E.Color
lightestBlue =
    convertColor <| C.rgb255 182 205 226
