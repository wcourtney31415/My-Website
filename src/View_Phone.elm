module View_Phone exposing (phoneView)

import Colors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
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
        [ Background.color <| rgb255 194 194 194
        ]
        (Element.column
            [ centerX
            ]
            [ heading
            , Element.column
                [ paddingEach
                    { right = 0
                    , left = 0
                    , top = 0
                    , bottom = 0
                    }
                ]
                [ block "Contact"
                    []
                    [ emailComponent ]
                , block "About Me"
                    []
                    [ Element.el [ Font.size 50 ] (text "about me text")
                    ]
                , block "Github"
                    [ paddingEach
                        { top = 30
                        , left = 20
                        , right = 20
                        , bottom = 200
                        }
                    ]
                    [ gitHubParagraph ]
                ]
            ]
        )


heading =
    let
        titleSdev =
            Element.row
                [ Font.bold
                , Font.size 95

                --, Background.color mobileGray
                , Background.color anotherBlue
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


gitHubParagraph =
    Element.column [ spacing 60 ]
        [ Element.paragraph
            [ Font.size 65
            ]
            [ text "Check out my github profile to see what projects I've been working on lately." ]
        , gitHubLink
        , Element.paragraph
            [ Font.size 55
            ]
            [ text "(You can also find the source code for this site there.)" ]
        ]


gitHubLink =
    newTabLink
        [ Font.size 60
        , padding 10
        , Background.color gray
        , padding 30
        , centerX
        , Border.rounded 18
        ]
        { url = gitHub, label = text "My Github" }


emailComponent =
    Element.column
        [ centerX
        , centerY
        , spacing 35

        --, Background.color mobileGray
        , Background.color anotherBlue
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
            [ Element.link
                [ Font.size 60
                , padding 30
                , Background.color gray
                , Border.rounded 18
                ]
                { url = "mailto:" ++ myEmail
                , label = text "Email Now"
                }
            , Input.button
                [ Font.size 60
                , padding 10
                , Background.color gray
                , padding 30
                , Border.rounded 18
                ]
                { onPress = Just <| CopyToClipboard myEmail
                , label = text "To Clipboard"
                }
            ]
        ]


block : String -> List (Attribute Msg) -> List (Element Msg) -> Element Msg
block title attributes contents =
    Element.column
        ([ height (fill |> minimum 500)
         , width fill
         , Background.gradient { angle = 0, steps = [ white, twoThirtyFour ] }
         , spacing 40
         , paddingEach
            { left = 30
            , right = 30
            , top = 30
            , bottom = 30
            }
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
            ]
            contents
        ]
