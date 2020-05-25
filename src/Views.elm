module Views exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
import Comp_NavBar exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Fonts exposing (..)
import MessagesAndModels exposing (..)
import Page_About exposing (..)
import Page_Index exposing (..)


windowResElement : Model -> Element Msg
windowResElement model =
    let
        device =
            model.device

        classString =
            case device.class of
                Phone ->
                    "Phone"

                Tablet ->
                    "Tablet"

                Desktop ->
                    "Desktop"

                BigDesktop ->
                    "Big Desktop"

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
        , text <| " Class: " ++ classString
        , text <| "Orientation: " ++ orientationString
        ]


desktopView model =
    let
        myFocusStyle : FocusStyle
        myFocusStyle =
            { borderColor = Nothing
            , backgroundColor = Nothing
            , shadow = Nothing
            }

        selectedPage =
            case model.selectedPage of
                Home ->
                    homepage model

                AboutMe ->
                    aboutPage model
    in
    Element.layoutWith
        { options = [ focusStyle myFocusStyle ] }
        [ Background.image backgroundPath

        --, customFont
        ]
    <|
        Element.column
            [ width fill
            , height fill
            , spacing 40
            ]
            [ navBar model
            , selectedPage
            , windowResElement model
            ]


tabletView model =
    Element.layout [] (text "Tablet view!")


phoneView model =
    Element.layout [] (text "Phone view!")


siteView model =
    let
        deviceClass =
            model.device.class
    in
    case deviceClass of
        Phone ->
            phoneView model

        Tablet ->
            tabletView model

        Desktop ->
            desktopView model

        BigDesktop ->
            desktopView model
