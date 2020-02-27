module ResourceColors exposing (..)

import Element exposing (..)
import Element.Background as Background
import HsvToRgb exposing (..)
import MessagesAndModels exposing (..)


type ColorProperty
    = Hue
    | Saturation
    | Value


hsvRecordToColor : HsvRecord -> Color
hsvRecordToColor hsvRecord =
    hsv
        hsvRecord.hue
        hsvRecord.saturation
        hsvRecord.value


colorList : ColorList
colorList =
    { header = { hue = 194, saturation = 0.73, value = 0.76 }
    , footer = { hue = 194, saturation = 0.73, value = 0.91 }
    , quoteBlock1 = { hue = 194, saturation = 0.73, value = 1 }
    , quoteBlock2 = { hue = 194, saturation = 0.73, value = 0.73 }
    , inlineTitleBar = { hue = 194, saturation = 0.73, value = 0.91 }
    , leftBlock = { hue = 0, saturation = 0, value = 0.93 }
    , rightBlock = { hue = 0, saturation = 0, value = 0.93 }
    , fontA = { hue = 0, saturation = 0, value = 0.93 }
    , fontB = { hue = 0, saturation = 0, value = 0.93 }
    }


slideShowGradient : Attribute Msg
slideShowGradient =
    let
        col1 =
            hsv 136 0 0.98

        col2 =
            hsv 136 0 0.9

        col3 =
            hsv 136 0 0.8
    in
    Background.gradient
        { angle = pi
        , steps =
            [ col1
            , col2
            , col2
            , col2
            , col2
            , col2
            , col2
            , col3
            ]
        }


anchorTexts1Gradient : Attribute Msg
anchorTexts1Gradient =
    Background.gradient
        { angle = pi
        , steps =
            [ hsv 136 0 1
            , hsv 136 0 0.95
            , hsv 136 0 0.97
            ]
        }


anchorTexts2Gradient : Attribute Msg
anchorTexts2Gradient =
    Background.gradient
        { angle = pi
        , steps =
            [ hsv 136 0 1
            , hsv 136 0 0.95
            , hsv 136 0 0.97
            ]
        }


colorLeftBlock : Color
colorLeftBlock =
    hsv 0 0 0.93


colorRightBlock : Color
colorRightBlock =
    hsv 0 0 0.96


white : Color
white =
    rgb255 255 255 255


black : Color
black =
    rgb255 0 0 0


lightGrey =
    hsv 1 0 0.92


obviousRed : Color
obviousRed =
    rgb255 255 0 0


obviousGreen : Color
obviousGreen =
    rgb255 0 255 0


obviousBlue : Color
obviousBlue =
    rgb255 0 0 255


obviousPurple : Color
obviousPurple =
    hsv 270 0.91 0.85


obviousOrange : Color
obviousOrange =
    hsv 30 0.91 0.99


dynamicSliderHeader : Color
dynamicSliderHeader =
    hsv 1 0 0.9


dynamicSliderBody : Color
dynamicSliderBody =
    hsv 1 0 0.95
