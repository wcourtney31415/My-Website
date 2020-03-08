module SlideshowSlide1 exposing (..)

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
import UiComponentInlineTitleBar exposing (..)


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
