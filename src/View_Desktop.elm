module View_Desktop exposing (..)

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


desktopView : Model -> Html.Html Msg
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

            --, windowResElement model
            ]
