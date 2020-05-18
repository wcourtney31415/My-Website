module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Element.Region as Region
import HelperFunctions exposing (..)


main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type OpenOrClosed
    = Open
    | Closed


type alias Model =
    { contactDropdown : OpenOrClosed
    }


type Msg
    = Update Model


init =
    { contactDropdown = Closed }


update msg model =
    case msg of
        Update new ->
            new


myFocusStyle : FocusStyle
myFocusStyle =
    { borderColor = Nothing
    , backgroundColor = Nothing
    , shadow = Nothing
    }


view model =
    Element.layoutWith
        { options = [ focusStyle myFocusStyle ] }
        [ Background.image "./Images/background.jpg"
        ]
    <|
        Element.column
            [ width fill
            , height fill
            , spacing 40
            ]
            [ navBar model
            , homepageItems
            ]


dropNav =
    Element.column
        [ Background.color fortyTwo
        , moveDown 15
        , padding 15
        , alpha 0.6
        , Border.rounded 10
        , centerX
        , spacing 10
        ]
        [ text "Email using Client"
        , text "Copy Email to Clipboard"
        ]


flip a =
    speedIf (a == Open) Closed Open


navBar model =
    Element.row
        [ alignRight
        , padding 10
        , Font.color white
        , spacing 20
        , bkgAttributes
            [ Background.color fortyTwo
            , alpha 0.6
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 0
                }
            ]
        ]
        [ Input.button
            (List.append
                []
                (speedIf (model.contactDropdown == Closed) [] [ Element.below dropNav ])
            )
            { onPress = Just <| Update { model | contactDropdown = flip model.contactDropdown }, label = text "Contact" }
        , text "About Me"
        , newTabLink []
            { url = "https://github.com/wcourtney31415"
            , label = text "GitHub"
            }
        ]


speedIf condition result elseResult =
    if condition then
        result

    else
        elseResult


titleBox =
    Element.column
        [ centerX
        , centerY
        , padding 10
        , Font.color white
        , spacing 10
        , Font.bold
        , width fill
        , bkgAttributes
            [ Background.color fortyTwo
            , alpha 0.75
            , Border.roundEach
                { topLeft = 10
                , topRight = 10
                , bottomLeft = 0
                , bottomRight = 0
                }
            ]
        ]
        [ Element.el
            [ Font.size 40
            , centerX
            ]
            (text "Software Developer")
        , Element.el
            [ Font.size 20
            , centerX
            ]
            (text "Wesley Courtney")
        ]


frontPageParagraph =
    let
        frontPageText =
            "For professional inqueries, please contact me at wcourtney31415@gmail.com and I will get back to you as soon as possible. I look forward to speaking with you."
    in
    Element.paragraph
        [ centerX
        , centerY
        , Font.color white
        , padding 25
        , width <| px 800
        , bkgAttributes
            [ Background.color fortyTwo
            , alpha 0.6
            , Border.rounded 10
            , Border.roundEach
                { topLeft = 0
                , topRight = 0
                , bottomLeft = 10
                , bottomRight = 10
                }
            ]
        ]
        [ text frontPageText ]


homepageItems =
    Element.column
        [ centerX
        , centerY
        , moveUp 100
        ]
        [ titleBox, frontPageParagraph ]


white =
    rgb255 255 255 255


fortyTwo =
    rgb255 42 42 42
