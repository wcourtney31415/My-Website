module Phone.LanguagesComp exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)


languagesComp =
    Element.column
        [ spacing 35
        ]
        [ Element.paragraph
            [ Font.size 50
            ]
            [ text "A list of lanuages I have experience with." ]
        , textElement
            [ centerX
            , Font.size 60
            , Font.bold
            ]
            "Declarative"
        , Element.column
            [ centerX
            , spacing 35
            ]
            [ textElement
                [ Font.size 50
                ]
                "Haskell"
            , textElement
                [ Font.size 50
                ]
                "Elm"
            ]
        , textElement [ centerX, Font.size 60, Font.bold ] "Imperative"
        , Element.column
            [ centerX
            , spacing 35
            ]
            [ textElement [ Font.size 50 ] "Java"
            , textElement [ Font.size 50 ] "C#"
            , textElement [ Font.size 50 ] "C++"
            , textElement [ Font.size 50 ] "Python"
            , textElement [ Font.size 50 ] "Typescript"
            ]
        ]
