module PageWelcome exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HsvToRgb exposing (..)
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)
import UiComponentGlobal exposing (..)
import UiComponentSlideShow exposing (..)


pageWelcome : Model -> Element Msg
pageWelcome model =
    Element.column
        [ width fill
        , centerX
        ]
        [ slideShow model.activeSlide
        , quadGroup
        , quoteBlock model
        , anchorTexts1
        , anchorTexts2
        , anchorTexts1
        ]


anchorTexts1 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach
            { top = 150
            , bottom = 150
            , right = 40
            , left = 40
            }
        , anchorTexts1Gradient
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach
                { top = 0
                , bottom = 20
                , left = 0
                , right = 0
                }
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            ]
            [ text "And here's why it matters!" ]
        ]


anchorTexts2 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach
            { top = 150
            , bottom = 150
            , right = 40
            , left = 40
            }
        , anchorTexts2Gradient
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach
                { top = 0
                , bottom = 20
                , left = 0
                , right = 0
                }
            , Font.alignRight
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            , Font.alignRight
            ]
            [ text "And here's why it matters!" ]
        ]


quadBlock =
    Element.column
        [ Background.color (hsv 136 0 0.94)
        , Border.rounded 5
        , Border.shadow { blur = 1.5, color = hsv 136 0 0.75, offset = ( 2, 2 ), size = 1 }
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
