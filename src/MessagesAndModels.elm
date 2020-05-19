module MessagesAndModels exposing (..)


type alias Model =
    { contactDropdown : OpenOrClosed
    }


type Msg
    = Update Model


type OpenOrClosed
    = Open
    | Closed
