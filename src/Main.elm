module Main exposing (init, main, subscriptions, update, view)

import Browser
import Data exposing (myName)
import Element exposing (classifyDevice)
import MessagesAndModels
    exposing
        ( Flags
        , Model
        , Msg(..)
        , OpenOrClosed(..)
        , Page(..)
        )
import Ports.Clipboard exposing (copyToClipboard)
import Ports.Responsive as Responsive
import View_Controller exposing (siteView)


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
    Responsive.onResize (\w h -> GotNewResolution w h)


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
