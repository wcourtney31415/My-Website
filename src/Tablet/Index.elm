module Tablet.Index exposing (homepage)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)
import Tablet.Colors exposing (..)


homepage model =
    homepageItems


homepageItems : Element Msg
homepageItems =
    Element.column
        [ centerX
        , centerY
        , moveUp 100
        ]
        [ titleBox, frontPageParagraph ]


titleBox : Element Msg
titleBox =
    Element.column
        [ centerX
        , centerY
        , padding 10
        , Font.color white
        , spacing 10
        , Font.bold
        , width fill
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.75
            , Border.roundEach
                { topLeft = 10
                , topRight = 10
                , bottomLeft = 0
                , bottomRight = 0
                }
            ]
        ]
        [ Element.el
            [ Font.size 40
            , centerX
            ]
            (text "Software Developer")
        , Element.el
            [ Font.size 20
            , centerX
            ]
            (text myName)
        ]


frontPageParagraph : Element Msg
frontPageParagraph =
    let
        preLink =
            "For professional inqueries, please contact me at "

        postLink =
            " and I will get back to you as soon as possible. I look forward to speaking with you."
    in
    Element.paragraph
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width <| px 800
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.6
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 10
                }
            ]
        ]
        [ text preLink
        , Element.link []
            { url = "mailto:" ++ myEmail
            , label = text myEmail
            }
        , text postLink
        ]
