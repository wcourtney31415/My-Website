module HelperFunctions exposing (..)

import Element exposing (..)


bkgAttributes : List (Attribute msg) -> Attribute msg
bkgAttributes attr =
    let
        attributes =
            List.append
                [ width fill
                , height fill
                ]
                attr
    in
    Element.behindContent <| Element.el attributes (text "")
