module Phone.GithubComp exposing (..)

import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Phone.Colors exposing (..)


githubComponent =
    Element.column [ spacing 60 ]
        [ Element.paragraph
            [ Font.size 65
            ]
            [ text "Check out my github profile to see what projects I've been working on lately." ]
        , gitHubComponent
        ]


gitHubComponent =
    let
        linkAttributes =
            [ Font.size 60
            , padding 10
            , Background.color gray
            , padding 30
            , centerX
            , Border.rounded 18
            ]

        gitHubLink =
            newTabLink
                linkAttributes
                { url = gitHub
                , label = text "My Github"
                }

        siteSourceLink =
            newTabLink
                linkAttributes
                { url = siteSource
                , label = text "Site Source"
                }

        buttons =
            Element.row
                [ spacing 45
                , Background.color <|
                    rgb255 102 148 194
                , padding 30
                , Border.rounded 25
                ]
                [ gitHubLink
                , siteSourceLink
                ]
    in
    Element.column
        [ centerX
        , Border.rounded 32
        , centerY
        , Border.shadow
            { offset = ( 10, 10 )
            , size = 1
            , blur = 20
            , color = rgb255 90 90 90
            }
        ]
        [ buttons
        ]
