module HelperFunctions exposing
    ( bkgAttributes
    , flip
    , speedIf
    , textElement
    )

import Element exposing (..)
import MessagesAndModels
    exposing
        ( OpenOrClosed(..)
        )


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
    Element.behindContent <| textElement attributes ""


speedIf : Bool -> a -> a -> a
speedIf condition result elseResult =
    if condition then
        result

    else
        elseResult


flip : OpenOrClosed -> OpenOrClosed
flip a =
    speedIf (a == Open) Closed Open


textElement attributes myText =
    Element.el attributes <| text myText
