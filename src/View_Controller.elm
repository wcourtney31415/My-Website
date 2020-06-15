module View_Controller exposing (siteView)

import Desktop.View exposing (desktopView)
import Element exposing (DeviceClass(..))
import Html exposing (Html)
import MessagesAndModels exposing (Model, Msg)
import Phone.View exposing (phoneView)
import Tablet.View exposing (tabletView)


siteView : Model -> Html Msg
siteView model =
    let
        deviceClass =
            model.device.class

        responsiveView =
            case deviceClass of
                Phone ->
                    phoneView

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
