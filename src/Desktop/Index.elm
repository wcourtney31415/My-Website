module Desktop.Index exposing (homepage)

import BasicColors exposing (white)
import Color as C
import Data exposing (facePath, myEmail, myName)
import Desktop.Colors exposing (black, grayFortyTwo)
import Element
    exposing
        ( Element
        , alpha
        , centerX
        , centerY
        , clip
        , column
        , el
        , fill
        , link
        , maximum
        , minimum
        , moveUp
        , padding
        , paddingXY
        , paragraph
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


frontPageParagraph : Element Msg
frontPageParagraph =
    let
        preLink =
            "For professional inqueries, please contact me at "

        postLink =
            " and I will get back to you as soon as possible. I look forward to speaking with you."
    in
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
        , spacing 40
        ]
        [ imageOfMe
        , Element.column
            [ width fill
            , spacing 20
            , Font.size 22
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

        -- [ text preLink
        -- , link []
        --     { url = "mailto:" ++ myEmail
        --     , label = text myEmail
        --     }
        -- , text postLink
        -- ]
        ]


imageOfMe =
    Element.column
        [ padding 12
        , moveUp 55
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
