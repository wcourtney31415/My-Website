module PageWelcome exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HsvToRgb exposing (..)
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import ResourceImages exposing (..)
import ResourceTexts exposing (..)
import UiComponentGlobal exposing (..)


pageWelcome : Model -> Element Msg
pageWelcome model =
    Element.column
        [ width fill
        , centerX
        ]
        [ slideShow
        , quadGroup
        , quoteBlock model
        , anchorTexts1
        , anchorTexts2
        , anchorTexts1
        ]


anchorTexts1 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach
            { top = 150
            , bottom = 150
            , right = 40
            , left = 40
            }
        , anchorTexts1Gradient
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach
                { top = 0
                , bottom = 20
                , left = 0
                , right = 0
                }
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            ]
            [ text "And here's why it matters!" ]
        ]


anchorTexts2 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach
            { top = 150
            , bottom = 150
            , right = 40
            , left = 40
            }
        , anchorTexts2Gradient
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach
                { top = 0
                , bottom = 20
                , left = 0
                , right = 0
                }
            , Font.alignRight
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            , Font.alignRight
            ]
            [ text "And here's why it matters!" ]
        ]


slide =
    Element.row
        [ width fill, padding 20 ]
        [ elmLogo []
        , Element.column
            [ alignTop
            , paddingEach
                { right = 0
                , left = 40
                , top = 30
                , bottom = 0
                }
            , width fill
            , spacing 15
            ]
            [ Element.paragraph
                [ Font.bold
                , Font.size 23
                ]
                [ text "Lets put some text here and see what exactly this looks like." ]
            , Element.paragraph
                [ Font.size 20
                ]
                [ text "Maybe some subtext?" ]
            , Element.paragraph
                [ Font.size 18
                ]
                [ text "Definitely subtext! It looks like this would be a decent place for a short informative paragraph. Yeah, the paragraph looks right right here." ]
            ]
        ]


slideShow : Element Msg
slideShow =
    Element.row
        [ centerX
        , width (fill |> maximum 1200)
        , height
            (fill |> minimum 300)
        , slideShowGradient
        ]
        [ Element.column
            [ paddingEach
                { left = 20
                , right = 20
                , bottom = 0
                , top = 0
                }
            , Background.color obviousOrange
            , alpha 0.08
            , height fill
            , alignLeft
            , width (fill |> maximum 30)
            , Border.shadow
                { blur = 15
                , color = hsv 270 0 0
                , offset = ( 3, 0 )
                , size = 0
                }
            ]
            [ Element.el [ centerY, centerX ] (text "«") ]
        , slide
        , Element.column
            [ paddingEach
                { left = 20
                , right = 20
                , bottom = 0
                , top = 0
                }
            , Background.color (hsv 136 0 0.84)
            , alpha 0.08
            , height fill
            , alignLeft
            , width (fill |> maximum 30)
            , Border.shadow
                { blur = 15
                , color = hsv 270 0 0
                , offset = ( -3, 0 )
                , size = 0
                }
            ]
            [ Element.el [ centerY, centerX ] (text "»") ]
        ]


quadBlock =
    Element.column
        [ Background.color (hsv 136 0 0.94)
        , Border.rounded 5
        , Border.shadow { blur = 1.5, color = hsv 136 0 0.75, offset = ( 2, 2 ), size = 1 }
        , paddingXY 20 20
        , spacing 10
        , width (fill |> maximum 350)
        , centerX
        ]
        [ Element.el [ Font.size 25, Font.bold ] (text "Click Here for Details")
        , text "Detail 1"
        , text "Detail 2"
        , text "Detail 3"
        ]


quadGroup =
    Element.column
        [ spacing 40
        , padding 40
        , width (fill |> maximum 1200)
        , centerX
        ]
        [ Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        , Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        ]
