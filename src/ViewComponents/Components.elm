module ViewComponents.Components exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Images.Images exposing (..)
import ModelAndMessages exposing (..)
import ViewComponents.HsvToRgb exposing (..)
import ViewComponents.LongText exposing (..)
import ViewComponents.MyColors exposing (..)



--Website Itself


mainContainer : Model -> Html.Html Msg
mainContainer model =
    Element.layout
        []
    <|
        Element.column
            [ Background.color <| white
            , width fill
            , paddingXY 0 0
            , height fill
            , centerX
            ]
            [ upperNavBar model
            , pageLanguagePreferences model
            ]



--Website scoped visual components


myName : Model -> Element Msg
myName model =
    el
        [ alignLeft
        , Font.color white
        , Font.size 25
        , Font.bold
        , fontShadows
        ]
    <|
        text "Wesley Courtney"


navLinks : Model -> List (Element Msg)
navLinks model =
    [ navBarLink model "Link" "https://github.com/wcourtney31415"
    , navBarLink model "Language Preferences" "https://github.com/wcourtney31415"
    , navBarLink model "My Story" "https://github.com/wcourtney31415"
    , navBarLink model "Site Source Code" "https://github.com/wcourtney31415"
    ]


upperNavBar : Model -> Element Msg
upperNavBar model =
    Element.wrappedRow
        [ Background.color colorNavBar
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        ]
    <|
        [ myName model ]
            ++ navLinks model


lowerNavBar : Model -> Element Msg
lowerNavBar model =
    Element.wrappedRow
        [ Background.color colorNavBar
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        , centerX
        ]
    <|
        navLinks
            model


smallTitleBar model color str =
    Element.paragraph
        [ Background.color color
        , padding 30
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        , Font.size 30
        , Font.bold
        ]
        [ text str
        ]


fontShadows =
    Font.shadow
        { offset = ( 3, 3 )
        , blur = 4
        , color = black
        }


navBarLink : Model -> String -> String -> Element Msg
navBarLink model label url =
    link
        [ alignRight
        , Font.color white
        ]
        { url = url
        , label = text label
        }


quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps = [ colorBody, hsv 120 0.52 0.6 ]
            }
        , padding 65
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        ]
        [ text quoteText
        ]


leftBlock : Model -> Element Msg -> String -> Element Msg
leftBlock model img txt =
    backgroundWrapper colorGray1 model <|
        Element.wrappedRow
            [ paddingXY 40 40
            , spacing 20
            , centerX
            , width (fill |> maximum 1200)
            ]
            [ img
            , Element.textColumn
                [ spacing 15
                , padding 20
                , alignLeft
                ]
                [ Element.paragraph []
                    [ text txt
                    ]
                ]
            ]



--This background Wrapper is to allow the blocks to have a maximum
--width, but let their background span the width of the screen.


backgroundWrapper : Color -> Model -> Element Msg -> Element Msg
backgroundWrapper color model el =
    Element.el
        [ Background.color color
        , width fill
        ]
        el


rightBlock : Model -> Element Msg -> String -> Element Msg
rightBlock model img txt =
    backgroundWrapper colorGray2 model <|
        Element.wrappedRow
            [ paddingXY 40 40
            , spacing 20
            , centerX
            , width (fill |> maximum 1200)
            ]
            [ Element.textColumn
                [ spacing 15
                , padding 20
                , alignLeft
                ]
                [ Element.paragraph []
                    [ text txt
                    ]
                ]
            , img
            ]



--Page: Language Preferences


pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , smallTitleBar model colorSmallTitleBar "Language Preferences"
        , rightBlock model (elmLogo []) firstParagraphText
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) firstParagraphText
        , leftBlock model (arduinoLogo []) firstParagraphText
        , lowerNavBar model
        ]
