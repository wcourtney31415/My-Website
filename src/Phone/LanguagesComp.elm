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
        , declarative
        , imperative
        ]


paradigmBlock : String -> List ( String, String ) -> Element msg
paradigmBlock title languages =
    let
        titleElem =
            textElement
                [ Font.size 60
                , Font.bold
                ]
                title

        strToElem : ( String, String ) -> Element msg
        strToElem ( label, url ) =
            newTabLink
                [ Font.size 50 ]
                { url = url
                , label = text label
                }

        langColumn =
            Element.column
                [ centerX
                , spacing 35
                ]
            <|
                List.map
                    strToElem
                    languages
    in
    Element.column [ centerX ]
        [ titleElem
        , langColumn
        ]


declarative =
    paradigmBlock
        "Declarative"
        [ ( "Haskell"
          , "https://www.haskell.org/"
          )
        , ( "Elm"
          , "https://elm-lang.org/"
          )
        ]


imperative =
    paradigmBlock
        "Imperative"
        [ ( "Java"
          , "https://docs.oracle.com/javase/8/docs/technotes/guides/language/index.html"
          )
        , ( "C#"
          , "https://docs.microsoft.com/en-us/dotnet/csharp/"
          )
        , ( "C++"
          , "https://www.cplusplus.com/"
          )
        , ( "Python"
          , "https://www.python.org/"
          )
        , ( "Typescript"
          , "https://www.typescriptlang.org/"
          )
        ]
