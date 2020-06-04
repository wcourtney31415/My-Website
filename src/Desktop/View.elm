module Desktop.View exposing (desktopView)

import Data exposing (..)
import Desktop.About exposing (..)
import Desktop.Index exposing (..)
import Desktop.Navbar exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (..)


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
