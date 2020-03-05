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
import UiComponentParagraphBlock exposing (..)
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
        , paragraphBlock
            Left
            "Functional Programming"
            "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. Purely functional languages use very strict rules that enforce good coding habits. Additionally they are based around immutability, meaning that the state of a “Variable” never changes, you simply return a modified copy of that value. I personally have grown to love this, because between these two principles it significantly reduces unexpected side effects. Learning to use functional programming has, in a way, rewired the way I think about the code, and I’m eager to continue exploring that avenue."
        , paragraphBlock
            Right
            "Functional Programming"
            "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. Purely functional languages use very strict rules that enforce good coding habits. Additionally they are based around immutability, meaning that the state of a “Variable” never changes, you simply return a modified copy of that value. I personally have grown to love this, because between these two principles it significantly reduces unexpected side effects. Learning to use functional programming has, in a way, rewired the way I think about the code, and I’m eager to continue exploring that avenue."
        , paragraphBlock
            Left
            "Functional Programming"
            "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. Purely functional languages use very strict rules that enforce good coding habits. Additionally they are based around immutability, meaning that the state of a “Variable” never changes, you simply return a modified copy of that value. I personally have grown to love this, because between these two principles it significantly reduces unexpected side effects. Learning to use functional programming has, in a way, rewired the way I think about the code, and I’m eager to continue exploring that avenue."
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
