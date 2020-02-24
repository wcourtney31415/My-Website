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


headerHueSlider model =
    let
        myColor =
            model.header
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | hue = round new }
                in
                SliderMoved { model | header = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Hue: " ++ String.fromInt myColor.hue)
        , min = 0
        , max = 359
        , step = Just 1
        , value = toFloat model.header.hue
        , thumb =
            Input.defaultThumb
        }


headerSaturationSlider model =
    let
        myColor =
            model.header
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | saturation = new }
                in
                SliderMoved { model | header = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Saturation: " ++ String.fromFloat myColor.saturation)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.header.saturation
        , thumb =
            Input.defaultThumb
        }


headerValueSlider model =
    let
        myColor =
            model.header
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | value = new }
                in
                SliderMoved { model | header = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Value: " ++ String.fromFloat myColor.value)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.header.value
        , thumb =
            Input.defaultThumb
        }


headerSliders model =
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
            (text "Header")
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ headerHueSlider model
            , headerSaturationSlider model
            , headerValueSlider model
            ]
        ]


quoteBlock1HueSlider model =
    let
        myColor =
            model.quoteBlock1
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | hue = round new }
                in
                SliderMoved { model | quoteBlock1 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Hue: " ++ String.fromInt myColor.hue)
        , min = 0
        , max = 359
        , step = Just 1
        , value = toFloat model.quoteBlock1.hue
        , thumb =
            Input.defaultThumb
        }


quoteBlock1SaturationSlider model =
    let
        myColor =
            model.quoteBlock1
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | saturation = new }
                in
                SliderMoved { model | quoteBlock1 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Saturation: " ++ String.fromFloat myColor.saturation)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.quoteBlock1.saturation
        , thumb =
            Input.defaultThumb
        }


quoteBlock1ValueSlider model =
    let
        myColor =
            model.quoteBlock1
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | value = new }
                in
                SliderMoved { model | quoteBlock1 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Value: " ++ String.fromFloat myColor.value)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.quoteBlock1.value
        , thumb =
            Input.defaultThumb
        }


quoteBlock1Sliders model =
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
            (text "quoteBlock1")
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ quoteBlock1HueSlider model
            , quoteBlock1SaturationSlider model
            , quoteBlock1ValueSlider model
            ]
        ]


quoteBlock2HueSlider model =
    let
        myColor =
            model.quoteBlock2
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | hue = round new }
                in
                SliderMoved { model | quoteBlock2 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Hue: " ++ String.fromInt myColor.hue)
        , min = 0
        , max = 359
        , step = Just 1
        , value = toFloat model.quoteBlock2.hue
        , thumb =
            Input.defaultThumb
        }


quoteBlock2SaturationSlider model =
    let
        myColor =
            model.quoteBlock2
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | saturation = new }
                in
                SliderMoved { model | quoteBlock2 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Saturation: " ++ String.fromFloat myColor.saturation)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.quoteBlock2.saturation
        , thumb =
            Input.defaultThumb
        }


quoteBlock2ValueSlider model =
    let
        myColor =
            model.quoteBlock2
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | value = new }
                in
                SliderMoved { model | quoteBlock2 = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Value: " ++ String.fromFloat myColor.value)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.quoteBlock2.value
        , thumb =
            Input.defaultThumb
        }


quoteBlock2Sliders model =
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
            (text "quoteBlock2")
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ quoteBlock2HueSlider model
            , quoteBlock2SaturationSlider model
            , quoteBlock2ValueSlider model
            ]
        ]


footerHueSlider model =
    let
        myColor =
            model.footer
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | hue = round new }
                in
                SliderMoved { model | footer = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Hue: " ++ String.fromInt myColor.hue)
        , min = 0
        , max = 359
        , step = Just 1
        , value = toFloat model.footer.hue
        , thumb =
            Input.defaultThumb
        }


footerSaturationSlider model =
    let
        myColor =
            model.footer
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | saturation = new }
                in
                SliderMoved { model | footer = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Saturation: " ++ String.fromFloat myColor.saturation)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.footer.saturation
        , thumb =
            Input.defaultThumb
        }


footerValueSlider model =
    let
        myColor =
            model.footer
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | value = new }
                in
                SliderMoved { model | footer = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Value: " ++ String.fromFloat myColor.value)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.footer.value
        , thumb =
            Input.defaultThumb
        }


footerSliders model =
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
            (text "footer")
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ footerHueSlider model
            , footerSaturationSlider model
            , footerValueSlider model
            ]
        ]


inlineTitleBarHueSlider model =
    let
        myColor =
            model.inlineTitleBar
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | hue = round new }
                in
                SliderMoved { model | inlineTitleBar = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Hue: " ++ String.fromInt myColor.hue)
        , min = 0
        , max = 359
        , step = Just 1
        , value = toFloat model.inlineTitleBar.hue
        , thumb =
            Input.defaultThumb
        }


inlineTitleBarSaturationSlider model =
    let
        myColor =
            model.inlineTitleBar
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | saturation = new }
                in
                SliderMoved { model | inlineTitleBar = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Saturation: " ++ String.fromFloat myColor.saturation)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.inlineTitleBar.saturation
        , thumb =
            Input.defaultThumb
        }


inlineTitleBarValueSlider model =
    let
        myColor =
            model.inlineTitleBar
    in
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color <| hsvRecordToColor myColor
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange =
            \new ->
                let
                    updatedColor =
                        { myColor | value = new }
                in
                SliderMoved { model | inlineTitleBar = updatedColor }
        , label =
            Input.labelAbove []
                (text <| "Value: " ++ String.fromFloat myColor.value)
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = model.inlineTitleBar.value
        , thumb =
            Input.defaultThumb
        }


inlineTitleBarSliders model =
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
            (text "inlineTitleBar")
        , Element.row
            [ width fill
            , spacing 20
            ]
            [ inlineTitleBarHueSlider model
            , inlineTitleBarSaturationSlider model
            , inlineTitleBarValueSlider model
            ]
        ]
