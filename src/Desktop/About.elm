module Desktop.About exposing (aboutPage)

import BasicColors exposing (..)
import Data exposing (..)
import Desktop.Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)


aboutPage model =
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
            [ Background.color greyFortyTwo
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
            (text "About Me")
        ]


frontPageParagraph : Element Msg
frontPageParagraph =
    let
        frontPageText =
            "For professional inqueries, please contact me at " ++ myEmail ++ " and I will get back to you as soon as possible. I look forward to speaking with you."
    in
    Element.paragraph
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width <| px 1050
        , bkgAttributes
            [ Background.color greyFortyTwo
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
        [ text frontPageText ]
