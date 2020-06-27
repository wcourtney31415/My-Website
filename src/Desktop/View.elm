module Desktop.View exposing (desktopView)

import Data exposing (backgroundPath)
import Desktop.About exposing (aboutPage)
import Desktop.Index exposing (homepage)
import Desktop.Navbar exposing (navBar)
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


desktopView : Model -> Html Msg
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
            , paddingXY 0 10
            ]
            [ selectedPage
            ]
