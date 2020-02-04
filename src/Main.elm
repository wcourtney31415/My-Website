module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
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
        NavBarButtonClicked myModel ->
            myModel

        HueSliderMoved myModel ->
            myModel

        ABrightnessSliderMoved myModel ->
            myModel


view : Model -> Html.Html Msg
view model =
    website model



{- /////////////////////        Model and Messages       //////////////////// -}


type alias Model =
    { selectedPage : Page
    , hue : Int
    , saturation : Float
    , colors :
        { header : Float
        , footer : Float
        , quoteBlock1 : Float
        , quoteBlock2 : Float
        , inlineTitleBar : Float
        }
    }


init : Model
init =
    { selectedPage = ColorSelection
    , hue = 270
    , saturation = 1
    , colors =
        { header = 0.4
        , footer = 0.6
        , quoteBlock1 = 0.2
        , quoteBlock2 = 0.7
        , inlineTitleBar = 0.4
        }
    }


type Page
    = LanguagePreferences
    | MyStory
    | HireMe
    | ColorSelection


type Msg
    = NavBarButtonClicked Model
    | HueSliderMoved Model
    | ABrightnessSliderMoved Model



{- /////////////////////        Visual Components        //////////////////// -}
{- /////////////////////        Website Itself           //////////////////// -}


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
            , selectedPage model
            , footer model
            ]



{- /////////////        Website wide Visual Components        /////////////// -}


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


header : Model -> Element Msg
header model =
    Element.wrappedRow
        [ Background.color (getColor model model.colors.header)
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
        [ Background.color (getColor model model.colors.footer)
        , spacing 20
        , paddingXY 25 40
        , width fill
        , fontShadows
        , centerX
        ]
    <|
        navLinks
            model


inlineTitleBar : Model -> Color -> String -> Element msg
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


fontShadows : Attr decorative msg
fontShadows =
    Font.shadow
        { offset = ( 3, 3 )
        , blur = 4
        , color = black
        }


navLinks : Model -> List (Element Msg)
navLinks model =
    [ navBarButton model "Hire Me" HireMe
    , navBarButton model "Language Preferences" LanguagePreferences
    , navBarButton model "My Story" MyStory
    , navBarLink model "Site Source Code" "https://github.com/wcourtney31415"
    ]


navBarButton : Model -> String -> Page -> Element Msg
navBarButton model label page =
    Input.button
        [ alignRight
        , Font.color white
        ]
        { onPress = Just (NavBarButtonClicked { model | selectedPage = page })
        , label = text label
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


quoteBlock : Model -> Element msg
quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps = [ getColor model model.colors.quoteBlock1, getColor model model.colors.quoteBlock2 ]
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
    backgroundWrapper colorLeftBlock model <|
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
    backgroundWrapper colorRightBlock model <|
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



{- /////////////////////           Webpages           /////////////////////// -}


selectedPage : Model -> Element Msg
selectedPage model =
    case model.selectedPage of
        LanguagePreferences ->
            pageLanguagePreferences model

        MyStory ->
            pageMyStory model

        HireMe ->
            pageHireMe model

        ColorSelection ->
            pageColorSelection model



{- ////////////           Page: Language Preferences       ////////////////// -}


pageLanguagePreferences : Model -> Element Msg
pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model (getColor model model.colors.inlineTitleBar) "Language Preferences"
        , rightBlock model (elmLogo []) firstParagraphText
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) firstParagraphText
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]



{- ////////////                  Page: My Story            ////////////////// -}


pageMyStory : Model -> Element Msg
pageMyStory model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model (getColor model model.colors.inlineTitleBar) "Story"
        , myStoryTextBody
        ]


myStoryTextBody : Element Msg
myStoryTextBody =
    Element.textColumn [ spacing 50, padding 30, width (fill |> maximum 1200), centerX ]
        [ gameMakerLogo [ alignLeft, paddingXY 20 10 ]
        , paragraph [] [ text declarationOfIndependence ]
        , paragraph [] [ text declarationOfIndependence ]
        , cPlusPlusLogo [ alignRight, paddingXY 20 10 ]
        , paragraph [] [ text declarationOfIndependence ]
        , paragraph [] [ text declarationOfIndependence ]
        , ivyTechLogo
            [ alignLeft
            , paddingXY 20 10
            , Border.shadow
                { offset = ( 3, 3 )
                , size = 2
                , blur = 4
                , color = black
                }
            ]
        , paragraph [] [ text declarationOfIndependence ]
        ]



{- ////////////                  Page: HireMe            ////////////////// -}


pageHireMe : Model -> Element Msg
pageHireMe model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model (getColor model model.colors.inlineTitleBar) "Story"
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , myStoryTextBody
        ]



{- ////////////                  Page: ColorSelection            ////////////////// -}


pageColorSelection : Model -> Element Msg
pageColorSelection model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , hueSlider model
        , headerSlider model
        , footerSlider model
        , quoteBlock1Slider model
        , quoteBlock2Slider model
        , inlineTitleBarSlider model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model (getColor model model.colors.inlineTitleBar) "Language Preferences"
        , rightBlock model (elmLogo []) firstParagraphText
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) firstParagraphText
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]


headerSlider : Model -> Element Msg
headerSlider model =
    let
        colorsRecord =
            model.colors
    in
    makeSlider
        "Header: "
        model.colors.header
        (\new -> ABrightnessSliderMoved { model | colors = { colorsRecord | header = new } })


footerSlider : Model -> Element Msg
footerSlider model =
    let
        colorsRecord =
            model.colors
    in
    makeSlider
        "Footer: "
        model.colors.footer
        (\new -> ABrightnessSliderMoved { model | colors = { colorsRecord | footer = new } })


quoteBlock1Slider : Model -> Element Msg
quoteBlock1Slider model =
    let
        colorsRecord =
            model.colors
    in
    makeSlider
        "Quote Block Gradient 1: "
        model.colors.quoteBlock1
        (\new -> ABrightnessSliderMoved { model | colors = { colorsRecord | quoteBlock1 = new } })


quoteBlock2Slider : Model -> Element Msg
quoteBlock2Slider model =
    let
        colorsRecord =
            model.colors
    in
    makeSlider
        "Quote Block Gradient 2: "
        model.colors.quoteBlock2
        (\new -> ABrightnessSliderMoved { model | colors = { colorsRecord | quoteBlock2 = new } })


inlineTitleBarSlider : Model -> Element Msg
inlineTitleBarSlider model =
    let
        colorsRecord =
            model.colors
    in
    makeSlider
        "Inline Title Bar: "
        model.colors.inlineTitleBar
        (\new -> ABrightnessSliderMoved { model | colors = { colorsRecord | inlineTitleBar = new } })


makeSlider : String -> Float -> (Float -> Msg) -> Element Msg
makeSlider label myValue myAction =
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color (hsv 0 1 0.7)
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange = myAction
        , label =
            Input.labelAbove []
                (text (label ++ String.fromFloat myValue))
        , min = 0
        , max = 1
        , step = Just 0.01
        , value = myValue
        , thumb =
            Input.defaultThumb
        }


hueSlider : Model -> Element Msg
hueSlider model =
    Input.slider
        [ Element.height (Element.px 30)
        , Element.behindContent
            (Element.el
                [ Element.width Element.fill
                , Element.height (Element.px 2)
                , Element.centerY
                , Background.color (hsv 0 1 0.7)
                , Border.rounded 2
                ]
                Element.none
            )
        ]
        { onChange = \new -> HueSliderMoved { model | hue = round new }
        , label =
            Input.labelAbove []
                (text ("Hue: " ++ String.fromInt model.hue))
        , min = 0
        , max = 360
        , step = Just 1
        , value = toFloat model.hue
        , thumb =
            Input.defaultThumb
        }



{- /////////////////////        RESOURCES BELOW          //////////////////// -}
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
        , description = "Elm  Logo"
        }


javaLogo : List (Attribute Msg) -> Element Msg
javaLogo list =
    Element.image list
        { src = "/src/Images/JavaLogo.png"
        , description = "Java  Logo"
        }


visualStudioLogo : List (Attribute Msg) -> Element Msg
visualStudioLogo list =
    Element.image list
        { src = "/src/Images/VSLogo.png"
        , description = "Visual Studio  Logo"
        }


arduinoLogo : List (Attribute Msg) -> Element Msg
arduinoLogo list =
    Element.image list
        { src = "/src/Images/ArduinoLogo.png"
        , description = "Arduino Logo"
        }


gameMakerLogo : List (Attribute Msg) -> Element Msg
gameMakerLogo list =
    Element.image list
        { src = "/src/Images/GameMakerLogo.png"
        , description = "Game Maker Logo"
        }


ivyTechLogo : List (Attribute Msg) -> Element Msg
ivyTechLogo list =
    Element.image list
        { src = "/src/Images/IVYTechLogo.png"
        , description = "IVY Tech Community College Logo"
        }


cPlusPlusLogo : List (Attribute Msg) -> Element Msg
cPlusPlusLogo list =
    Element.image list
        { src = "/src/Images/CPlusPlusLogo.png"
        , description = "C++ Logo"
        }



{- /////////////////////        Resources: Colors        //////////////////// -}


getColor : Model -> Float -> Color
getColor model val =
    hsv model.hue model.saturation val


colorLeftBlock : Color
colorLeftBlock =
    hsv 0 0 0.93


colorRightBlock : Color
colorRightBlock =
    hsv 0 0 0.96


white : Color
white =
    rgb255 255 255 255


black : Color
black =
    rgb255 0 0 0


obviousRed : Color
obviousRed =
    rgb255 255 0 0


obviousGreen : Color
obviousGreen =
    rgb255 0 255 0


obviousBlue : Color
obviousBlue =
    rgb255 0 0 255



{- /////////////////////        Resources: Text          //////////////////// -}


firstParagraphText : String
firstParagraphText =
    declarationOfIndependence


quoteText : String
quoteText =
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"― Martin Fowler"


langPrefIntroText : String
langPrefIntroText =
    declarationOfIndependence


textStoryBody : String
textStoryBody =
    lotsOfText



--Below are some placeholder texts until I finish the site layout.


declarationOfIndependence : String
declarationOfIndependence =
    "We hold these truths to be self-evident, that all men are created equal, that they are endowed by their creator with certain unalienable rights, that among these are life, liberty and the pursuit of happiness. That to secure these rights, Governments are instituted among men, deriving their just powers from the consent of the governed. That whenever any form of government becomes destructive of these ends, it is the right of the people to alter or to abolish it, and to institute new Government, laying its foundation on such principles and organizing its powers in such form, as to them shall seem most likely to effect their safety and happiness."


lotsOfText : String
lotsOfText =
    "This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. "
