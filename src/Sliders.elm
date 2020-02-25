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
                    (text <| "Hue: " ++ String.fromInt currentColorRecord.hue)
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
                    (text <| "Saturation: " ++ String.fromFloat currentColorRecord.saturation)
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
                    (text <| "Value: " ++ String.fromFloat currentColorRecord.value)
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
    Element.row [ width fill ]
        [ Element.el
            [ height fill
            , width
                (fill
                    |> maximum 100
                    |> minimum 100
                )
            , Background.color <| hsvRecordToColor currentColorRecord
            ]
            (text "")
        , Element.column
            [ width fill
            , spacing 10
            , Border.roundEach { topRight = 15, bottomRight = 5, topLeft = 0, bottomLeft = 0 }
            , paddingEach { top = 10, left = 0, right = 0, bottom = 0 }
            , Background.color <| hsv 1 0 0.9
            ]
            [ Element.el
                [ Font.bold
                , centerX
                ]
                (text label)
            , Element.row
                [ width fill
                , spacing 20
                , Background.color <| hsv 1 0 0.95
                , padding 6
                , Border.roundEach { topRight = 0, bottomRight = 5, topLeft = 0, bottomLeft = 0 }
                ]
                [ dynamicSlider colorToUpdate currentColorRecord Hue
                , dynamicSlider colorToUpdate currentColorRecord Saturation
                , dynamicSlider colorToUpdate currentColorRecord Value
                ]
            ]
        ]
