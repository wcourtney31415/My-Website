module ModelAndMessages exposing (..)


type alias Model =
    { h : Int
    }


init : Model
init =
    { h = 0
    }


type Msg
    = SomethingHappened Model
