module Phone.HeadingComp exposing (..)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import MessagesAndModels exposing (..)
import Phone.Colors exposing (..)


heading =
    let
        titleSdev =
            Element.row
                [ Font.bold
                , Font.size 95
                , Background.color lightBlue
                , centerX
                , width fill
                , padding 35
                , Border.roundEach
                    { topLeft = 0
                    , topRight = 0
                    , bottomLeft = 50
                    , bottomRight = 50
                    }
                ]
                [ Element.el
                    [ centerX
                    , Font.color white
                    ]
                    (text "Software Developer")
                ]

        titleName =
            let
                x =
                    234

                y =
                    x - 20

                z =
                    y - 20
            in
            Element.row
                [ centerX
                , Font.size 90
                , Background.gradient
                    { angle = 0
                    , steps =
                        List.repeat 1 (rgb255 x x x)
                            ++ List.repeat 1 (rgb255 y y y)
                            ++ List.repeat 1 (rgb255 z z z)
                    }
                , Font.bold
                , Font.color <| rgb255 52 89 127
                , width fill
                , padding 20
                , paddingEach
                    { top = 20
                    , bottom = 70
                    , right = 20
                    , left = 20
                    }
                ]
                [ Element.el
                    [ centerX
                    ]
                    (text "Wesley Courtney")
                ]
    in
    Element.column
        [ width fill
        , height fill
        ]
        [ titleSdev
        , titleName
        ]
