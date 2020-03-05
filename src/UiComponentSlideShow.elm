module UiComponentSlideShow exposing (..)

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
import SlideshowSlide1 exposing (..)
import SlideshowSlide2 exposing (..)
import UiComponentGlobal exposing (..)


slideShow : ActiveSlide -> Element Msg
slideShow activeSlide =
    let
        slide =
            case activeSlide of
                Slide1 ->
                    slide1

                Slide2 ->
                    slide2
    in
    Element.row
        [ centerX
        , width (fill |> maximum 1200)
        , height
            (fill |> minimum 300)
        , slideShowGradient
        ]
        [ slideshowArrow Left
        , slide
        , slideshowArrow Right
        ]


slideshowArrow : LeftOrRight -> Element Msg
slideshowArrow leftOrRight =
    let
        settings =
            case leftOrRight of
                Left ->
                    { symbol = "«"
                    , horizontalOffset = 3
                    }

                Right ->
                    { symbol = "»"
                    , horizontalOffset = -3
                    }
    in
    Element.column
        [ paddingEach
            { left = 20
            , right = 20
            , bottom = 0
            , top = 0
            }
        , Background.color colorSlideShowArrow
        , alpha 0.08
        , height fill
        , alignLeft
        , width (fill |> maximum 30)
        , Border.shadow
            { blur = 15
            , color = colorSlideShowArrowShadow
            , offset = ( settings.horizontalOffset, 0 )
            , size = 0
            }
        ]
        [ Element.el [ centerY, centerX ] (text settings.symbol) ]
