module Phone.LanguagesComp exposing (..)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import Phone.Colors exposing (..)
import Phone.ContentComp exposing (..)
import Phone.TitleContentComp exposing (..)


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
    titleContentComp
        { headerClr = red
        , contentClr = blue
        , title = "Declarative"
        , titleAttr =
            [ Font.color white
            , Background.color darkerBlue
            ]
        , contentAttr =
            [ Font.color black
            , Background.color lighterBlue
            ]
        , contents = [ langColumn ]
        }


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
