module Ui_ImgAndTextBlock exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)


imgAndTextBlock : LeftOrRight -> Model -> Element Msg -> Element Msg -> Element Msg
imgAndTextBlock leftOrRight model img txtElement =
    let
        settings =
            case leftOrRight of
                Left ->
                    { color = model.colorList.leftBlock
                    , paragraph =
                        [ img ]
                            ++ [ Element.textColumn
                                    [ spacing 15
                                    , padding 20
                                    , alignLeft
                                    ]
                                    [ Element.paragraph []
                                        [ txtElement
                                        ]
                                    ]
                               ]
                    }

                Right ->
                    { color = model.colorList.rightBlock
                    , paragraph =
                        [ Element.textColumn
                            [ spacing 15
                            , padding 20
                            , alignLeft
                            ]
                            [ Element.paragraph []
                                [ txtElement
                                ]
                            ]
                        ]
                            ++ [ img ]
                    }
    in
    backgroundWrapper (hsvRecordToColor settings.color) model <|
        Element.wrappedRow
            [ paddingXY 40 40
            , spacing 20
            , centerX
            , width (fill |> maximum 1200)
            ]
            settings.paragraph



{- This background Wrapper is to allow the blocks to have a maximum
   width, but let their background span the width of the screen.
-}


backgroundWrapper : Color -> Model -> Element Msg -> Element Msg
backgroundWrapper color model el =
    Element.el
        [ Background.color color
        , width fill
        ]
        el
