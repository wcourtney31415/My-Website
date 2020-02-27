module MyStoryPage exposing (..)

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


pageMyStory : Model -> Element Msg
pageMyStory model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Story"
        , myStoryTextBody
        ]
