module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import HsvToRgb exposing (..)
import Html


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


update : Msg -> Model -> Model
update msg model =
    case msg of
        SomethingHappened myModel ->
            myModel


view : Model -> Html.Html Msg
view model =
    website model



{- /////////////////////        Model and Messages       //////////////////// -}


type alias Model =
    { h : Int
    }


init : Model
init =
    { h = 0
    }


type Msg
    = SomethingHappened Model



{- /////////////////////        Visual Componen          //////////////////// -}
--Website Itself


website : Model -> Html.Html Msg
website model =
    Element.layout
        []
    <|
        Element.column
            [ Background.color <| white
            , width fill
            , paddingXY 0 0
            , height fill
            , centerX
            ]
            [ header model
            , pageLanguagePreferences model
            , footer model
            ]



--Website scoped visual components


myName : Model -> Element Msg
myName model =
    el
        [ alignLeft
        , Font.color white
        , Font.size 25
        , Font.bold
        , fontShadows
        ]
    <|
        text "Wesley Courtney"


navLinks : Model -> List (Element Msg)
navLinks model =
    [ navBarLink model "Link" "https://github.com/wcourtney31415"
    , navBarLink model "Language Preferences" "https://github.com/wcourtney31415"
    , navBarLink model "My Story" "https://github.com/wcourtney31415"
    , navBarLink model "Site Source Code" "https://github.com/wcourtney31415"
    ]


header : Model -> Element Msg
header model =
    Element.wrappedRow
        [ Background.color colorNavBar
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        ]
    <|
        [ myName model ]
            ++ navLinks model


footer : Model -> Element Msg
footer model =
    Element.wrappedRow
        [ Background.color colorNavBar
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        , centerX
        ]
    <|
        navLinks
            model


inlineTitleBar model color str =
    Element.paragraph
        [ Background.color color
        , padding 30
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        , Font.size 30
        , Font.bold
        ]
        [ text str
        ]


fontShadows =
    Font.shadow
        { offset = ( 3, 3 )
        , blur = 4
        , color = black
        }


navBarLink : Model -> String -> String -> Element Msg
navBarLink model label url =
    link
        [ alignRight
        , Font.color white
        ]
        { url = url
        , label = text label
        }


quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps = [ colorBody, hsv 120 0.52 0.6 ]
            }
        , padding 65
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        ]
        [ text quoteText
        ]


leftBlock : Model -> Element Msg -> String -> Element Msg
leftBlock model img txt =
    backgroundWrapper colorGray1 model <|
        Element.wrappedRow
            [ paddingXY 40 40
            , spacing 20
            , centerX
            , width (fill |> maximum 1200)
            ]
            [ img
            , Element.textColumn
                [ spacing 15
                , padding 20
                , alignLeft
                ]
                [ Element.paragraph []
                    [ text txt
                    ]
                ]
            ]


rightBlock : Model -> Element Msg -> String -> Element Msg
rightBlock model img txt =
    backgroundWrapper colorGray2 model <|
        Element.wrappedRow
            [ paddingXY 40 40
            , spacing 20
            , centerX
            , width (fill |> maximum 1200)
            ]
            [ Element.textColumn
                [ spacing 15
                , padding 20
                , alignLeft
                ]
                [ Element.paragraph []
                    [ text txt
                    ]
                ]
            , img
            ]



{- This background Wrapper is to allow the blocks to have a maximum
   width, but let their background span the width of the screen.
-}


backgroundWrapper : Color -> Model -> Element Msg -> Element Msg
backgroundWrapper color model el =
    Element.el
        [ Background.color color
        , width fill
        ]
        el



--Page: Language Preferences


pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model colorInlineTitleBar "Language Preferences"
        , rightBlock model (elmLogo []) firstParagraphText
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) firstParagraphText
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]


pageMyStory model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model colorInlineTitleBar "Story"
        , rightBlock model (elmLogo []) firstParagraphText
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) firstParagraphText
        , leftBlock model (arduinoLogo []) firstParagraphText
        , footer model
        ]



{- /////////////////////        Resources: Images        //////////////////// -}


pictureOfMe : List (Attribute Msg) -> Element Msg
pictureOfMe list =
    Element.image list
        { src = "/src/Images/Example.jpg"
        , description = "Wesley Courtney"
        }


elmLogo : List (Attribute Msg) -> Element Msg
elmLogo list =
    Element.image list
        { src = "/src/Images/ElmLogo.png"
        , description = "Elm"
        }


javaLogo : List (Attribute Msg) -> Element Msg
javaLogo list =
    Element.image list
        { src = "/src/Images/JavaLogo.png"
        , description = "Java"
        }


visualStudioLogo : List (Attribute Msg) -> Element Msg
visualStudioLogo list =
    Element.image list
        { src = "/src/Images/VSLogo.png"
        , description = "Visual Studio"
        }


arduinoLogo : List (Attribute Msg) -> Element Msg
arduinoLogo list =
    Element.image list
        { src = "/src/Images/ArduinoLogo.png"
        , description = "Arduino"
        }



{- /////////////////////        Resources: Colors        //////////////////// -}


myHue =
    160


colorGray1 =
    hsv 0 0 0.93


colorGray2 =
    hsv 0 0 0.96


colorInlineTitleBar =
    hsv 120 0.39 0.67


colorNavBar =
    hsv 120 1 0.5


colorBody =
    hsv 120 0.52 0.69


colorA =
    hsv myHue 1 1


colorB =
    hsv myHue 0.93 1


colorC =
    hsv myHue 0.83 1


colorD =
    hsv myHue 0.73 1


colorE =
    hsv myHue 0.63 1


colorF =
    hsv myHue 0.51 1


white =
    rgb255 255 255 255


black =
    rgb255 0 0 0


obviousRed =
    rgb255 255 0 0


obviousGreen =
    rgb255 0 255 0


obviousBlue =
    rgb255 0 0 255



{- /////////////////////        Resources: Text          //////////////////// -}


firstParagraphText : String
firstParagraphText =
    "We hold these truths to be self-evident, that all men are created equal, that they are endowed by their creator with certain unalienable rights, that among these are life, liberty and the pursuit of happiness. That to secure these rights, Governments are instituted among men, deriving their just powers from the consent of the governed. That whenever any form of government becomes destructive of these ends, it is the right of the people to alter or to abolish it, and to institute new Government, laying its foundation on such principles and organizing its powers in such form, as to them shall seem most likely to effect their safety and happiness."


quoteText : String
quoteText =
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"― Martin Fowler"


langPrefIntroText : String
langPrefIntroText =
    firstParagraphText
