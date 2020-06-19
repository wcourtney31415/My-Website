module Phone.AboutMeComp exposing (aboutMeComp)

import Data
    exposing
        ( aboutMeRawText1
        , aboutMeRawText2
        , aboutMeRawText3
        , aboutMeRawText4
        )
import Element
    exposing
        ( Element
        , paragraph
        , spacing
        , text
        , textColumn
        )
import Element.Font as Font


aboutMeComp : Element msg
aboutMeComp =
    textColumn []
        [ aboutMeParagraph1
        , aboutMeParagraph2
        , aboutMeParagraph3
        , aboutMeParagraph4
        ]


aboutMeParagraph1 : Element msg
aboutMeParagraph1 =
    paragraph
        [ Font.size 50
        , spacing 30
        ]
        [ text aboutMeRawText1
        ]


aboutMeParagraph2 : Element msg
aboutMeParagraph2 =
    paragraph
        [ Font.size 50
        , spacing 30
        ]
        [ text aboutMeRawText2
        ]


aboutMeParagraph3 : Element msg
aboutMeParagraph3 =
    paragraph
        [ Font.size 50
        , spacing 30
        ]
        [ text aboutMeRawText3
        ]


aboutMeParagraph4 : Element msg
aboutMeParagraph4 =
    paragraph
        [ Font.size 50
        , spacing 30
        ]
        [ text aboutMeRawText4
        ]
