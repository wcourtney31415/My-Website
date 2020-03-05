module UiComponentQuadBlock exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import ResourceColors exposing (..)
import UiComponentGlobal exposing (..)
import UiComponentParagraphBlock exposing (..)
import UiComponentSlideShow exposing (..)


quadBlock =
    Element.column
        [ Background.color colorQuadBlockBackground
        , Border.rounded 5
        , Border.shadow { blur = 1.5, color = colorQuadBlockShadow, offset = ( 2, 2 ), size = 1 }
        , paddingXY 20 20
        , spacing 10
        , width (fill |> maximum 350)
        , centerX
        ]
        [ Element.el [ Font.size 25, Font.bold ] (text "Click Here for Details")
        , text "Detail 1"
        , text "Detail 2"
        , text "Detail 3"
        ]


quadGroup =
    Element.column
        [ spacing 40
        , padding 40
        , width (fill |> maximum 1200)
        , centerX
        ]
        [ Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        , Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        ]
