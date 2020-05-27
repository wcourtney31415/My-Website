module View_Controller exposing (siteView)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (..)
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
