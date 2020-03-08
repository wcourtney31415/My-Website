module SlideshowSlide2 exposing (..)

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
