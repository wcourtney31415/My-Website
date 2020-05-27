module View_Tablet exposing (tabletView)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (..)


tabletView : Model -> Html.Html Msg
tabletView model =
    Element.layout [] (text "Tablet view!")
