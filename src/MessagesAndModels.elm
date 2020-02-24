module MessagesAndModels exposing (..)


type alias Model =
    { selectedPage : Page
    , header : HsvRecord
    , footer : HsvRecord
    , quoteBlock1 : HsvRecord
    , quoteBlock2 : HsvRecord
    , inlineTitleBar : HsvRecord
    }


type alias HsvRecord =
    { hue : Int
    , saturation : Float
    , value : Float
    }


type Colors
    = Header
    | QuoteBlock1
    | QuoteBlock2
    | InlineTitleBar
    | Footer


type ColorProperty
    = Hue
    | Saturation
    | Value


type Page
    = LanguagePreferences
    | MyStory
    | HireMe
    | ColorSelection
    | Welcome


type Msg
    = NavBarButtonClicked Model
    | AttemptedTextBoxChange
    | SliderMoved Model
    | NewSliderMoved HsvRecord Colors
