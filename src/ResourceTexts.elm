module ResourceTexts exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)


firstParagraphText : String
firstParagraphText =
    declarationOfIndependence


elmLangPrefText =
    "Elm is relatively new to me, however it has quickly become my favorite language for front end application development. It has also been my first real introduction to purely functional programming, which has me very interested in switching to the functional paradigm whenever possible/appropriate. This entire website is actually written in elm. During it's creation I was struggling to choose a color scheme for the site. To remedy this, I coded up a page for adjusting the colors on the fly. "


javaLangPrefText =
    ""


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


langPrefIntroText : String
langPrefIntroText =
    declarationOfIndependence


textStoryBody : String
textStoryBody =
    lotsOfText


emailAddress : String
emailAddress =
    "wcourtney31415@gmail.com"



--Below are some placeholder texts until I finish the site layout.


declarationOfIndependence : String
declarationOfIndependence =
    "We hold these truths to be self-evident, that all men are created equal, that they are endowed by their creator with certain unalienable rights, that among these are life, liberty and the pursuit of happiness. That to secure these rights, Governments are instituted among men, deriving their just powers from the consent of the governed. That whenever any form of government becomes destructive of these ends, it is the right of the people to alter or to abolish it, and to institute new Government, laying its foundation on such principles and organizing its powers in such form, as to them shall seem most likely to effect their safety and happiness."


lotsOfText : String
lotsOfText =
    "This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. This is some placeholder text until I decide to fill it in with actual personal information about myself. This is some long text as an example of what could be placed here. Once I have the layout for the website completed I will replace this text with actual information. Lets repeat this text so it appears to be a large paragraph. "
