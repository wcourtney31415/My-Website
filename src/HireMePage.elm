module HireMePage exposing (..)

import Browser
import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import GlobalUIComponents exposing (..)
import Html
import MessagesAndModels exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)


pageHireMe : Model -> Element Msg
pageHireMe model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Story"
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , myStoryTextBody
        ]
