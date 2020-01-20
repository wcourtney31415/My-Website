module ViewComponents.MyColors exposing (..)

import Element exposing (..)
import ViewComponents.HsvToRgb exposing (..)


myHue =
    160


colorGray1 =
    hsv 0 0 0.93


colorGray2 =
    hsv 0 0 0.96


colorInlineTitleBar =
    hsv 120 0.39 0.67


colorNavBar =
    hsv 120 1 0.5


colorBody =
    hsv 120 0.52 0.69


colorA =
    hsv myHue 1 1


colorB =
    hsv myHue 0.93 1


colorC =
    hsv myHue 0.83 1


colorD =
    hsv myHue 0.73 1


colorE =
    hsv myHue 0.63 1


colorF =
    hsv myHue 0.51 1


white =
    rgb255 255 255 255


black =
    rgb255 0 0 0


obviousRed =
    rgb255 255 0 0


obviousGreen =
    rgb255 0 255 0


obviousBlue =
    rgb255 0 0 255
