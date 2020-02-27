module MessagesAndModels exposing (..)


type Page
    = LanguagePreferences
    | MyStory
    | HireMe
    | ColorSelection
    | Welcome


type Colors
    = Header
    | QuoteBlock1
    | QuoteBlock2
    | InlineTitleBar
    | Footer
    | LeftBlock
    | RightBlock
    | FontA
    | FontB


type alias HsvRecord =
    { hue : Int
    , saturation : Float
    , value : Float
    }


type alias Model =
    { selectedPage : Page
    , colorList : ColorList
    }


type Msg
    = NavBarButtonClicked Model
    | AttemptedTextBoxChange
    | SliderMoved Model
    | NewSliderMoved HsvRecord Colors


type alias ColorList =
    { header : HsvRecord
    , footer : HsvRecord
    , quoteBlock1 : HsvRecord
    , quoteBlock2 : HsvRecord
    , inlineTitleBar : HsvRecord
    , leftBlock : HsvRecord
    , rightBlock : HsvRecord
    , fontA : HsvRecord
    , fontB : HsvRecord
    }
