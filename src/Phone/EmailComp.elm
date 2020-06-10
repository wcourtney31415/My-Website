module Phone.EmailComp exposing (..)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)
import Phone.Colors exposing (..)
import Phone.TitleContentComp exposing (..)


emailComponent =
    titleContentComp
        []
        { title = "Email"
        , titleAttr =
            [ Font.color white
            , Background.color darkerBlue
            ]
        , contentAttr =
            [ Font.color black
            , Background.color lighterBlue
            ]
        , contents = [ buttons ]
        }


buttons =
    Element.row
        [ spacing 45
        , centerX
        ]
        [ btnEmailNow
        , btnEmailClipboard
        ]


btnAttributes =
    [ Font.size 60
    , padding 30
    , Background.color gray
    , Border.rounded 18
    , Background.gradient
        { angle = 0
        , steps =
            [ lightestBlue
            , grayThirtyFour
            ]
        }
    ]


btnEmailNow =
    Element.link
        btnAttributes
        { url = "mailto:" ++ myEmail
        , label = text "Email Now"
        }


btnEmailClipboard =
    Input.button
        btnAttributes
        { onPress = Just <| CopyToClipboard myEmail
        , label = text "To Clipboard"
        }
