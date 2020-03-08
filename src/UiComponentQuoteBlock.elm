module UiComponentQuoteBlock exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)


quoteBlock : Model -> Element Msg
quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps =
                [ hsvRecordToColor model.colorList.quoteBlock1
                , hsvRecordToColor model.colorList.quoteBlock2
                ]
            }
        , padding 65
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        ]
        [ quoteElement model
        ]


quoteText : String
quoteText =
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"― Martin Fowler"


quoteElement : Model -> Element Msg
quoteElement model =
    Element.el [] (text quoteText)
