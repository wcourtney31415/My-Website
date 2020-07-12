module HelperFunctions exposing
    ( bkgAttributes
    , convertColor
    , flip
    , speedIf
    , textElement
    )

import Color as C
import Element as E
    exposing
        ( Attribute
        , Element
        , behindContent
        , el
        , fill
        , height
        , text
        , width
        )
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
    behindContent <| textElement attributes ""


speedIf : Bool -> a -> a -> a
speedIf condition result elseResult =
    if condition then
        result

    else
        elseResult


flip : OpenOrClosed -> OpenOrClosed
flip a =
    speedIf (a == Open) Closed Open


textElement : List (Attribute msg) -> String -> Element msg
textElement attributes myText =
    el attributes <| text myText


convertColor : C.Color -> E.Color
convertColor color =
    let
        this =
            C.toRgba color

        eUIColor =
            E.rgba
                this.red
                this.green
                this.blue
                this.alpha
    in
    eUIColor
