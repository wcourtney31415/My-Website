module Views exposing (..)

import Browser
import Browser.Events as Events
import Clipboard exposing (..)
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


classString : Device -> String
classString device =
    case device.class of
        Phone ->
            "Phone"

        Tablet ->
            "Tablet"

        Desktop ->
            "Desktop"

        BigDesktop ->
            "Big Desktop"


windowResElement : Model -> Element Msg
windowResElement model =
    let
        device =
            model.device

        orientationString =
            case device.orientation of
                Portrait ->
                    "Portrait"

                Landscape ->
                    "Landscape"
    in
    Element.column
        [ centerX
        , centerY
        , Font.size 60
        ]
        [ text <| "Width: " ++ String.fromInt model.windowWidth
        , text <| " Height: " ++ String.fromInt model.windowHeight
        , text <| " Class: " ++ classString device
        , text <| "Orientation: " ++ orientationString
        ]


desktopView : Model -> Html.Html Msg
desktopView model =
    let
        myFocusStyle : FocusStyle
        myFocusStyle =
            { borderColor = Nothing
            , backgroundColor = Nothing
            , shadow = Nothing
            }

        selectedPage =
            case model.selectedPage of
                Home ->
                    homepage model

                AboutMe ->
                    aboutPage model
    in
    Element.layoutWith
        { options = [ focusStyle myFocusStyle ] }
        [ Background.image backgroundPath

        --, customFont
        ]
    <|
        Element.column
            [ width fill
            , height fill
            , spacing 40
            ]
            [ navBar model
            , selectedPage
            , windowResElement model
            ]


tabletView : Model -> Html.Html Msg
tabletView model =
    Element.layout [] (text "Tablet view!")


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

        contact =
            Element.el
                [ Font.size 80
                , Font.bold
                ]
                (text "Contact")

        aboutMe =
            Element.el
                [ Font.size 80
                , Font.bold
                ]
                (text "About Me")

        gitHub =
            Element.el
                [ Font.size 80
                , Font.bold
                ]
                (text "Github")

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


white =
    rgb255 255 255 255


gray =
    rgb255 200 200 200


red =
    rgb255 255 0 0


siteView : Model -> Html Msg
siteView model =
    let
        deviceClass =
            model.device.class

        responsiveView =
            case deviceClass of
                Phone ->
                    phoneView model

                Tablet ->
                    tabletView model

                Desktop ->
                    desktopView model

                BigDesktop ->
                    desktopView model

        myView =
            if model.responsive then
                responsiveView

            else
                defaultView

        defaultView =
            desktopView model
    in
    myView
