module Phone.HeadingComp exposing (heading)

import Color as C
import Element
    exposing
        ( Element
        , centerX
        , column
        , fill
        , height
        , padding
        , paddingEach
        , rgb255
        , row
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import HelperFunctions exposing (convertColor, textElement)
import Phone.Colors exposing (myNameColor, viewHeaderCol)


heading : Element msg
heading =
    let
        titleSdev =
            row
                [ Font.bold
                , Font.size 95
                , Background.color viewHeaderCol
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
                [ textElement
                    [ centerX
                    , Font.color <| convertColor C.white
                    ]
                    "Software Developer"
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
            row
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
                , Font.color myNameColor
                , width fill
                , padding 20
                , paddingEach
                    { top = 20
                    , bottom = 70
                    , right = 20
                    , left = 20
                    }
                ]
                [ textElement
                    [ centerX
                    ]
                    "Wesley Courtney"
                ]
    in
    column
        [ width fill
        , height fill
        ]
        [ titleSdev
        , titleName
        ]
