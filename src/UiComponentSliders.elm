module UiComponentSliders exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)


handleSliderMovement : Model -> HsvRecord -> Colors -> Model
handleSliderMovement model hsvRecord colorToBeUpdated =
    let
        colorList =
            model.colorList
    in
    case colorToBeUpdated of
        Header ->
            { model | colorList = { colorList | header = hsvRecord } }

        QuoteBlock1 ->
            { model | colorList = { colorList | quoteBlock1 = hsvRecord } }

        QuoteBlock2 ->
            { model | colorList = { colorList | quoteBlock2 = hsvRecord } }

        InlineTitleBar ->
            { model | colorList = { colorList | inlineTitleBar = hsvRecord } }

        Footer ->
            { model | colorList = { colorList | footer = hsvRecord } }

        LeftBlock ->
            { model | colorList = { colorList | leftBlock = hsvRecord } }

        RightBlock ->
            { model | colorList = { colorList | rightBlock = hsvRecord } }

        FontA ->
            { model | colorList = { colorList | fontA = hsvRecord } }

        FontB ->
            { model | colorList = { colorList | fontB = hsvRecord } }


chooseRecord colorToUpdate currentColorRecord propertyToUpdate =
    case propertyToUpdate of
        Hue ->
            { onChange = \new -> SliderMoved { currentColorRecord | hue = round new } colorToUpdate
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
            { onChange = \new -> SliderMoved { currentColorRecord | saturation = new } colorToUpdate
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
            { onChange = \new -> SliderMoved { currentColorRecord | value = new } colorToUpdate
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
            , Background.color <| dynamicSliderHeader
            ]
            [ Element.el
                [ Font.bold
                , centerX
                ]
                (text label)
            , Element.row
                [ width fill
                , spacing 20
                , Background.color <| dynamicSliderBody
                , padding 6
                , Border.roundEach { topRight = 0, bottomRight = 5, topLeft = 0, bottomLeft = 0 }
                ]
                [ dynamicSlider colorToUpdate currentColorRecord Hue
                , dynamicSlider colorToUpdate currentColorRecord Saturation
                , dynamicSlider colorToUpdate currentColorRecord Value
                ]
            ]
        ]