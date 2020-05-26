module View_Phone exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
import Colors exposing (..)
import Comp_NavBar exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Fonts exposing (..)
import Html exposing (Html)
import MessagesAndModels exposing (..)
import Page_About exposing (..)
import Page_Index exposing (..)


phoneView : Model -> Html.Html Msg
phoneView model =
    let
        vBorderSpacing =
            60

        hBorderSpacing =
            35

        heading =
            Element.column
                [ spacing 25, centerX ]
                [ Element.el
                    [ Font.bold
                    , Font.size 95
                    ]
                    (text "Software Developer")
                , Element.el
                    [ centerX
                    , Font.size 90
                    ]
                    (text "Wesley Courtney")
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
                ]
                (text "My Github")

        emailComponent =
            Element.column
                [ centerX
                , centerY
                , spacing 35
                , Background.color <| white
                , padding 40
                ]
                [ Element.el
                    [ Font.size 70
                    , centerX
                    , Font.bold
                    ]
                    (text "Email")
                , Element.row [ spacing 45, centerX ]
                    [ Element.el
                        [ Font.size 60
                        , padding 30
                        , Background.color gray
                        ]
                        (text "Email Now")
                    , Element.el
                        [ Font.size 60
                        , padding 10
                        , Background.color gray
                        , padding 30
                        ]
                        (text "To Clipboard")
                    ]
                ]

        block : String -> List (Element Msg) -> Element Msg
        block title contents =
            Element.column
                [ height <| px 500

                --, Background.color red
                , width fill
                ]
            <|
                [ Element.el
                    [ Font.size 80
                    , Font.bold
                    ]
                    (text title)
                ]
                    ++ contents
    in
    Element.layout
        []
        (Element.column
            [ centerX
            , paddingEach
                { bottom = vBorderSpacing
                , left = hBorderSpacing
                , right = hBorderSpacing
                , top = vBorderSpacing
                }
            , spacing 65
            ]
            [ heading
            , block "Contact" [ emailComponent ]
            , block "About Me" []
            , block "Github" [ gitHubParagraph ]
            ]
        )
