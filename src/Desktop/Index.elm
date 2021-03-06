module Desktop.Index exposing (homepage)

import BasicColors exposing (white)
import Color as C
import Data exposing (myEmail, myName)
import Desktop.Colors exposing (grayFortyTwo)
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
import Fonts exposing (fontDesktopHeader)
import HelperFunctions exposing (bkgAttributes, textElement)
import MessagesAndModels exposing (Msg)


homepage : Element Msg
homepage =
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
        , padding 10
        , Font.color white
        , fontDesktopHeader
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
            [ Font.size 40
            , centerX
            ]
            "Software Developer"
        , el
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
    paragraph
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width (fill |> maximum 800)
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
        , link []
            { url = "mailto:" ++ myEmail
            , label = text myEmail
            }
        , text postLink
        ]
