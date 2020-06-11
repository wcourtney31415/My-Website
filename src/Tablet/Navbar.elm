module Tablet.Navbar exposing (navBar)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import MessagesAndModels exposing (..)
import Tablet.Colors exposing (..)


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
            --Also glows Contact if dropNav open
            speedIf
                (model.contactDropdown == Closed)
                []
                [ Element.below dropNav
                , Font.glow white 3.5
                ]
    in
    Input.button
        ([ hovered ]
            ++ dropNavIfOpen
        )
        { onPress = Just <| Update toggledModel
        , label = text "Contact"
        }


hovered =
    mouseOver [ Font.glow white 3.5 ]


gitHubLink : Element Msg
gitHubLink =
    newTabLink
        [ hovered ]
        { url = gitHub
        , label = text "GitHub"
        }


aboutMe : Model -> Element Msg
aboutMe model =
    Input.button [ hovered ]
        { onPress = Just <| Update { model | selectedPage = AboutMe }
        , label = text "About Me"
        }


navBar : Model -> Element Msg
navBar model =
    let
        bkgAttr : Attribute Msg
        bkgAttr =
            bkgAttributes
                [ Background.color grayFortyTwo
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
        , aboutMe model
        , gitHubLink
        ]


dropNav : Element Msg
dropNav =
    let
        emailClientLnk =
            Element.link [ hovered ]
                { url = "mailto:" ++ myEmail
                , label = text "Email using Client"
                }

        emailClipboardLnk =
            Input.button [ hovered ]
                { onPress = Just <| CopyToClipboard myEmail
                , label = text "Copy Email to Clipboard"
                }
    in
    Element.column
        [ Background.color dropNavColor
        , moveDown 15
        , padding 15
        , Border.rounded 10
        , centerX
        , spacing 10
        , Border.shadow
            { offset = ( 5, 5 )
            , size = 1
            , blur = 10
            , color = shadowColor
            }
        , Font.glow white 0 --override contactButton glow
        ]
        [ emailClientLnk
        , emailClipboardLnk
        ]
