module Desktop.About exposing (aboutPage)

import BasicColors exposing (white)
import Data
    exposing
        ( aboutMeRawText1
        , aboutMeRawText2
        , aboutMeRawText3
        , aboutMeRawText4
        , indent
        )
import Desktop.Colors exposing (grayFortyTwo)
import Element
    exposing
        ( Attribute
        , Element
        , alpha
        , centerX
        , centerY
        , column
        , fill
        , moveUp
        , padding
        , paragraph
        , px
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


aboutPage : Element Msg
aboutPage =
    homepageItems


homepageItems : Element Msg
homepageItems =
    column
        [ centerX
        , centerY
        , moveUp 100
        ]
        [ titleBox
        , frontPageParagraph
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


frontPageParagraph : Element Msg
frontPageParagraph =
    textColumn
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width <| px 1050
        , spacing 30
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.6
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 10
                }
            ]
        ]
        [ aboutMeParagraph4
        , aboutMeParagraph1
        , aboutMeParagraph2
        , aboutMeParagraph3
        ]


indAmt : Int
indAmt =
    5


paragraphAttr : List (Attribute msg)
paragraphAttr =
    []


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
