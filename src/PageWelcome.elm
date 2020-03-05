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


paragraphBlock : LeftOrRight -> String -> String -> Element Msg
paragraphBlock leftOrRight title paragraph =
    let
        titlePaddingAmmount =
            40

        settings =
            case leftOrRight of
                Left ->
                    { alignment = alignLeft
                    , padding =
                        paddingEach
                            { top = 0
                            , bottom = 0
                            , left = titlePaddingAmmount
                            , right = 0
                            }
                    }

                Right ->
                    { alignment = alignRight
                    , padding =
                        paddingEach
                            { top = 0
                            , bottom = 0
                            , left = 0
                            , right = titlePaddingAmmount
                            }
                    }
    in
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

        --, Background.color obviousOrange
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

            --, Background.color obviousPurple
            ]
            [ Element.el
                [ settings.alignment

                --, Background.color obviousBlue
                , settings.padding
                ]
              <|
                text title
            ]
        , Element.paragraph
            [ Font.size 20
            , Font.color <| rgb255 50 50 50
            , width
                (fill
                    |> maximum 900
                )
            , settings.alignment

            --, Background.color obviousGreen
            ]
            [ Element.paragraph
                [ settings.alignment
                , spacing 12
                ]
              <|
                [ text paragraph
                ]
            ]
        ]



{- Original
   paragraphBlock title paragraph =
       Element.column
           [ width (fill |> maximum 1200)
           , centerX
           , paddingEach
               { top = 150
               , bottom = 150
               , right = 40
               , left = 40
               }
           , paragraphBlockGradient
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
               [ text title ]
           , Element.paragraph
               [ Font.bold
               , Font.size 20
               , Font.alignRight
               ]
               [ text paragraph ]
           ]
-}


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
