module Phone.View exposing (phoneView)

import BasicColors exposing (..)
import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HelperFunctions exposing (..)
import Html exposing (Html)
import MessagesAndModels exposing (..)
import Phone.Colors exposing (..)
import Phone.EmailComp exposing (..)
import Phone.GithubComp exposing (..)
import Phone.HeadingComp exposing (..)
import Phone.LanguagesComp exposing (..)


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
                , block "Languages"
                    []
                    [ languagesComp ]
                , block "About Me"
                    []
                    [ textElement [ Font.size 50 ] "about me text"
                    ]
                , block "Github"
                    [ paddingEach
                        { top = 30
                        , left = 20
                        , right = 20
                        , bottom = 200
                        }
                    ]
                    [ githubComponent
                    ]
                ]
            ]
        )


block : String -> List (Attribute Msg) -> List (Element Msg) -> Element Msg
block title attributes contents =
    Element.column
        ([ height (fill |> minimum 500)
         , width fill
         , Background.gradient
            { angle = 0
            , steps =
                [ white
                , grayThirtyFour
                ]
            }
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
            , paddingEach
                { left = 20
                , right = 20
                , top = 0
                , bottom = 0
                }
            ]
            contents
        ]
