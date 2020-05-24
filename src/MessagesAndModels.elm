module MessagesAndModels exposing (..)


type alias Model =
    { windowWidth : Int
    , windowHeight : Int
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
