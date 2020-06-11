module Phone.Shadow exposing (..)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Phone.Colors exposing (..)


phoneShadow =
    Border.shadow
        { offset = ( 10, 10 )
        , size = 1
        , blur = 20
        , color = shadowColor
        }
