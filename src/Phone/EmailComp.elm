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


btnEmailNow =
    Element.link
        [ Font.size 60
        , padding 30
        , Background.color gray
        , Border.rounded 18
        ]
        { url = "mailto:" ++ myEmail
        , label = text "Email Now"
        }


btnEmailClipboard =
    Input.button
        [ Font.size 60
        , padding 10
        , Background.color gray
        , padding 30
        , Border.rounded 18
        ]
        { onPress = Just <| CopyToClipboard myEmail
        , label = text "To Clipboard"
        }
