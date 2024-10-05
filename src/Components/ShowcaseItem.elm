module Components.ShowcaseItem exposing (showcaseItem)

import BasicColors exposing (shadowColor, white)
import Color as C
import Data
    exposing
        ( gitHub
        , myEmail
        , portfolioSiteImagePath
        )
import Desktop.Colors
    exposing
        ( dropNavColor
        , grayFortyTwo
        )
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions
    exposing
        ( bkgAttributes
        , flip
        , speedIf
        )
import MessagesAndModels
    exposing
        ( Model
        , Msg(..)
        , OpenOrClosed(..)
        , Page(..)
        )


myImage : Element msg
myImage =
    Element.image
        [ width fill
        , height <| px 124
        ]
        { src = portfolioSiteImagePath
        , description = "An image of Wes Courtney"
        }


showcaseItem : Element msg
showcaseItem =
    Element.column
        [ Background.color <| rgb255 50 50 50
        , padding 10
        , spacing 20
        , width <| px 300
        , Border.roundEach
            { topLeft = 0
            , topRight = 10
            , bottomLeft = 10
            , bottomRight = 0
            }
        , Border.shadow
            { blur = 5
            , color = rgb255 0 0 0
            , offset = ( 4, 2 )
            , size = 1
            }
        ]
    <|
        [ myImage
        , title
        , buttons
        ]


buttons : Element msg
buttons =
    Element.row
        [ spaceEvenly
        , width fill
        , paddingXY 20 0
        ]
        [ makeButton {name = "Source", message = Nothing}
        , makeButton {name = "Live", message = Nothing}
        ]

makeButton a = Input.button
            [ Background.color <| rgb255 20 20 20
            , paddingXY 10 5
            , Font.color <| rgb255 255 255 255
            , Border.rounded 5
            ]
            { label = Element.el [] <| text a.name
            , onPress = a.message
            }

title : Element msg
title =
    Element.el
        [ centerX
        , Font.bold
        , Font.color <| rgb255 255 255 255
        ]
    <|
        text "Portfolio Website"
