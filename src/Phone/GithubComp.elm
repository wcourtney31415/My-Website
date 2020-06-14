module Phone.GithubComp exposing (githubComponent)

import Data exposing (gitHub, siteSource)
import Element
    exposing
        ( Element
        , centerX
        , newTabLink
        , padding
        , spacing
        , text
        )
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Phone.Colors
    exposing
        ( gray
        , grayThirtyFour
        , lighterBlue
        , lightestBlue
        )
import Phone.ContentComp exposing (contentComp)


githubComponent : Element msg
githubComponent =
    Element.column [ spacing 60 ]
        [ Element.paragraph
            [ Font.size 65
            ]
            [ text "Check out my github profile to see what projects I've been working on lately." ]
        , gitHubContentComp
        ]


gitHubContentComp : Element msg
gitHubContentComp =
    let
        linkAttributes =
            [ Font.size 60
            , padding 10
            , Background.color gray
            , padding 30
            , centerX
            , Border.rounded 18
            , Background.gradient
                { angle = 0
                , steps =
                    [ lightestBlue
                    , grayThirtyFour
                    ]
                }
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
    contentComp lighterBlue [ buttons ]
