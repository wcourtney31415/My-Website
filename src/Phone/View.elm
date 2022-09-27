module Phone.View exposing (phoneView)

import BasicColors exposing (white)
import Color as C
import Data exposing (facePath, myEmail, myName)
import Element
    exposing
        ( Attribute
        , Element
        , alignTop
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
        , px
        , rgb255
        , spacing
        , text
        , width
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)
import MessagesAndModels exposing (Msg)
import Phone.AboutMeComp exposing (aboutMeComp)
import Phone.Colors
    exposing
        ( grayThirtyFour
        , lighterBlue
        , theBackground
        )
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
                [ imageOfMe
                , block "Contact"
                    []
                    [ emailComponent ]
                , block "Github"
                    []
                    [ githubComponent
                    ]
                , block "Languages"
                    []
                    [ languagesComp ]
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


imageOfMe =
    let
        size =
            400
    in
    Element.el
        [ padding 25
        , centerX
        ]
    <|
        Element.column
            [ padding 20
            , alignTop
            , Border.rounded 1000
            , Background.color lighterBlue
            , centerX
            , Border.shadow { size = 1, blur = 10, offset = ( 4, 2 ), color = rgb255 0 0 0 }
            ]
            [ Element.image
                [ width <| px size
                , height <| px size
                ]
                { src = facePath
                , description = "An image of Wes Courtney"
                }
            ]


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
