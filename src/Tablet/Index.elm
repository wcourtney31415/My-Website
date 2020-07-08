module Tablet.Index exposing (homepage)

import BasicColors exposing (white)
import Data exposing (myEmail, myName)
import Element
    exposing
        ( Element
        , alpha
        , centerX
        , centerY
        , column
        , el
        , fill
        , link
        , maximum
        , padding
        , paddingXY
        , paragraph
        , spacing
        , text
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (bkgAttributes, textElement)
import MessagesAndModels exposing (Msg)
import Tablet.Colors exposing (grayFortyTwo)


homepage : Element Msg
homepage =
    homepageItems


homepageItems : Element Msg
homepageItems =
    column
        [ centerX
        , centerY
        , paddingXY 35 55
        ]
        [ titleBox, frontPageParagraph ]


titleBox : Element Msg
titleBox =
    column
        [ centerX
        , centerY
        , padding 25
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
        [ textElement
            [ Font.size 50
            , centerX
            ]
            "Software Developer"
        , el
            [ Font.size 40
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
    paragraph
        [ centerX
        , centerY
        , Font.color white
        , padding 50
        , width (fill |> maximum 800)
        , spacing 50
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
        [ Element.el [ Font.size 35 ] <| text preLink
        , link
            [ Font.size 30
            , Font.bold
            ]
            { url = "mailto:" ++ myEmail
            , label = text myEmail
            }
        , Element.el [ Font.size 35 ] <| text postLink
        ]
