module Pg_Welcome exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import MessagesAndModels exposing (..)
import Ui_ParagraphBlock exposing (..)
import Ui_QuadBlock exposing (..)
import Ui_QuoteBlock exposing (..)
import Ui_SlideShow exposing (..)


pageWelcome : Model -> Element Msg
pageWelcome model =
    Element.column
        [ width fill
        , centerX
        ]
        [ slideShow model.activeSlide
        , quadGroup
        , quoteBlock model
        , functionalParagraphBlock
        , exampleParagraphBlock
        , functionalParagraphBlock
        ]


functionalParagraphBlock =
    paragraphBlock
        Left
        "Functional Programming"
        "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. Purely functional languages use very strict rules that enforce good coding habits. Additionally they are based around immutability, meaning that the state of a “Variable” never changes, you simply return a modified copy of that value. I personally have grown to love this, because between these two principles it significantly reduces unexpected side effects. Learning to use functional programming has, in a way, rewired the way I think about the code, and I’m eager to continue exploring that avenue."


exampleParagraphBlock =
    paragraphBlock
        Right
        "Functional Programming"
        "I have just taken my first few steps into the world of functional programming, and it has quickly become one of my new favorite coding styles. Purely functional languages use very strict rules that enforce good coding habits. Additionally they are based around immutability, meaning that the state of a “Variable” never changes, you simply return a modified copy of that value. I personally have grown to love this, because between these two principles it significantly reduces unexpected side effects. Learning to use functional programming has, in a way, rewired the way I think about the code, and I’m eager to continue exploring that avenue."
