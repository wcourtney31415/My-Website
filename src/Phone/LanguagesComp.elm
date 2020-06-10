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
        , paddingEach { top = 0, bottom = 0, left = 50, right = 50 }
        ]
        [ Element.paragraph
            [ Font.size 50
            ]
            [ text "A list of lanuages I have experience with." ]
        , declarative []
        , imperative []
        ]


paradigmBlock : List (Attribute msg) -> String -> List ( String, String ) -> Element msg
paradigmBlock attr title languages =
    let
        myAttr =
            [ width fill ] ++ attr

        strToElem : ( String, String ) -> Element msg
        strToElem ( label, url ) =
            newTabLink
                [ Font.size 50
                , Font.bold
                , Background.gradient
                    { angle = 0
                    , steps =
                        [ rgb255 228 228 228
                        , grayThirtyFour
                        ]
                    }
                , height <| px 150
                , width fill
                ]
                { url = url
                , label = textElement [ centerX ] label
                }

        langColumn =
            Element.column
                [ centerX

                -- , spacing 35
                , width fill
                ]
            <|
                List.map
                    strToElem
                    languages
    in
    titleContentComp
        myAttr
        { title = title
        , titleAttr =
            [ Font.color white
            , Background.color lighterBlue
            ]
        , contentAttr =
            [ Font.color darkerBlue
            , Background.color lighterGray
            , padding 0
            ]
        , contents = [ langColumn ]
        }


declarative attr =
    paradigmBlock attr
        "Declarative"
        [ ( "Haskell"
          , "https://www.haskell.org/"
          )
        , ( "Elm"
          , "https://elm-lang.org/"
          )
        ]


imperative attr =
    paradigmBlock attr
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
