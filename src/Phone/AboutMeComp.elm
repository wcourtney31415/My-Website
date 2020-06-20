module Phone.AboutMeComp exposing (aboutMeComp)

import Data
    exposing
        ( aboutMeRawText1
        , aboutMeRawText2
        , aboutMeRawText3
        , aboutMeRawText4
        , indent
        )
import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , paddingEach
        , paragraph
        , spacing
        , text
        , textColumn
        )
import Element.Font as Font


aboutMeComp : Element msg
aboutMeComp =
    textColumn
        [ spacing 40
        , paddingEach
            { top = 20, bottom = 0, left = 0, right = 0 }
        , centerX
        ]
        [ aboutMeParagraph4
        , aboutMeParagraph1
        , aboutMeParagraph2
        , aboutMeParagraph3
        ]


indAmt : Int
indAmt =
    3


paragraphAttr : List (Attribute msg)
paragraphAttr =
    [ Font.size 50
    , spacing 30
    ]


aboutMeParagraph1 : Element msg
aboutMeParagraph1 =
    paragraph
        paragraphAttr
        [ text <| indent indAmt ++ aboutMeRawText1
        ]


aboutMeParagraph2 : Element msg
aboutMeParagraph2 =
    paragraph
        paragraphAttr
        [ text <| indent indAmt ++ aboutMeRawText2
        ]


aboutMeParagraph3 : Element msg
aboutMeParagraph3 =
    paragraph
        paragraphAttr
        [ text <| indent indAmt ++ aboutMeRawText3
        ]


aboutMeParagraph4 : Element msg
aboutMeParagraph4 =
    paragraph
        paragraphAttr
        [ text <| indent indAmt ++ aboutMeRawText4
        ]
