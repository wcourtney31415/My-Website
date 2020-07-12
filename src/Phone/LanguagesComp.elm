module Phone.LanguagesComp exposing (languagesComp)

import BasicColors exposing (white)
import Color as C
import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , column
        , fill
        , height
        , newTabLink
        , padding
        , paddingEach
        , paragraph
        , px
        , spacing
        , text
        , width
        )
import Element.Background as Background
import Element.Font as Font
import HelperFunctions exposing (textElement)
import Phone.Colors
    exposing
        ( darkerBlue
        , gradientColor1
        , grayThirtyFour
        , lighterBlue
        , lighterGray
        )
import Phone.TitleContentComp exposing (titleContentComp)


languagesComp : Element msg
languagesComp =
    column
        [ spacing 50
        , paddingEach
            { top = 0
            , bottom = 50
            , left = 50
            , right = 50
            }
        ]
        [ paragraph
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
            width fill :: attr

        strToElem : ( String, String ) -> Element msg
        strToElem ( label, url ) =
            newTabLink
                [ Font.size 50
                , Font.bold
                , Background.gradient
                    { angle = 0
                    , steps =
                        [ gradientColor1
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
            column
                [ centerX
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


declarative : List (Attribute msg) -> Element msg
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


imperative : List (Attribute msg) -> Element msg
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
