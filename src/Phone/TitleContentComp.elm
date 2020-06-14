module Phone.TitleContentComp exposing (titleContentComp)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (textElement)
import Phone.Shadow exposing (..)


titleContentComp :
    List (Attribute msg)
    ->
        { title : String
        , titleAttr : List (Attribute msg)
        , contentAttr : List (Attribute msg)
        , contents : List (Element msg)
        }
    -> Element msg
titleContentComp attributes record =
    let
        myAttributes =
            [ centerX
            , centerY
            , Border.rounded 32
            , phoneShadow
            ]
                ++ attributes
    in
    Element.column
        myAttributes
        [ title record
        , content record
        ]


title record =
    let
        myAttr =
            [ Font.size 70
            , Font.bold
            , width fill
            , paddingEach
                { top = 30
                , left = 30
                , right = 30
                , bottom = 18
                }
            , Border.roundEach
                { topLeft = 18
                , topRight = 18
                , bottomLeft = 0
                , bottomRight = 0
                }
            ]
                ++ record.titleAttr
    in
    Element.el
        myAttr
        (textElement
            [ centerX
            ]
            record.title
        )


content record =
    let
        myAttr =
            [ centerX
            , width fill
            , paddingEach
                { top = 18
                , left = 30
                , right = 30
                , bottom = 30
                }
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 18
                , bottomRight = 18
                }
            ]
                ++ record.contentAttr
    in
    Element.column
        myAttr
        record.contents
