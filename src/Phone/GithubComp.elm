module Phone.GithubComp exposing (..)

import Data exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Phone.Colors exposing (..)
import Phone.ContentComp exposing (..)


githubComponent =
    Element.column [ spacing 60 ]
        [ Element.paragraph
            [ Font.size 65
            ]
            [ text "Check out my github profile to see what projects I've been working on lately." ]
        , gitHubContentComp
        ]


gitHubContentComp =
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
                ]
                [ gitHubLink
                , siteSourceLink
                ]
    in
    contentComp [ buttons ]
