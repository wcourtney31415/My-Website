module Tablet.About exposing (aboutPage)

import BasicColors exposing (white)
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
        , alpha
        , centerX
        , centerY
        , column
        , fill
        , padding
        , paddingXY
        , paragraph
        , spacing
        , text
        , textColumn
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (bkgAttributes, textElement)
import MessagesAndModels exposing (Msg)
import Tablet.Colors exposing (grayFortyTwo)


aboutPage : Element Msg
aboutPage =
    column
        [ centerX
        , centerY
        , width fill
        , paddingXY 35 55
        ]
        [ titleBox
        , aboutMeText
        ]


titleBox : Element Msg
titleBox =
    column
        [ centerX
        , centerY
        , padding 10
        , Font.color white
        , spacing 10
        , Font.bold
        , width fill
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.75
            , Border.roundEach
                { topLeft = 10
                , topRight = 10
                , bottomLeft = 0
                , bottomRight = 0
                }
            ]
        ]
        [ textElement
            [ Font.size 40
            , centerX
            ]
            "About Me"
        ]


aboutMeText : Element Msg
aboutMeText =
    textColumn
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width fill
        , spacing 30
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.8
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 10
                }
            ]
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
        toParagraph : String -> Element msg
        toParagraph str =
            paragraph
                []
            <|
                [ Element.el
                    [ Font.size 35
                    ]
                  <|
                    text <|
                        indent 5
                            ++ str
                ]
    in
    List.map toParagraph lst
