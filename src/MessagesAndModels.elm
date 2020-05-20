module MessagesAndModels exposing (..)


type alias Model =
    { contactDropdown : OpenOrClosed
    , selectedPage : Page
    }


type Page
    = Home
    | AboutMe


type Msg
    = Update Model
    | CopyToClipboard String


type OpenOrClosed
    = Open
    | Closed
