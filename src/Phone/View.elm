module Phone.View exposing (phoneView)

import BasicColors exposing (white)
import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , column
        , el
        , fill
        , height
        , layout
        , minimum
        , padding
        , paddingEach
        , paddingXY
        , spacing
        , text
        , width
        )
import Element.Background as Background
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (Msg)
import Phone.AboutMeComp exposing (aboutMeComp)
import Phone.Colors exposing (grayThirtyFour, theBackground)
import Phone.EmailComp exposing (emailComponent)
import Phone.GithubComp exposing (githubComponent)
import Phone.HeadingComp exposing (heading)
import Phone.LanguagesComp exposing (languagesComp)


phoneView : Html Msg
phoneView =
    layout
        [ Background.color theBackground
        ]
        (column
            [ centerX
            ]
            [ heading
            , column
                [ padding 0
                ]
                [ block "Contact"
                    []
                    [ emailComponent ]
                , block "Languages"
                    []
                    [ languagesComp ]
                , block "Github"
                    []
                    [ githubComponent
                    ]
                , block "About Me"
                    [ paddingEach
                        { top = 30
                        , left = 20
                        , right = 20
                        , bottom = 200
                        }
                    ]
                    [ aboutMeComp
                    ]
                ]
            ]
        )


block : String -> List (Attribute Msg) -> List (Element Msg) -> Element Msg
block title attributes contents =
    column
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
         , padding 30
         ]
            ++ attributes
        )
    <|
        [ el
            [ Font.size 80
            , Font.bold
            ]
            (text title)
        , column
            [ width fill
            , height fill
            , paddingXY 20 0
            ]
            contents
        ]
