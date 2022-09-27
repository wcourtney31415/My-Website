module Tablet.Index exposing (homepage)

import BasicColors exposing (white)
import Color as C
import Data exposing (facePath, myEmail, myName)
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
        , link
        , maximum
        , padding
        , paddingXY
        , paragraph
        , rgb255
        , row
        , shrink
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


homepage : Element Msg
homepage =
    homepageItems


homepageItems : Element Msg
homepageItems =
    column
        [ centerX
        , centerY
        ]
        [ titleBox, frontPageParagraph ]


titleBox : Element Msg
titleBox =
    row
        [ centerX
        , centerY
        , padding 25
        , Font.color white
        , spacing 20
        , Font.bold
        , width fill
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.75
            , Border.roundEach
                { topLeft = 20
                , topRight = 20
                , bottomLeft = 0
                , bottomRight = 0
                }
            ]
        ]
        [ imageOfMe
        , column
            [ spacing 10 ]
            [ textElement
                [ Font.size 50
                , centerX
                ]
                "Software Developer"
            , el
                [ Font.size 40
                , centerX
                ]
                (text myName)
            ]
        ]


imageOfMe =
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
            []
            { src = facePath
            , description = "An image of Wes Courtney"
            }
        ]


frontPageParagraph : Element Msg
frontPageParagraph =
    let
        preLink =
            "For professional inqueries, please contact me at "

        postLink =
            " and I will get back to you as soon as possible. I look forward to speaking with you."

        emailLink =
            link
                [ Font.size 30
                , Font.bold
                ]
                { url = "mailto:" ++ myEmail
                , label = text myEmail
                }
    in
    textColumn
        [ width (fill |> maximum 900)
        , Font.color white
        , padding 50
        , spacing 50
        , bkgAttributes
            [ Background.color grayFortyTwo
            , alpha 0.6
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 20
                , bottomRight = 20
                }
            ]
        ]
        [ Element.column
            [ width fill
            , spacing 20
            , Font.size 25
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
