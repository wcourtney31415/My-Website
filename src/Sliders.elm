module Sliders exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HsvToRgb exposing (..)
import Html
import MessagesAndModels exposing (..)


hsvRecordToColor : HsvRecord -> Color
hsvRecordToColor hsvRecord =
    hsv
        hsvRecord.hue
        hsvRecord.saturation
        hsvRecord.value


lightGrey =
    hsv 1 0 0.92



-----------------------------------------------------------------


chooseRecord colorToUpdate currentColorRecord propertyToUpdate =
    case propertyToUpdate of
        Hue ->
            { onChange = \new -> NewSliderMoved { currentColorRecord | hue = round new } colorToUpdate
            , label =
                Input.labelAbove []
                    (text "Hue: ")
            , min = 0
            , max = 359
            , step = Just 1
            , value = toFloat currentColorRecord.hue
            , thumb =
                Input.defaultThumb
            }

        Saturation ->
            { onChange = \new -> NewSliderMoved { currentColorRecord | saturation = new } colorToUpdate
            , label =
                Input.labelAbove []
                    (text "Saturation: ")
            , min = 0
            , max = 1
            , step = Just 0.01
            , value = currentColorRecord.saturation
            , thumb =
                Input.defaultThumb
            }

        Value ->
            { onChange = \new -> NewSliderMoved { currentColorRecord | value = new } colorToUpdate
            , label =
                Input.labelAbove []
                    (text "Value: ")
            , min = 0
            , max = 1
            , step = Just 0.01
            , value = currentColorRecord.value
            , thumb =
                Input.defaultThumb
            }


dynamicSlider : Colors -> HsvRecord -> ColorProperty -> Element Msg
dynamicSlider colorToUpdate currentColorRecord propertyToUpdate =
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor currentColorRecord
                , Border.rounded 2
                ]
                Element.none
            )
        ]
    <|
        chooseRecord colorToUpdate currentColorRecord propertyToUpdate



-----------------------------------------------------------------


dynamicSliders : String -> Colors -> HsvRecord -> Element Msg
dynamicSliders label colorToUpdate currentColorRecord =
    Element.column
        [ width fill
        , spacing 10
        , Border.rounded 2
        , Background.color lightGrey
        , padding 10
        ]
        [ Element.el
            [ Font.bold
            , centerX
            ]
            (text label)
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ dynamicSlider colorToUpdate currentColorRecord Hue
            , dynamicSlider colorToUpdate currentColorRecord Saturation
            , dynamicSlider colorToUpdate currentColorRecord Value
            ]
        ]
