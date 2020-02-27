module LanguagePage exposing (..)

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


pageLanguagePreferences : Model -> Element Msg
pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Language Preferences"
        , rightBlock model (elmLogo []) (elmLangPrefElement model)
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) (elmLangPrefElement model)
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]
