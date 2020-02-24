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
    = FavoriteColor


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
