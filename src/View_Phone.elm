module View_Phone exposing (..)

import Colors exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (..)


phoneView : Model -> Html.Html Msg
phoneView model =
    let
        vBorderSpacing =
            60

        hBorderSpacing =
            35
    in
    Element.layout
        []
        (Element.column
            [ centerX

            --, spacing 65
            ]
            [ heading
            , Element.column
                [ paddingEach { right = 0, left = 0, top = 0, bottom = 0 }
                ]
                [ block "Contact"
                    [--Background.gradient { angle = 0, steps = [ white, white ] }
                    ]
                    [ emailComponent ]
                , block "About Me" [] [ Element.el [ Font.size 50 ] (text "about me text") ]
                , block "Github" [] [ gitHubParagraph ]
                ]
            ]
        )


heading =
    let
        titleSdev =
            Element.row
                [ Font.bold
                , Font.size 95
                , Background.color mobileGray
                , centerX
                , width fill
                , padding 35
                ]
                [ Element.el
                    [ centerX
                    , Font.color white
                    ]
                    (text "Software Developer")
                ]

        titleName =
            Element.row
                [ centerX
                , Font.size 90
                , Background.color gray
                , width fill
                , padding 20
                ]
                [ Element.el
                    [ centerX
                    ]
                    (text "Wesley Courtney")
                ]
    in
    Element.column
        [ width fill
        ]
        [ titleSdev
        , titleName
        ]


gitHubParagraph =
    Element.column [ spacing 60 ]
        [ Element.paragraph
            [ Font.size 65
            ]
            [ text "Check out my github profile to see what projects I've been working on lately." ]
        , gitHubLink
        , Element.paragraph
            [ Font.size 45
            ]
            [ text "(You can also find the source code for this site there.)" ]
        ]


gitHubLink =
    Element.el
        [ Font.size 60
        , padding 10
        , Background.color gray
        , padding 30
        , centerX
        , Border.rounded 18
        ]
        (text "My Github")


emailComponent =
    Element.column
        [ centerX
        , centerY
        , spacing 35
        , Background.color mobileGray
        , padding 40
        , Border.rounded 32
        , centerY
        ]
        [ Element.el
            [ Font.size 70
            , centerX
            , Font.bold
            , Font.color white
            ]
            (text "Email")
        , Element.row
            [ spacing 45
            , centerX
            ]
            [ Element.el
                [ Font.size 60
                , padding 30
                , Background.color gray
                , Border.rounded 18
                ]
                (text "Email Now")
            , Element.el
                [ Font.size 60
                , padding 10
                , Background.color gray
                , padding 30
                , Border.rounded 18
                ]
                (text "To Clipboard")
            ]
        ]


block : String -> List (Attribute Msg) -> List (Element Msg) -> Element Msg
block title attributes contents =
    Element.column
        ([ height <| px 500 -- Needs changed to minimum height
         , width fill
         , Background.gradient { angle = 0, steps = [ white, twoThirtyFour ] }
         , spacing 40
         , paddingEach { left = 30, right = 30, top = 30, bottom = 30 }
         ]
            ++ attributes
        )
    <|
        [ Element.el
            [ Font.size 80
            , Font.bold
            ]
            (text title)
        , Element.column
            [ width fill
            , height fill
            , paddingEach { left = 20, right = 20, top = 0, bottom = 0 }

            --, Background.color blue
            ]
            contents
        ]
