module Tablet.View exposing (tabletView)

import Data exposing (backgroundPath)
import Element
    exposing
        ( FocusStyle
        , column
        , fill
        , focusStyle
        , height
        , inFront
        , layoutWith
        , paddingXY
        , spacing
        , width
        )
import Element.Background as Background
import Html exposing (Html)
import MessagesAndModels
    exposing
        ( Model
        , Msg
        , Page(..)
        )
import Tablet.About exposing (aboutPage)
import Tablet.Index exposing (homepage)
import Tablet.Navbar exposing (navBar)


tabletView : Model -> Html Msg
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
                    homepage

                AboutMe ->
                    aboutPage
    in
    layoutWith
        { options = [ focusStyle myFocusStyle ] }
        [ Background.image backgroundPath
        , inFront <| navBar model
        ]
    <|
        column
            [ width fill
            , height fill
            , spacing 40
            , paddingXY 0 100
            ]
            [ selectedPage
            ]
