module Ui_Footer exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceTexts exposing (..)


footer : Model -> Element Msg
footer model =
    Element.column
        [ Background.color <|
            hsvRecordToColor model.colorList.footer
        , spacing 5
        , paddingXY 25 40
        , width fill
        , centerX
        , Font.size 20
        , Font.color white
        , Font.shadow
            { offset = ( 3, 3 )
            , blur = 20
            , color = black
            }
        ]
    <|
        [ Element.el [ centerX ] (text "For additional contact info, and qualifications")
        , Element.el [ centerX ] (text <| "Email me at: " ++ emailAddress)
        ]
