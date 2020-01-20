module Main exposing (..)

import Browser
import Html
import ModelAndMessages exposing (..)
import ViewComponents.Components exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


update : Msg -> Model -> Model
update msg model =
    case msg of
        SomethingHappened myModel ->
            myModel


view : Model -> Html.Html Msg
view model =
    mainContainer model
