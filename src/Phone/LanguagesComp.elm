module Phone.LanguagesComp exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)


languagesComp =
    Element.column []
        [ Element.paragraph
            [ Font.size 50 ]
            [ text "A list of lanuages I have experience with." ]
        , textElement [ centerX, Font.size 60 ] "Declarative"
        , textElement [ centerX, Font.size 60 ] "Imperative"
        ]
