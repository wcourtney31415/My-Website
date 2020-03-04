module UiComponentSlideShow exposing (..)

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
        [ leftArrow
        , slide
        , rightArrow
        ]


leftArrow =
    Element.column
        [ paddingEach
            { left = 20
            , right = 20
            , bottom = 0
            , top = 0
            }
        , Background.color (hsv 136 0 0.84)
        , alpha 0.08
        , height fill
        , alignLeft
        , width (fill |> maximum 30)
        , Border.shadow
            { blur = 15
            , color = hsv 270 0 0
            , offset = ( 3, 0 )
            , size = 0
            }
        ]
        [ Element.el [ centerY, centerX ] (text "«") ]


rightArrow =
    Element.column
        [ paddingEach
            { left = 20
            , right = 20
            , bottom = 0
            , top = 0
            }
        , Background.color (hsv 136 0 0.84)
        , alpha 0.08
        , height fill
        , alignLeft
        , width (fill |> maximum 30)
        , Border.shadow
            { blur = 15
            , color = hsv 270 0 0
            , offset = ( -3, 0 )
            , size = 0
            }
        ]
        [ Element.el [ centerY, centerX ] (text "»") ]


slide1 =
    let
        textA =
            "Lets put some text here and see what exactly this looks like."

        textB =
            "Maybe some subtext?"

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
