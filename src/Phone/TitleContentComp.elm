module Phone.TitleContentComp exposing (roundedBlock)

import BasicColors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)


roundedBlock : ( Color, Color ) -> String -> List (Element msg) -> Element msg
roundedBlock ( headerClr, contentClr ) myTitle contents =
    Element.column
        [ centerX
        , centerY
        , Border.rounded 32
        , centerY
        , Border.shadow { offset = ( 10, 10 ), size = 1, blur = 20, color = rgb255 90 90 90 }
        ]
        [ title headerClr myTitle
        , content contentClr contents
        ]


title bkgColor mytitle =
    Element.el
        [ Font.size 70
        , Font.bold
        , Font.color white
        , Background.color bkgColor
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
        (textElement
            [ centerX
            ]
            mytitle
        )


content : Color -> List (Element msg) -> Element msg
content bkgColor contents =
    Element.column
        [ centerX
        , Background.color bkgColor
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
        contents
