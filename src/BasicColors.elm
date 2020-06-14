module BasicColors exposing
    ( black
    , blue
    , red
    , shadowColor
    , white
    )

import Element
    exposing
        ( Color
        , rgb
        , rgb255
        )


white : Color
white =
    rgb255 255 255 255


red : Color
red =
    rgb 1 0 0


blue : Color
blue =
    rgb 0 0 1


black : Color
black =
    rgb 0 0 0


shadowColor : Color
shadowColor =
    rgb255 90 90 90
