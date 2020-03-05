module PageHireMe exposing (..)

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


pageHireMe : Model -> Element Msg
pageHireMe model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Story"
        , imgAndTextBlock Left model (pictureOfMe []) (text firstParagraphText)
        , myStoryTextBody
        ]
