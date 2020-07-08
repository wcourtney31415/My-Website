module HelperFunctions exposing
    ( bkgAttributes
    , flip
    , speedIf
    , textElement
    )

import Color
    exposing
        ( toRgba
        )
import Element
    exposing
        ( Attribute
        , Element
        , behindContent
        , el
        , fill
        , height
        , rgba
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


toEUI : Color.Color -> Element.Color
toEUI color =
    let
        colorRecord =
            toRgba color

        elmUiColor =
            rgba colorRecord.red
                colorRecord.green
                colorRecord.blue
                colorRecord.alpha
    in
    elmUiColor
