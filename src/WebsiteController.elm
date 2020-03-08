module WebsiteController exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Html
import MessagesAndModels exposing (..)
import PageColorSelection exposing (..)
import PageHireMe exposing (..)
import PageLanguage exposing (..)
import PageMyStory exposing (..)
import PageWelcome exposing (..)
import ResourceColors exposing (..)
import UiComponentFooter exposing (..)
import UiComponentHeader exposing (..)


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
