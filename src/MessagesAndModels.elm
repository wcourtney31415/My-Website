module MessagesAndModels exposing (Flags, Model, Msg(..), OpenOrClosed(..), Page(..))

import Element exposing (Device)


type alias Model =
    { windowWidth : Int
    , windowHeight : Int
    , device : Device
    , responsive : Bool
    , contactDropdown : OpenOrClosed
    , selectedPage : Page
    }



-- "responsive" field : In the event that the implimentation used to aquire the
-- screen width and height was to fail due to updates from the browser or the
-- feature itself, this responsive field can be toggled off to temporarily
-- disable the responsiveness of the site.


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
    { windowWidth : Int
    , windowHeight : Int
    }
