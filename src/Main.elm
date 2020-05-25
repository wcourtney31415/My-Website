module Main exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
import Comp_NavBar exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Fonts exposing (..)
import MessagesAndModels exposing (..)
import Page_About exposing (..)
import Page_Index exposing (..)
import Responsive
import Views exposing (..)


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
