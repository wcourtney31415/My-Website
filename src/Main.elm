module Main exposing (..)

import Browser
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import Ui_Sliders exposing (..)
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
    { selectedPage = Welcome
    , colorList = colorList
    , activeSlide = Slide1
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
