module Phone.View exposing (phoneView)

import BasicColors exposing (white)
import Data exposing (aboutMeRawText1)
import Element
    exposing
        ( Attribute
        , Element
        , centerX
        , fill
        , height
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
import Phone.Colors exposing (grayThirtyFour, theBackground)
import Phone.EmailComp exposing (emailComponent)
import Phone.GithubComp exposing (githubComponent)
import Phone.HeadingComp exposing (heading)
import Phone.LanguagesComp exposing (languagesComp)


phoneView : Html Msg
phoneView =
    Element.layout
        [ Background.color theBackground
        ]
        (Element.column
            [ centerX
            ]
            [ heading
            , Element.column
                [ padding 0
                ]
                [ block "Contact"
                    []
                    [ emailComponent ]
                , block "Languages"
                    []
                    [ languagesComp ]
                , block "About Me"
                    []
                    [ aboutMeParagraph
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


aboutMeParagraph : Element msg
aboutMeParagraph =
    Element.paragraph
        [ Font.size 50
        , spacing 30
        ]
        [ text aboutMeRawText1 ]


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
         , padding 30
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
            , paddingXY 20 0
            ]
            contents
        ]
