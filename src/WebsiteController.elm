module WebsiteController exposing (..)

import Browser
import ColorSelectionPage exposing (..)
import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import GlobalUIComponents exposing (..)
import HireMePage exposing (..)
import Html
import LanguagePage exposing (..)
import MessagesAndModels exposing (..)
import MyStoryPage exposing (..)
import WelcomePage exposing (..)


website : Model -> Html.Html Msg
website model =
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
            [ header model
            , selectedPage model
            , footer model
            ]


selectedPage : Model -> Element Msg
selectedPage model =
    case model.selectedPage of
        LanguagePreferences ->
            pageLanguagePreferences model

        MyStory ->
            pageMyStory model

        HireMe ->
            pageHireMe model

        ColorSelection ->
            pageColorSelection model

        Welcome ->
            pageWelcome model
