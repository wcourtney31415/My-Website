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
        ( Element
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
    <|
        makeParagraphs
            [ aboutMeRawText4
            , aboutMeRawText1
            , aboutMeRawText2
            , aboutMeRawText3
            ]


makeParagraphs : List String -> List (Element msg)
makeParagraphs lst =
    let
        indAmt : Int
        indAmt =
            3

        toParagraph : String -> Element msg
        toParagraph str =
            paragraph
                [ Font.size 50
                , spacing 30
                ]
            <|
                [ text (indent indAmt ++ str) ]
    in
    List.map toParagraph lst
