module Comp_NavBar exposing (..)

import Colors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)


navBar : Model -> Element Msg
navBar model =
    Element.row
        [ alignRight
        , padding 10
        , Font.color white
        , spacing 20
        , bkgAttributes
            [ Background.color fortyTwo
            , alpha 0.6
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 0
                }
            ]
        ]
        [ Input.button
            (List.append
                []
                (speedIf (model.contactDropdown == Closed) [] [ Element.below dropNav ])
            )
            { onPress = Just <| Update { model | contactDropdown = flip model.contactDropdown }, label = text "Contact" }
        , text "About Me"
        , newTabLink []
            { url = gitHub
            , label = text "GitHub"
            }
        ]


dropNav : Element Msg
dropNav =
    Element.column
        [ Background.color dropNavColor
        , moveDown 15
        , padding 15

        --, alpha 0.6
        , Border.rounded 10
        , centerX
        , spacing 10
        ]
        [ Element.link [] { url = "mailto:" ++ myEmail, label = text "Email using Client" }
        , Input.button [] { onPress = Just <| CopyToClipboard myEmail, label = text "Copy Email to Clipboard" }
        ]
