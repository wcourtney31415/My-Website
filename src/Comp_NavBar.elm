module Comp_NavBar exposing (navBar)

import Colors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)


contactButton : Model -> Element Msg
contactButton model =
    let
        flippedState : OpenOrClosed
        flippedState =
            flip model.contactDropdown

        toggledModel : Model
        toggledModel =
            { model | contactDropdown = flippedState }

        dropNavIfOpen : List (Attribute Msg)
        dropNavIfOpen =
            speedIf
                (model.contactDropdown == Closed)
                []
                [ Element.below dropNav ]
    in
    Input.button
        ([]
            ++ dropNavIfOpen
        )
        { onPress = Just <| Update toggledModel
        , label = text "Contact"
        }


gitHubLink : Element Msg
gitHubLink =
    newTabLink []
        { url = gitHub
        , label = text "GitHub"
        }


navBar : Model -> Element Msg
navBar model =
    let
        bkgAttr : Attribute Msg
        bkgAttr =
            bkgAttributes
                [ Background.color fortyTwo
                , alpha 0.6
                , Border.roundEach
                    { topLeft = 0
                    , topRight = 0
                    , bottomLeft = 10
                    , bottomRight = 0
                    }
                ]
    in
    Element.row
        [ alignRight
        , padding 10
        , Font.color white
        , spacing 20
        , bkgAttr
        ]
        [ contactButton model
        , text "About Me"
        , gitHubLink
        ]


dropNav : Element Msg
dropNav =
    Element.column
        [ Background.color dropNavColor
        , moveDown 15
        , padding 15
        , Border.rounded 10
        , centerX
        , spacing 10
        ]
        [ Element.link []
            { url = "mailto:" ++ myEmail
            , label = text "Email using Client"
            }
        , Input.button []
            { onPress = Just <| CopyToClipboard myEmail
            , label = text "Copy Email to Clipboard"
            }
        ]
