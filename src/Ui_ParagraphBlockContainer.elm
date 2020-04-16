module Ui_ParagraphBlockContainer exposing (..)

import MessagesAndModels exposing (..)
import Ui_ParagraphBlock exposing (..)


blockContainer arr startingAlignment =
    let
        blockify inArr myAlign outArr =
            let
                tup =
                    Maybe.withDefault ( "", "" ) (List.head inArr)

                title =
                    Tuple.first tup

                paragraph =
                    Tuple.second tup

                elem =
                    paragraphBlock myAlign title paragraph

                nextInArr =
                    Maybe.withDefault [] (List.tail inArr)

                nextAlign =
                    if myAlign == Left then
                        Right

                    else
                        Left

                nextOutArr =
                    outArr ++ [ elem ]
            in
            if inArr == [] then
                outArr

            else
                blockify nextInArr nextAlign nextOutArr
    in
    blockify arr startingAlignment []
