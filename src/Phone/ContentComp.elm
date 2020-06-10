module Phone.ContentComp exposing (..)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import Phone.Colors exposing (..)
import Phone.Shadow exposing (..)


contentComp bkgColor contents =
    Element.column
        [ centerX
        , Border.rounded 32
        , centerY
        , phoneShadow
        , Background.color bkgColor
        , Border.rounded 25
        , padding 30
        ]
        contents
