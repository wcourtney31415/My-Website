module Main exposing (..)

import Browser
import Data exposing (..)
import Element exposing (..)
import MessagesAndModels exposing (..)
import Port_Clipboard exposing (..)
import Port_Responsive
import View_Controller exposing (..)


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , subscriptions = subscriptions
        , update = update
        , view = view
        }


subscriptions : Model -> Sub Msg
subscriptions _ =
    Port_Responsive.onResize (\w h -> GotNewResolution w h)


init : Flags -> ( Model, Cmd Msg )
init flags =
    let
        windowWidth =
            flags.windowWidth

        windowHeight =
            flags.windowHeight

        device =
            classifyDevice
                { width = windowWidth
                , height = windowHeight
                }

        initialModel : Model
        initialModel =
            { windowWidth = windowWidth
            , windowHeight = windowHeight
            , device = device
            , responsive = True
            , contactDropdown = Closed
            , selectedPage = Home
            }
    in
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Update new ->
            ( new, Cmd.none )

        CopyToClipboard str ->
            ( model, copyToClipboard str )

        GotNewResolution width height ->
            let
                device =
                    classifyDevice
                        { width = width
                        , height = height
                        }

                modifiedModel =
                    { model
                        | windowWidth = width
                        , windowHeight = height
                        , device = device
                    }
            in
            ( modifiedModel, Cmd.none )


view : Model -> Browser.Document Msg
view model =
    { title = myName
    , body = [ siteView model ]
    }
