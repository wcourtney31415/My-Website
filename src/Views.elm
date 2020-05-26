module Views exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
import Comp_NavBar exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Fonts exposing (..)
import Html exposing (Html)
import MessagesAndModels exposing (..)
import Page_About exposing (..)
import Page_Index exposing (..)
import View_Desktop exposing (..)
import View_Phone exposing (..)
import View_Tablet exposing (..)


classString : Device -> String
classString device =
    case device.class of
        Phone ->
            "Phone"

        Tablet ->
            "Tablet"

        Desktop ->
            "Desktop"

        BigDesktop ->
            "Big Desktop"


windowResElement : Model -> Element Msg
windowResElement model =
    let
        device =
            model.device

        orientationString =
            case device.orientation of
                Portrait ->
                    "Portrait"

                Landscape ->
                    "Landscape"
    in
    Element.column
        [ centerX
        , centerY
        , Font.size 60
        ]
        [ text <| "Width: " ++ String.fromInt model.windowWidth
        , text <| " Height: " ++ String.fromInt model.windowHeight
        , text <| " Class: " ++ classString device
        , text <| "Orientation: " ++ orientationString
        ]


siteView : Model -> Html Msg
siteView model =
    let
        deviceClass =
            model.device.class

        responsiveView =
            case deviceClass of
                Phone ->
                    phoneView model

                Tablet ->
                    tabletView model

                Desktop ->
                    desktopView model

                BigDesktop ->
                    desktopView model

        myView =
            if model.responsive then
                responsiveView

            else
                defaultView

        defaultView =
            desktopView model
    in
    myView
