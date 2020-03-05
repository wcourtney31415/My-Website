module PageLanguage exposing (..)

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


pageLanguagePreferences : Model -> Element Msg
pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , imgAndTextBlock Left model (pictureOfMe []) (text firstParagraphText)
        , inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Language Preferences"
        , imgAndTextBlock Right model (elmLogo []) (elmLangPrefElement model)
        , imgAndTextBlock Left model (javaLogo []) (text firstParagraphText)
        , imgAndTextBlock Right model (visualStudioLogo []) (elmLangPrefElement model)
        , imgAndTextBlock Left model (arduinoLogo []) (text firstParagraphText)
        ]
