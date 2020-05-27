module MessagesAndModels exposing (..)

import Element exposing (..)


type alias Model =
    { windowWidth : Int
    , windowHeight : Int
    , device : Device
    , responsive : Bool
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
