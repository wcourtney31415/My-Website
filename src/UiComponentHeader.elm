module UiComponentHeader exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceTexts exposing (..)
import UiComponentNavBar exposing (..)


header : Model -> Element Msg
header model =
    Element.wrappedRow
        [ Background.color <|
            hsvRecordToColor model.colorList.header
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        ]
    <|
        [ myName model ]
            ++ navBar model


myName : Model -> Element Msg
myName model =
    Input.button []
        { label =
            el
                [ alignLeft
                , Font.color white
                , Font.size 25
                , Font.bold
                , fontShadows
                ]
            <|
                text myNameAsString
        , onPress = Just (NavBarButtonClicked { model | selectedPage = Welcome })
        }
