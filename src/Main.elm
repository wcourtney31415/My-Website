module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import HsvToRgb exposing (..)
import Html
import MessagesAndModels exposing (..)
import Sliders exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


init : Model
init =
    { selectedPage = ColorSelection
    , header = { hue = 194, saturation = 0.73, value = 0.76 }
    , footer = { hue = 194, saturation = 0.73, value = 0.91 }
    , quoteBlock1 = { hue = 194, saturation = 0.73, value = 1 }
    , quoteBlock2 = { hue = 194, saturation = 0.73, value = 0.73 }
    , inlineTitleBar = { hue = 194, saturation = 0.73, value = 0.91 }
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NavBarButtonClicked myModel ->
            myModel

        AttemptedTextBoxChange ->
            model

        SliderMoved newModel ->
            newModel

        NewSliderMoved hsvRecord colorToBeUpdated ->
            case colorToBeUpdated of
                Header ->
                    { model | header = hsvRecord }

                QuoteBlock1 ->
                    { model | quoteBlock1 = hsvRecord }

                QuoteBlock2 ->
                    { model | quoteBlock2 = hsvRecord }

                InlineTitleBar ->
                    { model | inlineTitleBar = hsvRecord }

                Footer ->
                    { model | footer = hsvRecord }


view : Model -> Html.Html Msg
view model =
    website model


hsvRecordToColor : HsvRecord -> Color
hsvRecordToColor hsvRecord =
    hsv
        hsvRecord.hue
        hsvRecord.saturation
        hsvRecord.value



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
        [ Background.color <|
            hsvRecordToColor model.header
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
        [ Background.color <|
            hsvRecordToColor model.footer
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
    let
        underline =
            if model.selectedPage == page then
                [ Border.widthEach { bottom = 2, left = 0, right = 0, top = 0 } ]

            else
                []
    in
    Input.button
        ([ alignRight
         , Font.color white
         , Border.color white
         , paddingXY 0 4
         ]
            ++ underline
        )
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


quoteBlock : Model -> Element Msg
quoteBlock model =
    Element.paragraph
        [ Background.gradient
            { angle = pi
            , steps =
                [ hsvRecordToColor model.quoteBlock1
                , hsvRecordToColor model.quoteBlock2
                ]
            }
        , padding 65
        , width fill
        , fontShadows
        , Font.color white
        , Font.center
        ]
        [ quoteElement model
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


rightBlock : Model -> Element Msg -> Element Msg -> Element Msg
rightBlock model img txtElement =
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
                    [ txtElement
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

        Welcome ->
            pageWelcome model



{- ////////////           Page: Language Preferences       ////////////////// -}


pageLanguagePreferences : Model -> Element Msg
pageLanguagePreferences model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model
            (hsvRecordToColor model.inlineTitleBar)
            "Language Preferences"
        , rightBlock model (elmLogo []) (elmLangPrefElement model)
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) (elmLangPrefElement model)
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]



{- ////////////                  Page: My Story            ////////////////// -}


pageMyStory : Model -> Element Msg
pageMyStory model =
    Element.column
        [ width fill
        , centerX
        ]
        [ inlineTitleBar model
            (hsvRecordToColor model.inlineTitleBar)
            "Story"
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
        [ inlineTitleBar model
            (hsvRecordToColor model.inlineTitleBar)
            "Story"
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , myStoryTextBody
        ]



{- ////////////                  Page: ColorSelection            ////////////////// -}


pageWelcome : Model -> Element Msg
pageWelcome model =
    Element.column
        [ width fill
        , centerX
        ]
        [ slideShow
        , quadGroup
        , quoteBlock model
        , anchorTexts1
        , anchorTexts2
        , anchorTexts1
        ]


anchorTexts1 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach { top = 150, bottom = 150, right = 40, left = 40 }
        , Background.gradient
            { angle = pi
            , steps =
                [ hsv 136 0 1
                , hsv 136 0 0.95
                , hsv 136 0 0.97
                ]
            }
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach { top = 0, bottom = 20, left = 0, right = 0 }
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            ]
            [ text "And here's why it matters!" ]
        ]


anchorTexts2 =
    Element.column
        [ width (fill |> maximum 1200)
        , centerX
        , paddingEach { top = 150, bottom = 150, right = 40, left = 40 }
        , Background.gradient
            { angle = pi
            , steps =
                [ hsv 136 0 1
                , hsv 136 0 0.95
                , hsv 136 0 0.97
                ]
            }
        ]
        [ Element.paragraph
            [ Font.bold
            , Font.size 30
            , paddingEach { top = 0, bottom = 20, left = 0, right = 0 }
            , Font.alignRight
            ]
            [ text "Clean Code" ]
        , Element.paragraph
            [ Font.bold
            , Font.size 20
            , Font.alignRight
            ]
            [ text "And here's why it matters!" ]
        ]


slide =
    Element.row
        [ width fill, padding 20 ]
        [ elmLogo []
        , Element.column
            [ alignTop
            , paddingEach { right = 0, left = 40, top = 30, bottom = 0 }
            , width fill
            , spacing 15
            ]
            [ Element.paragraph
                [ Font.bold
                , Font.size 23
                ]
                [ text "Lets put some text here and see what exactly this looks like." ]
            , Element.paragraph
                [ Font.size 20
                ]
                [ text "Maybe some subtext?" ]
            , Element.paragraph
                [ Font.size 18
                ]
                [ text "Definitely subtext! It looks like this would be a decent place for a short informative paragraph. Yeah, the paragraph looks right right here." ]
            ]
        ]


slideShow : Element Msg
slideShow =
    let
        col1 =
            hsv 136 0 0.98

        col2 =
            hsv 136 0 0.9

        col3 =
            hsv 136 0 0.8
    in
    Element.row
        [ centerX
        , width (fill |> maximum 1200)
        , height
            (fill
                |> minimum 300
            )
        , Background.gradient
            { angle = pi
            , steps =
                [ col1
                , col2
                , col2
                , col2
                , col2
                , col2
                , col2
                , col3
                ]
            }
        ]
        [ Element.column
            [ paddingEach { left = 20, right = 20, bottom = 0, top = 0 }
            , Background.color (hsv 136 0 0.84)
            , alpha 0.08
            , height fill
            , alignLeft
            , width (fill |> maximum 30)
            , Border.shadow { blur = 15, color = hsv 270 0 0, offset = ( 3, 0 ), size = 0 }
            ]
            [ Element.el [ centerY, centerX ] (text "«") ]
        , slide
        , Element.column
            [ paddingEach { left = 20, right = 20, bottom = 0, top = 0 }
            , Background.color (hsv 136 0 0.84)
            , alpha 0.08
            , height fill
            , alignLeft
            , width (fill |> maximum 30)
            , Border.shadow { blur = 15, color = hsv 270 0 0, offset = ( -3, 0 ), size = 0 }
            ]
            [ Element.el [ centerY, centerX ] (text "»") ]
        ]


quadBlock =
    Element.column
        [ Background.color (hsv 136 0 0.94)
        , Border.rounded 5
        , Border.shadow { blur = 1.5, color = hsv 136 0 0.75, offset = ( 2, 2 ), size = 1 }
        , paddingXY 20 20
        , spacing 10
        , width (fill |> maximum 350)
        , centerX
        ]
        [ Element.el [ Font.size 25, Font.bold ] (text "Click Here for Details")
        , text "Detail 1"
        , text "Detail 2"
        , text "Detail 3"
        ]


quadGroup =
    Element.column
        [ spacing 40
        , padding 40
        , width (fill |> maximum 1200)
        , centerX
        ]
        [ Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        , Element.row
            [ spacing 10
            , width fill
            ]
            [ Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            , Element.column
                [ width fill
                , centerX
                ]
                [ quadBlock ]
            ]
        ]


pageColorSelection : Model -> Element Msg
pageColorSelection model =
    Element.column
        [ width fill
        , centerX
        ]
        [ quoteBlock model
        , sliderBlock model
        , leftBlock model (pictureOfMe []) langPrefIntroText
        , inlineTitleBar model
            (hsvRecordToColor model.inlineTitleBar)
            "Language Preferences"
        , rightBlock model (elmLogo []) (elmLangPrefElement model)
        , leftBlock model (javaLogo []) firstParagraphText
        , rightBlock model (visualStudioLogo []) (elmLangPrefElement model)
        , leftBlock model (arduinoLogo []) firstParagraphText
        ]


sliderBlock : Model -> Element Msg
sliderBlock model =
    Element.column
        [ width fill
        , centerX
        , width (fill |> maximum 1200)
        , padding 100
        , spacing 5
        ]
        [ dynamicSliders "Header: " Header model.header
        , dynamicSliders "Quote Block 1: " QuoteBlock1 model.quoteBlock1
        , dynamicSliders "Quote Block 2: " QuoteBlock2 model.quoteBlock2
        , dynamicSliders "Inline Title Bar: " InlineTitleBar model.inlineTitleBar
        , dynamicSliders "Footer: " Footer model.footer
        , paletteRecordTextBox model
        ]


paletteRecordString model =
    "Output record goes here."


paletteRecordTextBox : Model -> Element Msg
paletteRecordTextBox model =
    Input.text []
        { text = paletteRecordString model
        , label = Input.labelAbove [] (text "Color Record: ")
        , placeholder = Nothing
        , onChange = \new -> AttemptedTextBoxChange
        }



{- /////////////////////        RESOURCES BELOW          //////////////////// -}
{- /////////////////////        Resources: Images        //////////////////// -}


pictureOfMe : List (Attribute Msg) -> Element Msg
pictureOfMe list =
    Element.image list
        { src = "./Images/Example.jpg"
        , description = "Wesley Courtney"
        }


elmLogo : List (Attribute Msg) -> Element Msg
elmLogo list =
    Element.image list
        { src = "./Images/ElmLogo.png"
        , description = "Elm  Logo"
        }


javaLogo : List (Attribute Msg) -> Element Msg
javaLogo list =
    Element.image list
        { src = "./Images/JavaLogo.png"
        , description = "Java  Logo"
        }


visualStudioLogo : List (Attribute Msg) -> Element Msg
visualStudioLogo list =
    Element.image list
        { src = "./Images/VSLogo.png"
        , description = "Visual Studio  Logo"
        }


arduinoLogo : List (Attribute Msg) -> Element Msg
arduinoLogo list =
    Element.image list
        { src = "./Images/ArduinoLogo.png"
        , description = "Arduino Logo"
        }


gameMakerLogo : List (Attribute Msg) -> Element Msg
gameMakerLogo list =
    Element.image list
        { src = "./Images/GameMakerLogo.png"
        , description = "Game Maker Logo"
        }


ivyTechLogo : List (Attribute Msg) -> Element Msg
ivyTechLogo list =
    Element.image list
        { src = "./Images/IVYTechLogo.png"
        , description = "IVY Tech Community College Logo"
        }


cPlusPlusLogo : List (Attribute Msg) -> Element Msg
cPlusPlusLogo list =
    Element.image list
        { src = "./Images/CPlusPlusLogo.png"
        , description = "C++ Logo"
        }



{- /////////////////////        Resources: Colors        //////////////////// -}


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


obviousPurple : Color
obviousPurple =
    hsv 270 0.91 0.85


obviousOrange : Color
obviousOrange =
    hsv 30 0.91 0.99



{- /////////////////////        Resources: Text          //////////////////// -}


firstParagraphText : String
firstParagraphText =
    declarationOfIndependence



--</////////////////////////////////////////////////////////////////////////////>--


quoteText : String
quoteText =
    "\"Any fool can write code that a computer can understand. Good programmers write code that humans can understand.\"― Martin Fowler"


quoteElement : Model -> Element Msg
quoteElement model =
    Element.el [] (text quoteText)



--</////////////////////////////////////////////////////////////////////////////>--
--</////////////////////////////////////////////////////////////////////////////>--


elmLangPrefText =
    "Elm is relatively new to me, however it has quickly become my favorite language for front end application development. It has also been my first real introduction to purely functional programming, which has me very interested in switching to the functional paradigm whenever possible/appropriate. This entire website is actually written in elm. During it's creation I was struggling to choose a color scheme for the site. To remedy this, I coded up a page for adjusting the colors on the fly. "


colorSelectionLink model =
    Input.button
        [ Font.color obviousBlue ]
        { onPress = Just (NavBarButtonClicked { model | selectedPage = ColorSelection })
        , label = text "Click here to modify the site theme!"
        }


elmLangPrefElement model =
    Element.paragraph
        []
        [ text elmLangPrefText
        , colorSelectionLink model
        ]



--</////////////////////////////////////////////////////////////////////////////>--


langPrefIntroText : String
langPrefIntroText =
    declarationOfIndependence



--</////////////////////////////////////////////////////////////////////////////>--


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
