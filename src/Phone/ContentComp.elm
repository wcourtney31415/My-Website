module Phone.ContentComp exposing (..)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)


contentComp contents =
    Element.column
        [ centerX
        , Border.rounded 32
        , centerY
        , Border.shadow
            { offset = ( 10, 10 )
            , size = 1
            , blur = 20
            , color = rgb255 90 90 90
            }
        , Background.color <|
            rgb255 102 148 194
        , Border.rounded 25
        , padding 30
        ]
        contents
