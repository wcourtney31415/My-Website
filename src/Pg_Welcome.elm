module Pg_Welcome exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import ResourceColors exposing (..)
import Ui_InlineTitleBar exposing (..)
import Ui_ParagraphBlockContainer exposing (..)
import Ui_QuadBlock exposing (..)
import Ui_QuoteBlock exposing (..)
import Ui_SlideShow exposing (..)


pageWelcome : Model -> Element Msg
pageWelcome model =
    Element.column
        [ width fill
        , centerX
        ]
    <|
        [ slideShow model.activeSlide
        , quadGroup
        , inlineTitleBar model
            (hsvRecordToColor model.colorList.inlineTitleBar)
            "My Coding Style"
        ]
            ++ blockContainer paragraphCollection Left


paragraphCollection =
    [ functionalParagraph
    , cleanCodeParagraph
    , exampleParagraph
    , functionalParagraph
    , cleanCodeParagraph
    , exampleParagraph
    , functionalParagraph
    , cleanCodeParagraph
    ]


functionalParagraph =
    ( "Functional Programming"
    , "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. I was drawn to functional programming for several reasons. The built in immutability means that the code can't have side effects. The fewer side effects there are, the easier it is to locate and correct your errors. Because a functions scope is exclusive to the data passed into it, I find functional languages to be easier to perform unit tests on. One of the biggest driving factors in my choice to learn functional programming was preparing for the future. These languages are better suited for multi-threading, which seems to be the direction in which the hardware advancements are going. My first experience with FP was website development with the language Elm. After witnessing these benefits, it has inspired me to learn Haskell for my back end development. In doing this, I will be able to utilize those benefits in both my back end and front end development. "
    )


cleanCodeParagraph =
    ( "Clean Code"
    , "Writing clean code has become a very important part of my coding style. It’s quick and easy to slap some code together and accomplish the task at hand, but it is worth taking the extra time to clean it up so that when we must come back to it, it’s intuitive and comprehensible to myself and other developers. "
    )


exampleParagraph =
    ( "Example Paragraph"
    , "This is a placeholder example paragraph that I have put together to take up space and emulate real text. It should help to give an idea of what this UI component will look like. This is a placeholder example paragraph that I have put together to take up space and emulate real text. It should help to give an idea of what this UI component will look like. This is a placeholder example paragraph that I have put together to take up space and emulate real text. It should help to give an idea of what this UI component will look like. This is a placeholder example paragraph that I have put together to take up space and emulate real text. It should help to give an idea of what this UI component will look like. "
    )
