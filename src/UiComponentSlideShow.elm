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


slide1 =
    let
        textA =
            "Welcome to my website"

        textB =
            "Here you can learn about the practices and preferences I value in my day to day coding. I will also be providing a few simple examples of my work, this website itself being one of them. I developed it myself in a functional language I’m currently learning (and strongly recommend) called Elm."

        textC =
            "Please contact me at " ++ emailAddress ++ " with any professional inquiries. I look forward to hearing from you."
    in
    Element.row
        [ width fill, padding 20 ]
        [ elmLogo []
        , Element.column
            [ alignTop
            , paddingEach
                { right = 0
                , left = 40
                , top = 30
                , bottom = 0
                }
            , width fill
            , spacing 20
            ]
            [ Element.paragraph
                [ Font.bold
                , Font.size 23
                ]
                [ text textA ]
            , Element.paragraph
                [ Font.size 20
                ]
                [ text textB ]
            , Element.paragraph
                [ Font.size 17
                ]
                [ text textC ]
            ]
        ]


slide2 =
    let
        textA =
            "This is Slide 2!"

        textB =
            "Here's some subtext for Slide 2."

        textC =
            "Definitely subtext! It looks like this would be a decent place for a short informative paragraph. Yeah, the paragraph looks right right here."
    in
    Element.row
        [ width fill, padding 20 ]
        [ elmLogo []
        , Element.column
            [ alignTop
            , paddingEach
                { right = 0
                , left = 40
                , top = 30
                , bottom = 0
                }
            , width fill
            , spacing 15
            ]
            [ Element.paragraph
                [ Font.bold
                , Font.size 23
                ]
                [ text textA ]
            , Element.paragraph
                [ Font.size 20
                ]
                [ text textB ]
            , Element.paragraph
                [ Font.size 18
                ]
                [ text textC ]
            ]
        ]
