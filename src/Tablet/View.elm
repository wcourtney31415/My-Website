module Tablet.View exposing (tabletView)

import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (..)
import Tablet.About exposing (..)
import Tablet.Index exposing (..)
import Tablet.Navbar exposing (..)


tabletView : Model -> Html.Html Msg
tabletView model =
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
        ]
    <|
        Element.column
            [ width fill
            , height fill
            , spacing 40
            ]
            [ navBar model
            , selectedPage
            ]
