module Main exposing (..)

import Browser
import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import GlobalUIComponents exposing (..)
import HsvToRgb exposing (..)
import Html
import MessagesAndModels exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)
import Sliders exposing (..)
import WebsiteController exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { selectedPage = ColorSelection
    , colorList = colorList
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NavBarButtonClicked myModel ->
            myModel

        AttemptedTextBoxChange ->
            model

        SliderMoved hsvRecord colorToBeUpdated ->
            handleSliderMovement model hsvRecord colorToBeUpdated


view : Model -> Html.Html Msg
view model =
    website model
