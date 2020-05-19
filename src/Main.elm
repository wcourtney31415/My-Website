module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import MessagesAndModels exposing (..)
import Page_Index exposing (..)


main : Program () Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


init : () -> ( Model, Cmd Msg )
init _ =
    let
        initialModel : Model
        initialModel =
            { contactDropdown = Closed }
    in
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Update new ->
            ( new, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    let
        myFocusStyle : FocusStyle
        myFocusStyle =
            { borderColor = Nothing
            , backgroundColor = Nothing
            , shadow = Nothing
            }

        myView =
            Element.layoutWith
                { options = [ focusStyle myFocusStyle ] }
                [ Background.image "./Images/background.jpg"
                ]
            <|
                homepage model
    in
    { title = "Wesley Courtney"
    , body = [ myView ]
    }
