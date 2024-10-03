module Desktop.Index exposing (homepage)

import BasicColors exposing (white)
import Data exposing (facePath, myName)
import Desktop.Colors exposing (grayFortyTwo)
import Element
    exposing
        ( Element
        , alignTop
        , alpha
        , centerX
        , centerY
        , column
        , el
        , fill
        , height
        , maximum
        , padding
        , paddingXY
        , paragraph
        , px
        , rgb255
        , spacing
        , text
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Fonts exposing (fontDesktopHeader)
import HelperFunctions exposing (bkgAttributes, textElement)
import MessagesAndModels exposing (Msg)


homepage : Element Msg
homepage =
    column
        [ centerX
        , centerY
        , paddingXY 35 55
        ]
        [ titleBox, frontPageParagraph ]


titleBox : Element Msg
titleBox =
    column
        [ centerX
        , centerY
        , padding 10
        , Font.color white
        , fontDesktopHeader
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
            "Software Developer"
        , el
            [ Font.size 20
            , centerX
            ]
            (text myName)
        ]


grey : Int -> Element.Color
grey y =
    rgb255 y y y


frontPageParagraph : Element Msg
frontPageParagraph =
    Element.row
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width
            (fill
                |> maximum 1000
            )
        , bkgAttributes
            [ Background.color <| grey 10
            , alpha 0.6
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 10
                }
            ]
        , spacing 40
        ]
        [ imageOfMe
        , Element.column
            [ width fill
            , spacing 20
            , Font.size 18
            ]
          <|
            List.map
                (\x ->
                    paragraph
                        []
                        [ text x
                        ]
                )
                [ "Welcome to my site! My name is Wes Courtney, and I am a software developer. Coding is my passion and I have been doing it for 19 years."
                , "My career in software development began with video game design when I was in 5th grade."
                , "Over the years I found that my gratification wasn't exclusive to game design but was instead the product of coding itself. This broadened my horizon, and opened me up to new languages and paradigms."
                , "Today I code in my professional endeavors, and also as a hobby, and  aspire to make a full time career of it."
                , "For career related inquiries, contact me at wcourtney31415@gmail.com"
                ]
        ]


imageOfMe : Element msg
imageOfMe =
    let
        size =
            250
    in
    Element.column
        [ padding 12
        , alignTop
        , Border.rounded 1000
        , Background.color <| rgb255 165 169 172
        , Border.shadow
            { size = 1
            , blur = 10
            , offset = ( 4, 2 )
            , color = rgb255 0 0 0
            }
        ]
        [ Element.image
            [ width <| px size
            , height <| px size
            ]
            { src = facePath
            , description = "An image of Wes Courtney"
            }
        ]
