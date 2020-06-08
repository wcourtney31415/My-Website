module T_Fonts exposing (..)

import Expect exposing (Expectation)
import Fonts exposing (..)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)


googleFontParsing1 : Test
googleFontParsing1 =
    let
        url =
            "https://fonts.googleapis.com/css2?family=Lato:wght@700&display=swap"

        result =
            getUntilDelimeter <| removeLeading url

        expected =
            "Lato"
    in
    test ("1st: " ++ result ++ " is equal to " ++ expected ++ "?")
        (\_ -> Expect.equal expected result)


googleFontParsing2 : Test
googleFontParsing2 =
    let
        url =
            "https://fonts.googleapis.com/css2?family=Playfair+Display&display=swap"

        result =
            getUntilDelimeter <| removeLeading url

        expected =
            "Playfair"
    in
    test ("2nd: " ++ result ++ " is equal to " ++ expected ++ "?")
        (\_ -> Expect.equal expected result)
