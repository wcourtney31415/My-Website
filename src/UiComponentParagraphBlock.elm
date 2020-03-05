module UiComponentParagraphBlock exposing (..)

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
