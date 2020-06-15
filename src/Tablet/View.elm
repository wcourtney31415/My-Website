module Tablet.View exposing (tabletView)

import Data exposing (backgroundPath)
import Element
    exposing
        ( FocusStyle
        , fill
        , focusStyle
        , height
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
