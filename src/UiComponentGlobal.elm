module UiComponentGlobal exposing (..)

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


myStoryTextBody : Element Msg
myStoryTextBody =
    Element.textColumn [ spacing 50, padding 30, width (fill |> maximum 1200), centerX ]
        [ gameMakerLogo [ alignLeft, paddingXY 20 10 ]
        , paragraph [] [ text declarationOfIndependence ]
        , paragraph [] [ text declarationOfIndependence ]
        , cPlusPlusLogo [ alignRight, paddingXY 20 10 ]
        , paragraph [] [ text declarationOfIndependence ]
        , paragraph [] [ text declarationOfIndependence ]
        , ivyTechLogo
            [ alignLeft
            , paddingXY 20 10
            , Border.shadow
                { offset = ( 3, 3 )
                , size = 2
                , blur = 4
                , color = black
                }
            ]
        , paragraph [] [ text declarationOfIndependence ]
        ]


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


header : Model -> Element Msg
header model =
    Element.wrappedRow
        [ Background.color <|
            hsvRecordToColor model.colorList.header
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        ]
    <|
        [ myName model ]
            ++ navLinks model


footer : Model -> Element Msg
footer model =
    Element.wrappedRow
        [ Background.color <|
            hsvRecordToColor model.colorList.footer
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        , centerX
        ]
    <|
        navLinks
            model


inlineTitleBar : Model -> Color -> String -> Element msg
inlineTitleBar model color str =
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


fontShadows : Attr decorative msg
fontShadows =
    Font.shadow
        { offset = ( 3, 3 )
        , blur = 4
        , color = black
        }


navLinks : Model -> List (Element Msg)
navLinks model =
    [ navBarButton model "Hire Me" HireMe
    , navBarButton model "Language Preferences" LanguagePreferences
    , navBarButton model "My Story" MyStory
    , navBarLink model "Site Source Code" "https://github.com/wcourtney31415"
    ]


navBarButton : Model -> String -> Page -> Element Msg
navBarButton model label page =
    let
        underline =
            if model.selectedPage == page then
                [ Border.widthEach { bottom = 2, left = 0, right = 0, top = 0 } ]

            else
                []
    in
    Input.button
        ([ alignRight
         , Font.color white
         , Border.color white
         , paddingXY 0 4
         ]
            ++ underline
        )
        { onPress = Just (NavBarButtonClicked { model | selectedPage = page })
        , label = text label
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


quoteBlock : Model -> Element Msg
quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps =
                [ hsvRecordToColor model.colorList.quoteBlock1
                , hsvRecordToColor model.colorList.quoteBlock2
                ]
            }
        , padding 65
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        ]
        [ quoteElement model
        ]


leftBlock : Model -> Element Msg -> String -> Element Msg
leftBlock model img txt =
    backgroundWrapper (hsvRecordToColor model.colorList.leftBlock) model <|
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


rightBlock : Model -> Element Msg -> Element Msg -> Element Msg
rightBlock model img txtElement =
    backgroundWrapper (hsvRecordToColor model.colorList.rightBlock) model <|
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
                    [ txtElement
                    ]
                ]
            , img
            ]



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


quoteText : String
quoteText =
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"― Martin Fowler"


quoteElement : Model -> Element Msg
quoteElement model =
    Element.el [] (text quoteText)
