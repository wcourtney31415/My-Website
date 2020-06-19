module Phone.TitleContentComp exposing (titleContentComp)

import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , centerY
        , column
        , el
        , fill
        , paddingEach
        , width
        )
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (textElement)
import Phone.Shadow exposing (phoneShadow)


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
    column
        myAttributes
        [ title record
        , content record
        ]


title :
    { contentAttr : List (Attribute msg)
    , contents : List (Element msg)
    , title : String
    , titleAttr : List (Attribute msg)
    }
    -> Element msg
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
    el
        myAttr
        (textElement
            [ centerX
            ]
            record.title
        )


content :
    { contentAttr : List (Attribute msg)
    , contents : List (Element msg)
    , title : String
    , titleAttr : List (Attribute msg)
    }
    -> Element msg
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
    column
        myAttr
        record.contents
