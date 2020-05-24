module MessagesAndModels exposing (..)

import Browser
import Browser.Events as Events
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font


type alias Model =
    { windowWidth : Int
    , windowHeight : Int
    , device : Device
    , contactDropdown : OpenOrClosed
    , selectedPage : Page
    }


type Page
    = Home
    | AboutMe


type Msg
    = Update Model
    | CopyToClipboard String
    | GotNewResolution Int Int


type OpenOrClosed
    = Open
    | Closed


type alias Flags =
    { windowWidth : Int, windowHeight : Int }
