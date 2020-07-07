module Tablet.View exposing (tabletView)

import BasicColors exposing (white)
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
        , rgb255
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
        [ Background.gradient
            { angle = 0
            , steps =
                [ rgb255 179 219 255
                , rgb255 179 219 255
                , rgb255 179 219 255
                , rgb255 230 243 255
                , rgb255 230 243 255
                , rgb255 230 243 255
                , rgb255 230 243 255
                , white
                , white
                , white
                ]
            }
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
