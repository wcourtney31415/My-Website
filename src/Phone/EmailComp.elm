module Phone.EmailComp exposing (..)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import MessagesAndModels exposing (..)
import Phone.Colors exposing (..)


emailComponent =
    let
        title =
            Element.el
                [ Font.size 70
                , Font.bold
                , Font.color white
                , Background.color darkerBlue
                , width fill
                , paddingEach
                    { top = 30
                    , left = 30
                    , right = 30
                    , bottom = 18
                    }
                , Border.roundEach
                    { topLeft = 18
                    , topRight = 18
                    , bottomLeft = 0
                    , bottomRight = 0
                    }
                ]
                (Element.el
                    [ centerX
                    ]
                 <|
                    text "Email"
                )

        buttons =
            Element.row
                [ spacing 45
                , centerX
                , Background.color <| rgb255 102 148 194
                , width fill
                , paddingEach
                    { top = 18
                    , left = 30
                    , right = 30
                    , bottom = 30
                    }
                , Border.roundEach
                    { topLeft = 0
                    , topRight = 0
                    , bottomLeft = 18
                    , bottomRight = 18
                    }
                ]
                [ emailNow
                , emailClipboard
                ]

        emailNow =
            Element.link
                [ Font.size 60
                , padding 30
                , Background.color gray
                , Border.rounded 18
                ]
                { url = "mailto:" ++ myEmail
                , label = text "Email Now"
                }

        emailClipboard =
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
    in
    Element.column
        [ centerX
        , centerY
        , Border.rounded 32
        , centerY
        , Border.shadow { offset = ( 10, 10 ), size = 1, blur = 20, color = rgb255 90 90 90 }
        ]
        [ title
        , buttons
        ]
