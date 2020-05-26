module View_Tablet exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
import Comp_NavBar exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Fonts exposing (..)
import Html exposing (Html)
import MessagesAndModels exposing (..)
import Page_About exposing (..)
import Page_Index exposing (..)


tabletView : Model -> Html.Html Msg
tabletView model =
    Element.layout [] (text "Tablet view!")
