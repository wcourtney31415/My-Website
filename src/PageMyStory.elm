module PageMyStory exposing (..)

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
import UiComponentGlobal exposing (..)


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
