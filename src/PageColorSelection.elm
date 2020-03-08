module PageColorSelection exposing (..)

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
import UiComponentImgAndTextBlock exposing (..)
import UiComponentInlineTitleBar exposing (..)
import UiComponentQuoteBlock exposing (..)
import UiComponentSliders exposing (..)


pageColorSelection : Model -> Element Msg
pageColorSelection model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , sliderBlock model
        , imgAndTextBlock Left model (pictureOfMe []) (text firstParagraphText)
        , inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "Language Preferences"
        , imgAndTextBlock
            Right
            model
            (elmLogo [])
            (elmLangPrefElement model)
        , imgAndTextBlock Left model (javaLogo []) (text firstParagraphText)
        , imgAndTextBlock
            Right
            model
            (visualStudioLogo [])
            (elmLangPrefElement model)
        , imgAndTextBlock Left model (arduinoLogo []) (text firstParagraphText)
        ]


sliderBlock : Model -> Element Msg
sliderBlock model =
    Element.column
        [ width fill
        , centerX
        , width (fill |> maximum 1200)
        , padding 100
        , spacing 5
        ]
        [ dynamicSliders "Header " Header model.colorList.header
        , dynamicSliders "Quote Block 1 " QuoteBlock1 model.colorList.quoteBlock1
        , dynamicSliders "Quote Block 2 " QuoteBlock2 model.colorList.quoteBlock2
        , dynamicSliders "Inline Title Bar " InlineTitleBar model.colorList.inlineTitleBar
        , dynamicSliders "Footer " Footer model.colorList.footer
        , dynamicSliders "Left Block " LeftBlock model.colorList.leftBlock
        , dynamicSliders "Right Block" RightBlock model.colorList.rightBlock
        , dynamicSliders "Font A" FontA model.colorList.fontA
        , dynamicSliders "Font B" FontB model.colorList.fontB
        , paletteRecordTextBox model
        ]


paletteRecordString model =
    "Output record goes here."


paletteRecordTextBox : Model -> Element Msg
paletteRecordTextBox model =
    Input.text []
        { text = paletteRecordString model
        , label = Input.labelAbove [] (text "Color Record: ")
        , placeholder = Nothing
        , onChange = \new -> AttemptedTextBoxChange
        }
