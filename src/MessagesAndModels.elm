module MessagesAndModels exposing (..)


type alias Model =
    { contactDropdown : OpenOrClosed
    }


type Msg
    = Update Model
    | CopyToClipboard String


type OpenOrClosed
    = Open
    | Closed
